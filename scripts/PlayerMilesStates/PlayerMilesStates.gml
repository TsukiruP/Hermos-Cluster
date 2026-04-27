function player_is_propeller_flying(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Fly
            flight_reset_time = 1;
            flight_force = flight_base_force;
            
            // Detach from ground
            player_ground(false);
            
            // Animate
            animation_start(flight_hammer ? "flight_hammer" : "flight");
            break;
        }
        case PHASE.STEP:
        {
            // Accelerate
            if (input_axis_x != 0)
            {
                // Turn
                if (image_xscale != input_axis_x and not flight_hammer and flight_time < PROPELLER_FLIGHT_DURATION)
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
            
            // Hammer Propeller Flying
            if (input_button.aux.pressed and anim_core.name == "flight_hammer") anim_core.variant = 1;
            var can_input = (anim_core.name != "flight_hammer" or anim_core.variant == 0);
            
            // Skill
            if (can_input)
            {
                if (player_try_air_skill()) exit;
            }
            
            // Cancel
            if (input_button.jump.pressed and input_axis_y == 1 and can_input and (player_index == 0 or cpu_gamepad_time > 0))
            {
                animation_start("flight_cancel");
                return player_perform(player_is_falling, false);
            }
            
            // Ascend
            if (flight_reset_time != 1)
            {
                if (y_speed >= PROPELLER_FLIGHT_THRESHOLD)
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
                if (can_input)
                {
                    var flight_style_config = db_read(CONFIG_DATABASE, CONFIG_DEFAULT_FLIGHT_STYLE, "flight_style");
                    var input_flight = input_button.jump.pressed or (flight_style_config == CONFIG_FLIGHT_STYLE.ADVENTURE and input_button.jump.check);
                    if (input_flight and flight_time < PROPELLER_FLIGHT_DURATION and y_speed >= PROPELLER_FLIGHT_THRESHOLD)
                    {
                        flight_reset_time = 2;
                    }
                }
                
                // Fall
                y_speed += flight_base_force;
            }
            
            // Apply air resistance
            if (y_speed < 0 and y_speed > -4) x_speed -= x_speed / 32;
            
            // Ceiling cap
            if (y < 0 and y_speed < 0) y_speed = 0;
            
            // Timers
            if (flight_time < PROPELLER_FLIGHT_DURATION) flight_time++;
            if (flight_carry_time > 0) flight_carry_time--;
            
            // Animate
            if (flight_time < PROPELLER_FLIGHT_DURATION)
            {
                animation_start(flight_hammer ? "flight_hammer" : "flight");
                if (not audio_is_playing(sfxPropellerFlight))
                {
                    if (flight_soundid != noone and audio_is_playing(flight_soundid)) audio_stop_sound(flight_soundid);
                    flight_soundid = audio_play_sfx(sfxPropellerFlight, true);
                }
            }
            else
            {
                animation_start("flight_tired");
                if (not audio_is_playing(sfxPropellerFlightTired))
                {
                    if (flight_soundid != noone and audio_is_playing(flight_soundid)) audio_stop_sound(flight_soundid);
                    flight_soundid = audio_play_sfx(sfxPropellerFlightTired, true);
                }
            }
            
            // Flight Assist
            if (not flight_hammer)
            {
                if (flight_carry == false and flight_carry_time == 0)
                {
                    with (objPlayer)
                    {
                        // Abort if...
                        if (object_index == objMiles or input_axis_y == 1 or on_ground) continue; // "Other" player is Miles, holding down, or grounded
                        if (state != player_is_falling and state != player_is_jumping) continue; // Not in an appropriate state
                        
                        var dx = (other.x - x) div 1;
                        var dy = (other.y - y) div 1;
                        
                        var sine = dsin(gravity_direction);
                        var cosine = dcos(gravity_direction);
                        
                        var x_dist = (sine == 0 ? cosine * dx : -sine * dy) + 16;
                        var y_dist = (sine == 0 ? cosine * dy : sine * dx) + 32;
                        
                        if (abs(x_dist) < 24 and abs(y_dist) < 12)
                        {
                            flight_ride = other.id;
                            player_perform(player_is_flight_riding);
                            audio_play_sfx(sfxGrab);
                            other.flight_carry = true;
                            other.flight_buddy = id;
                            break;
                        }
                    }
                }
                
                if (flight_carry)
                {
                    var sine = dsin(gravity_direction);
                    var cosine = dcos(gravity_direction);
                    
                    with (flight_buddy)
                    {
                        if (state == player_is_flight_riding)
                        {
                            x = other.x + sine * 32;
                            y = other.y + cosine * 32;
                            image_xscale = other.image_xscale;
                            
                            if (collision_layer != other.collision_layer)
                            {
                                collision_layer = other.collision_layer;
                                tilemaps[1] = ctrlStage.tilemaps[collision_layer + 1];
                            }
                        }
                        else
                        {
                            other.flight_carry = false;
                            other.flight_buddy = noone;
                        }
                    }
                }
            }
            break;
        }
        case PHASE.EXIT:
        {
            audio_stop_sound(flight_soundid);
            flight_soundid = noone;
            break;
        }
    }
}