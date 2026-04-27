function player_is_sprung(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Detach from ground
            player_ground(false);
            
            // Animate
            animation_start(abs(x_speed) > 2.5 ? "spring_twirl" : "spring", 0);
            break;
        }
        case PHASE.STEP:
        {
            // Trick Action
            if (state_time > 0) state_time--;
            if (player_try_trick_action(state_time)) exit;
            
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
            if (on_ground) return player_perform(x_speed != 0 ? player_is_running : player_is_standing);
            
            // Skill
            player_try_air_skill();
            
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