function player_is_gliding(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Glide
            y_speed += 1.5;
            if (y_speed < 0) y_speed = 0;
            
            glide_speed = 3;
            glide_sign = image_xscale;
            glide_direction = (image_xscale == -1 ? 180 : 0);
            
            // Animate
            animation_start("glide");
            break;
        }
        case PHASE.STEP:
        {
            // Drop
            if (not input_button.jump.check)
            {
                if (x_speed != 0) image_xscale = sign(x_speed);
                x_speed /= 4;
                return player_perform(player_is_glide_falling);
            }
            
            // Accelerate
            if (glide_speed < 3)
            {
                glide_speed += 6 / 256;
            }
            else if (abs(glide_direction) mod 180 == 0 and glide_speed < 15)
            {
                glide_speed += 3 / 256;
            }
            
            // TODO: Subtract 9 / 256 when underwaterand above 3.0.
            
            // Turn
            if (input_axis_x != 0) glide_sign = input_axis_x;
            glide_direction = clamp(glide_direction - (2.8125 * glide_sign), 0 , 180);
            x_speed = glide_speed * dcos(glide_direction);
            
            // Move
            player_move_in_air();
            if (state_changed) exit;
            
            // Land
            if (on_ground)
            {
                if (local_direction >= 45 and local_direction <= 315)
                {
                    image_xscale = (glide_direction >= 90 ? -1 : 1);
                    return player_perform(player_is_running);   
                }
                
                if (x_speed != 0) image_xscale = sign(x_speed);
                return player_perform(player_is_glide_sliding);
            }
            
            // Wall grab
            if (wall_sign != 0)
            {
                var x_int = x div 1;
                var y_int = y div 1;
                var glide_xscale = (glide_direction >= 90 ? -1 : 1);
                
                var dx = array_create(2, 0);
                var dy = array_create(2, 0);
                
                // Wall sensors
                if (mask_sin == 0)
                {
                    var oy = array_create(2, y_int);
                    var ox = array_create(2, x_int + mask_cos * (glide_xscale * (x_radius + 2)));
                    oy[0] -= y_radius;
                    oy[1] += y_radius;
                }
                else
                {
                    var ox = array_create(2, x_int);
                    var oy = array_create(2, y_int - mask_sin * (glide_xscale * (x_radius + 2)));
                    ox[0] -= y_radius;
                    ox[1] += y_radius;
                }
                
                // Extend / regress sensors
                for (var n = 0; n < 2; n++)
                {
                    repeat (16)
                    {
                        if (collision_point(ox[n] + dx[n], oy[n] + dy[n], tilemaps, true, false) == noone)
                        {
                            dx[n] += mask_cos * glide_xscale;
                            dy[n] -= mask_sin * glide_xscale;
                        }
                        else if (collision_point(ox[n] + dx[n], oy[n] + dy[n], tilemaps, true, false) != noone)
                        {
                            dx[n] -= mask_cos * glide_xscale;
                            dy[n] += mask_sin * glide_xscale;
                        }
                        else
                        {
                            break;
                        }
                    }
                }
                
                // Fall against uneven walls
                if (mask_sin == 0 ? dx[0] != dx[1] : dy[0] != dy[1])
                {
                    return player_perform(player_is_glide_falling);
                }
                else
                {
                    if (mask_sin == 0)
                    {
                        var result = (glide_xscale == -1 or mask_cos == -1 ? min(dx[0], dx[1]) : max(dx[0], dx[1]));
                        if (player_raycast(tilemaps, glide_xscale * (x_radius + 1), y_radius + 1)) return player_perform(player_is_glide_falling);
                        x += result;
                    }
                    else
                    {
                        var result = (glide_xscale == -1 or mask_sin == -1 ? max(dy[0], dy[1]) : min(dy[0], dy[1]));
                        if (player_raycast(tilemaps, glide_xscale * (x_radius + 1), y_radius + 1)) return player_perform(player_is_glide_falling);
                        y += result;
                    }
                }
                
                return player_perform(player_is_wall_climbing);
            }
            
            // Fall
            y_speed += (y_speed < 0.5 ? 0.09375 : -0.09375);
            
            // Animate
            if (glide_direction mod 180 == 0)
            {
                if (x_speed != 0) image_xscale = sign(x_speed);
                animation_start("glide");
            }
            else
            {
                image_xscale = 1;
                animation_start("glide_turn", glide_direction div 45);
            }
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}

