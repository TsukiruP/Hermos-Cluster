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
            
            // Detach from ground
            player_ground(false);
            break;
        }
        case PHASE.STEP:
        {
            // Drop
            if (not input_button.jump.check) return player_perform(player_is_falling, false);
            
            // Accelerate
            if (glide_speed < 3)
            {
                glide_speed += 6 / 256;
            }
            else if (abs(glide_direction) mod 180 == 0 and glide_speed < 15)
            {
                glide_speed += 3 / 256;
            }
            
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
                if (x_speed != 0) image_xscale = sign(x_speed);
                return player_perform(player_is_running);
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