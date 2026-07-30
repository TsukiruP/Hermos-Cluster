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
                var wall_radius = x_wall_radius + 1;
                var glide_xscale = (glide_direction >= 90 ? -1 : 1);
                
                var dx = array_create(2, 0);
                var dy = array_create(2, 0);
                
                // Wall sensors
                if (mask_sin == 0)
                {
                    var oy = array_create(2, y_int);
                    var ox = array_create(2, x_int + mask_cos * glide_xscale * wall_radius);
                    oy[0] -= y_radius;
                    oy[1] += y_radius;
                }
                else
                {
                    var ox = array_create(2, x_int);
                    var oy = array_create(2, y_int - mask_sin * glide_xscale * wall_radius);
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
            // Dash
            if (input_button.jump.pressed and input_axis_x == image_xscale)
            {
                return player_perform(player_is_dash_climbing);
            }
            
            // Jump
            if (player_knuckles_try_wall_jump()) exit;
            
            // Idle
            animation_start("wall_climb", 2);
            
            // Climb
            if (input_axis_y == -1)
            {
                var wall_dist = player_calculate_wall_distance(-y_radius);
                
                if (wall_dist > 2)
                {
                    return player_perform(player_is_wall_lifting);
                }
                else if (wall_dist > 0)
                {
                    return player_perform(player_is_glide_falling);
                }
                else if (wall_dist < 0)
                {
                    if (player_knuckles_try_wall_jump()) exit;
                }
                else
                {
                    if (not player_boxcast(tilemaps, -9))
                    {
                        y_speed = -0.75;
                    }
                    
                    animation_start("wall_climb", 0);
                }
            }
            else if (input_axis_y == 1)
            {
                // Fall
                if (player_calculate_wall_distance(y_radius) > 0) return player_perform(player_is_glide_falling);
                
                // Climb down
                y_speed = 0.75;
                animation_start("wall_climb", 1);
            }
            else
            {
                // Fall
                if (player_calculate_wall_distance() > 0) return player_perform(player_is_glide_falling);
                
                // Stop
                y_speed = 0;
            }
            
            // Move
            player_move_in_air();
            if (state_changed) exit;
            
            // Land
            if (on_ground) return player_perform(player_is_glide_falling);
            
            // Animate
            if (anim_core.name == "wall_grab" and animation_is_finished()) animation_start("wall_climb");
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}

function player_is_wall_lifting(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Lift
            x_speed = 0;
            y_speed = 0;
            
            if (mask_sin == 0)
            {
                y -= mask_cos * y_radius;
            }
            else
            {
                x -= mask_sin * y_radius;
            }
            
            // Animate
            animation_start("wall_climb", 3);
            break;
        }
        case PHASE.STEP:
        {
            // Move
            player_move_in_air();
            if (state_changed) exit;
            
            // Animate
            if (animation_is_finished())
            {
                switch (anim_core.variant)
                {
                    case 3:
                    {
                        if (mask_sin == 0)
                        {
                            x += mask_cos * image_xscale * 16;
                            y -= mask_cos * y_radius;
                        }
                        else
                        {
                            y -= mask_sin * image_xscale * 16;
                            x -= mask_sin * y_radius;
                        }
                        
                        anim_core.variant++;
                        break;
                    }
                    case 4:
                    {
                        // Stand
                        if (animation_is_finished()) return player_perform(player_is_standing);
                        break;
                    }
                }
            }
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}

function player_is_dash_climbing(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Set charge
            spin_dash_charge = 0;
            
            // Animate
            animation_start("dash_climb");
            
            // Sound
            audio_play_sfx(sfxSpinRev);
            break;
        }
        case PHASE.STEP:
        {
            // Move
            player_move_in_air();
            if (state_changed) exit;
            
            // Fall
            if (player_calculate_wall_distance() > 0) return player_perform(player_is_glide_falling);
            
            // Release
            if (input_axis_x != image_xscale)
            {
                x_speed = image_xscale * (6 + spin_dash_charge * (3 / 8));
                direction = angle_wrap(mask_direction + image_xscale * 90);
                mask_direction = direction;
                local_direction = angle_wrap(image_xscale * 90);
                camera_set_y_lag_time(16);
                audio_stop_sound(sfxSpinRev);
                audio_play_sfx(sfxSpinDash);
                return player_perform(player_is_rolling);
            }
            
            // Charge / atrophy
            if (input_button.jump.pressed)
            {
                // Charge
                spin_dash_charge = min(spin_dash_charge + 2, 8);
                
                // Sound
                var rev_sfx = audio_play_sfx(sfxSpinRev);
                audio_sound_pitch(rev_sfx, 1 + spin_dash_charge * 0.0625);
            }
            else
            {
                spin_dash_charge *= 0.96875;
            }
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}