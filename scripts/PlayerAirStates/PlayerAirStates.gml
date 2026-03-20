function player_is_falling(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            if (not (aerial_flags & AERIAL_FLAG_PLATFORM))
            {
                // Rise
                y_speed = -dsin(local_direction) * x_speed;
                x_speed *= dcos(local_direction);
            }
            
            // Detach from ground
            player_ground(undefined);
            
            // Animate
            animation_start("fall", 0, ["roll"]);
            break;
        }
        case PHASE.STEP:
        {
            // Accelerate
            if (input_axis_x != 0)
            {
                image_xscale = input_sign;
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
            if (on_ground) return player_perform(x_speed != 0 ? player_is_running : player_is_standing);
            
            // Apply air resistance
            if (y_speed < 0 and y_speed > -4) x_speed -= x_speed / 32;
            
            // Fall
            if (y_speed < gravity_cap) y_speed = min(y_speed + gravity_force, gravity_cap);
            break;
        }
        case PHASE.EXIT:
        {
            // Reset flags
            aerial_flags &= ~AERIAL_FLAG_PLATFORM;
            break;
        }
    }
}

function player_is_jumping(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Set flags
            jump_cap = true;
            
            // Leap
            var sine = dsin(local_direction);
            var cosine = dcos(local_direction);
            y_speed = -sine * x_speed - cosine * jump_height;
            x_speed = cosine * x_speed - sine * jump_height;
            
            // Detach from ground
            player_ground(undefined);
            
            // Animate
            animation_start("jump", 0);
            break;
        }
        case PHASE.STEP:
        {
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
            if (on_ground) return player_perform(x_speed != 0 ? player_is_running : player_is_standing);
            
            // Apply release height
            var input_jump = (jump_alternate == 2 ? input_button.aux.check : input_button.jump.check);
            if (jump_cap and y_speed < -jump_release and not input_jump) y_speed = -jump_release;
            
            // Apply air resistance
            if (y_speed < 0 and y_speed > -4) x_speed -= x_speed / 32;
            
            // Fall
            if (y_speed < gravity_cap) y_speed = min(y_speed + gravity_force, gravity_cap);
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}