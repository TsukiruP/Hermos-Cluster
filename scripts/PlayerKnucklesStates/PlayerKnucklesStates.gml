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
            
            // Fall
            if (y_speed < 0.5)
            {
                y_speed += 0.09375;
            }
            else
            {
                y_speed -= 0.09375;
            }
            
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
            if (on_ground) player_ground(false);
            
            // Animate
            animation_start("glide_fall");
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
                    if (local_direction >= 45 and local_direction <= 315) return player_perform(x_speed != 0 ? player_is_running : player_is_standing);
                    
                    anim_core.variant++;
                    control_lock_alarm = 15;
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