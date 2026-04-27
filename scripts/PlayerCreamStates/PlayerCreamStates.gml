function player_is_fan_flying(_phase)
{{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Fly
            flight_reset_time = 1;
            
            // Detach from ground
            player_ground(false);
            
            // Animate
            animation_start("flight");
            break;
        }
        case PHASE.STEP:
        {
            // Apply flight resistance
            /*var boost_mode_save = db_read(SAVE_DATABASE, "true", "boost_mode");
            if (boost_mode_config)
            {
                if (abs(x_speed) > flight_drag_thresholds[boost_index])
                {
                    x_speed += -air_acceleration * sign(x_speed);
                }
            }*/
            
            /* AUTHOR NOTE: The code above applies a strict cap, which is too drastic a change imo.
            I believe disabling it makes it behave closer to Advance 3. */
            
            // Accelerate
            if (input_axis_x != 0)
            {
                // Turn
                if (image_xscale != input_axis_x and flight_time < FAN_FLIGHT_DURATION)
                {
                    animation_start(anim_core.name, 1);
                }
                
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
            if (player_try_air_skill()) exit;
            
            // Cancel
            if (input_button.jump.pressed and input_axis_y == 1)
            {
                animation_start("flight_cancel");
                return player_perform(player_is_falling, false);
            }
            
            // Ascend
            if (flight_reset_time != 1)
            {
                if (y_speed >= FAN_FLIGHT_THRESHOLD)
                {
                    y_speed -= flight_ascent_force;
                    if (++flight_reset_time == 32) flight_reset_time = 1;
                }
                else
                {
                    flight_reset_time = 1;
                }
            }
            else
            {
                var flight_style_config = db_read(CONFIG_DATABASE, CONFIG_DEFAULT_FLIGHT_STYLE, "flight_style");
                var input_flight = input_button.jump.pressed or (flight_style_config == CONFIG_FLIGHT_STYLE.ADVENTURE and input_button.jump.check);
                if (input_flight and flight_time < FAN_FLIGHT_DURATION and y_speed >= FAN_FLIGHT_THRESHOLD)
                {
                    flight_reset_time = 2;
                }
                
                // Fall
                y_speed += flight_base_force;
            }
            
            // Apply air resistance
            if (y_speed < 0 and y_speed > -4) x_speed -= x_speed / 32;
            
            // Ceiling cap
            if (y < 0 and y_speed < 0) y_speed = 0;
            
            // Timer
            if (flight_time < FAN_FLIGHT_DURATION) flight_time++;
            
            // Animate
            if (flight_time < FAN_FLIGHT_DURATION)
            {
                animation_start("flight");
            }
            else
            {
                animation_start("flight_tired");
            }
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}}