function player_is_glide_sliding(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Animate
            animation_start("glide_slide");
            break;
        }
        case PHASE.STEP:
        {
            // Slide
            if (input_button.jump.check) x_speed -= min(abs(x_speed), 0.09375) * sign(x_speed);
            
            // Move
            player_move_on_ground();
            if (state_changed) exit;
            
            // Fall
            if (not on_ground) return player_perform(player_is_glide_falling);
            
            // Slide down steep slopes
            if (mask_direction != gravity_direction)
            {
                control_lock_time = SLIDE_DURATION;
                return player_perform(player_is_running);
            }
            
            // Stand
            if (not input_button.jump.check or x_speed == 0)
            {
                x_speed = 0;
                control_lock_time = 15;
                return player_perform(player_is_standing);
            }
            
            // Animate
            if (x_speed != 0 and anim_core.time mod 4 == 0)
            {
                // Create brake dust
                var ox = x + dsin(direction) * y_radius;
                var oy = y + dcos(direction) * y_radius;
                particle_create(ox, oy, global.animations.brake_dust);
            }
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}

function player_is_glide_falling(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Detach from ground
            player_ground(false);
            
            // Animate
            animation_start("glide_fall", -1, ["glide_slide"]);
            break;
        }
        case PHASE.STEP:
        {
            if (on_ground)
            {
                // Move
                player_move_on_ground();
                if (state_changed) exit;
                
                // Fall
                if (not on_ground) return player_perform(player_is_glide_falling);
                
                // Stand
                if (animation_is_finished()) return player_perform(player_is_standing);
            }
            else
            {
                // Accelerate
                if (input_axis_x != 0)
                {
                    image_xscale = input_axis_x;
                    if (abs(x_speed) < speed_cap or sign(x_speed) != input_axis_x)
                    {
                        x_speed += air_acceleration * input_axis_x;
                        if (abs(x_speed) > speed_cap and sign(x_speed) == input_axis_x)
                        {
                            x_speed = speed_cap * input_axis_x;
                        }
                    }
                }
                
                // Apply speed limit
                if (abs(x_speed) > speed_limit) x_speed = speed_limit * sign(x_speed);
                
                // Move
                player_move_in_air();
                if (state_changed) exit;
                
                // Land
                if (on_ground)
                {
                    x_speed = 0;
                    if (local_direction >= 45 and local_direction <= 315)
                    {
                        return player_perform(x_speed != 0 ? player_is_running : player_is_standing);
                    }
                    
                    control_lock_alarm = 15;
                    animation_start("glide_fall", 1);
                    return player_perform(player_is_glide_falling, false);
                }
                
                // Apply air resistance
                if (y_speed < 0 and y_speed > -4) x_speed -= x_speed / 32;
                
                // Fall
                if (y_speed < gravity_cap) y_speed = min(y_speed + gravity_force, gravity_cap);
            }
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}

function player_is_wall_climbing(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Climb
            x_speed = 0;
            y_speed = 0;
            
            // Animate
            animation_start("wall_grab");
            break;
        }
        case PHASE.STEP:
        {
            if (input_axis_y == -1)
            {
                var x_int = x div 1;
                var y_int = y div 1;
                
                var dx = 0;
                var dy = 0;
                
                // Climb sensors
                if (mask_sin == 0)
                {
                    var ox = x_int + mask_cos * (image_xscale * (x_radius + 2));
                    var oy = y_int - mask_cos * y_radius;
                }
                else
                {
                    var ox = x_int - mask_sin * y_radius;
                    var oy = y_int - mask_sin * (image_xscale * (x_radius + 2));
                }
                
                // Extend / regress sensors
                repeat (16)
                {
                    if (collision_point(ox + dx, oy + dy, tilemaps, true, false) == noone)
                    {
                        dx += mask_cos * image_xscale;
                        dy -= mask_sin * image_xscale;
                    }
                    else if (collision_point(ox + dx, oy + dy, tilemaps, true, false) != noone)
                    {
                        dx -= mask_cos * image_xscale;
                        dy += mask_sin * image_xscale;
                    }
                }
                
                var result = (mask_sin == 0 ? abs(dx) : abs(dy));
                
                if (result > 2)
                {
                    return player_perform(player_is_wall_rising);
                }
                else if (result > 0)
                {
                    return player_perform(player_is_glide_falling);
                }
                else if (result < 0)
                {
                    if (player_knuckles_try_wall_jump()) exit;
                }
                else
                {
                    
                }
            }
            
            // Move
            player_move_in_air();
            if (state_changed) exit;
            
            // Land
            if (on_ground) return player_perform(x_speed != 0 ? player_is_running : player_is_standing);
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}

function player_is_wall_rising(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Animate
            break;
        }
        case PHASE.STEP:
        {
            // Move
            player_move_on_ground();
            if (state_changed) exit;
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}