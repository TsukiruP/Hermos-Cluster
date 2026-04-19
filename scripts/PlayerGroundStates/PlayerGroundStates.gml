function player_is_ready(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            break;
        }
        case PHASE.STEP:
        {
            player_perform(player_is_standing);
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}

function player_is_standing(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Check if on a cliff
            var height = y_radius + y_snap_distance;
            if (not player_raycast(tilemaps, 0, height))
            {
                cliff_sign = player_raycast(tilemaps, -x_radius, height) -
                    player_raycast(tilemaps, x_radius, height);
            }
            else
            {
                cliff_sign = 0;
            }
            
            // Animate
            animation_start(cliff_sign != 0 ? "teeter" : "idle", 0, ["turn"]);
            break;
        }
        case PHASE.STEP:
        {
            // Jump
            if (player_try_jump()) exit;
            
            // Move
            player_move_on_ground();
            if (state_changed) exit;
            
            // Fall
            if (not on_ground or (local_direction >= 90 and local_direction <= 270))
            {
                return player_perform(player_is_falling);
            }
            
            // Slide down steep slopes
            if (local_direction >= 45 and local_direction <= 315)
            {
                control_lock_time = SLIDE_DURATION;
                return player_perform(player_is_running);
            }
            
            // Turn
            if (anim_core.name != "teeter" and input_axis_x != 0 and image_xscale != input_axis_x)
            {
                animation_start("turn");
                image_xscale *= -1;
            }
            
            // Stand
            if (anim_core.name == "turn" and animation_is_finished())
            {
                animation_start(cliff_sign != 0 ? "teeter" : "idle");
            }
            
            // Can't control during a turn
            if (anim_core.name != "turn")
            {
                // Run
                if (x_speed != 0 or input_axis_x != 0)
                {
                    return player_perform(player_is_running);
                }
                
                // Look / crouch
                if (cliff_sign == 0)
                {
                    if (input_axis_y == -1) return player_perform(player_is_looking);
                    if (input_axis_y == 1) return player_perform(player_is_crouching);
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

function player_is_running(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Animate
            animation_start("run");
            break;
        }
        case PHASE.STEP:
        {
            // Jump
            if (player_try_jump()) exit;
            
            // Apply slope friction
            player_resist_slope();
            
            // Handle ground motion
            var can_brake = false;
            var can_turn = false;
            
            if (control_lock_time == 0)
            {
            	if (input_axis_x != 0)
            	{
            		// Decelerate
                    if (sign(x_speed) == -input_axis_x)
                    {
                        can_brake = true;
                        x_speed += deceleration * input_axis_x;
                        if (sign(x_speed) == input_axis_x)
                        {
                            if (sign(x_speed) != image_xscale) can_turn = true;
                            x_speed = deceleration * input_axis_x;
                        }
                    }
                    else if (x_speed == 0 and image_xscale != input_axis_x)
                    {
                        // Turn
                        can_turn = true;
                    }
                    else
                    {
                        // Accelerate
                        can_brake = false;
                        image_xscale = input_axis_x;
                        if (abs(x_speed) < speed_cap)
                        {
                            x_speed = min(abs(x_speed) + acceleration, speed_cap) * input_axis_x; 
                        }
                        else
                        {
                            boost_speed += acceleration;
                        }
                    }
            	}
            	else
            	{
            		// Friction
            		x_speed -= min(abs(x_speed), acceleration) * sign(x_speed);
            	}
            }
            
            // Apply speed limit
            if (abs(x_speed) > speed_limit) x_speed = speed_limit * sign(x_speed);
            
            // Move
            player_move_on_ground();
            if (state_changed) exit;
            
            // Fall
            if (not on_ground) return player_perform(player_is_falling);
            
            // Slide down steep slopes
            if (abs(x_speed) < SLIDE_THRESHOLD)
            {
                if (local_direction >= 90 and local_direction <= 270)
                {
                    return player_perform(player_is_falling);
                }
                else if (local_direction >= 45 and local_direction <= 315)
                {
                    control_lock_time = SLIDE_DURATION;
                }
            }
            
            // Roll
            if (input_axis_y == 1 and x_speed >= ROLL_THRESHOLD and input_axis_x == 0)
            {
                if (object_index != objAmy or (object_index == objAmy and db_read(SAVE_DATABASE, AMY_DEFAULT_SPIN, "amy", "spin")))
                {
                    audio_play_sfx(sfxRoll);
                    return player_perform(player_is_rolling);
                }
            }
            
            // Stand
            if (x_speed == 0 and input_axis_x == 0) return player_perform(player_is_standing);
            
            // Animate
            if (can_turn)
            {
                x_speed = 0;
                animation_start("turn", anim_core.name == "brake");
                image_xscale *= -1;
                return player_perform(player_is_standing);
            }
            else if (can_brake)
            {
                if (anim_core.name != "brake")
                {
                    if (mask_direction == gravity_direction and abs(x_speed) >= 2)
                    {
                        animation_start("brake", abs(x_speed) >= 9);
                        audio_play_sfx(sfxBrake);
                    }
                }
                else if (anim_core.time mod 4 == 0)
                {
                    // Create brake dust
                    var ox = x + dsin(direction) * y_radius;
                    var oy = y + dcos(direction) * y_radius;
                    particle_create(ox, oy, global.anim_brake_dust);
                }
            }
            else
            {
                animation_start("run");
            }
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}

function player_is_looking(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Animate
            animation_start("look");
            break;
        }
        case PHASE.STEP:
        {
            // Jump
            if (player_try_jump()) exit;
            
            // Move
            player_move_on_ground();
            if (state_changed) exit;
            
            // Fall
            if (not on_ground or (local_direction >= 90 and local_direction <= 270))
            {
                return player_perform(player_is_falling);
            }
            
            // Slide down steep slopes
            if (local_direction >= 45 and local_direction <= 315)
            {
                control_lock_time = SLIDE_DURATION;
                return player_perform(player_is_running);
            }
            
            // Run
            if (x_speed != 0) return player_perform(player_is_running);
            
            // Stand
            if (anim_core.name == "look" and anim_core.variant == 1 and animation_is_finished())
            {
                return player_perform(player_is_standing);
            }
            
            // Animate
            if (input_axis_x == 0 and input_axis_y == 0)
            {
                if (anim_core.name == "look" and anim_core.variant == 0) anim_core.variant = 1;
            }
            else if (input_axis_y != -1)
            {
                return player_perform(player_is_standing);
            }
            break;
        }
        case PHASE.EXIT:
        {
            camera_set_look_time(LOOK_DURATION);
            break;
        }
    }
}

function player_is_crouching(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Animate
            animation_start("crouch");
            break;
        }
        case PHASE.STEP:
        {
            // Jump
            if (player_try_jump()) exit;
            
            // Move
            player_move_on_ground();
            if (state_changed) exit;
            
            // Fall
            if (not on_ground or (local_direction >= 90 and local_direction <= 270))
            {
                return player_perform(player_is_falling);
            }
            
            // Slide down steep slopes
            if (local_direction >= 45 and local_direction <= 315)
            {
                control_lock_time = SLIDE_DURATION;
                return player_perform(player_is_running);
            }
            
            // Spin Dash
            if (input_button.jump.pressed)
            {
                if (object_index != objAmy or (object_index == objAmy and db_read(SAVE_DATABASE, AMY_DEFAULT_SPIN, "amy", "spin")))
                {
                    return player_perform(player_is_spin_dashing);
                }
            }
            
            // Run
            if (x_speed != 0) return player_perform(player_is_running);
            
            // Stand
            if (anim_core.name == "crouch" and anim_core.variant == 1 and animation_is_finished())
            {
                return player_perform(player_is_standing);
            }
            
            // Animate
            if (input_axis_x == 0 and input_axis_y == 0)
            {
                if (anim_core.name == "crouch" and anim_core.variant == 0) anim_core.variant = 1;
            }
            else if (input_axis_y != 1)
            {
                return player_perform(player_is_standing);
            }
            break;
        }
        case PHASE.EXIT:
        {
            camera_set_look_time(LOOK_DURATION);
            break;
        }
    }
}

function player_is_rolling(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Animate
            animation_start("roll");
            break;
        }
        case PHASE.STEP:
        {
            // Jump
            if (player_try_jump()) exit;
            
            // Apply slope friction
            var friction_downhill = 60 / 256;
            var friction_uphill = friction_downhill / 4;
            var slope_friction = (sign(x_speed) == sign(dsin(local_direction)) ? friction_uphill : friction_downhill);
            player_resist_slope(slope_friction);
            
            // Decelerate
            if (control_lock_time == 0)
            {
                if (input_axis_x != 0)
                {
                    if (sign(x_speed) != input_axis_x)
                    {
                        x_speed += roll_deceleration * input_axis_x;
                        if (sign(x_speed) == input_axis_x) x_speed = 0.375 * input_axis_x;
                    }
                    else
                    {
                        image_xscale = input_axis_x;
                    }
                }
            }
            
            // Friction
            x_speed -= min(abs(x_speed), roll_friction) * sign(x_speed);
            
            // Move
            player_move_on_ground();
            if (state_changed) exit;
            
            // Fall
            if (not on_ground) return player_perform(player_is_falling);
            
            // Slide down steep slopes
            if (abs(x_speed) < SLIDE_THRESHOLD)
            {
                if (local_direction >= 90 and local_direction <= 270)
                {
                    return player_perform(player_is_falling);
                }
                else if (local_direction >= 45 and local_direction <= 315)
                {
                    control_lock_time = SLIDE_DURATION;
                }
            }
            
            // Unroll
            if (abs(x_speed) < ROLL_THRESHOLD) player_perform(player_is_running);
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}

function player_is_spin_dashing(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Set charge
            spin_dash_charge = 0;
            
            // Animate
            animation_start("spin_dash");
            
            // Sound
            audio_play_sfx(sfxSpinRev);
            break;
        }
        case PHASE.STEP:
        {
            // Move
            player_move_on_ground();
            if (state_changed) exit;
            
            // Fall
            if (not on_ground or (local_direction >= 90 and local_direction <= 270))
            {
                return player_perform(player_is_falling);
            }
            
            // Slide down steep slopes
            if (local_direction >= 45 and local_direction <= 315)
            {
                control_lock_time = SLIDE_DURATION;
                return player_perform(player_is_running);
            }
            
            // Release
            if (input_axis_y != 1)
            {
                x_speed = image_xscale * (6 + spin_dash_charge * (3 / 8));
                camera_set_x_lag_time(16);
                audio_stop_sound(sfxSpinRev);
                audio_play_sfx(sfxSpinDash);
                return player_perform(player_is_rolling);
            }
            
            // Charge / atrophy
            if (input_button.jump.pressed)
            {
                // Charge
                spin_dash_charge = min(spin_dash_charge + 2, 8);
                
                // Animate
                animation_start("spin_dash", 1);
                
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

function player_is_hammer_attacking(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            break;
        }
        case PHASE.STEP:
        {
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}