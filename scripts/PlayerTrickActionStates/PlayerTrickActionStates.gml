function player_is_trick_preparing(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Stop
            x_speed = 0;
            y_speed = 0;
            break;
        }
        case PHASE.STEP:
        {
            // Trick
            if (animation_is_finished())
            {
                if (trick_index == TRICK.DOWN and (object_index == objSonic or object_index == objKnuckles or object_index == objAmy))
                {
                    switch (object_index)
                    {
                        case objSonic:
                        case objAmy:
                        {
                            y_speed = 2;
                            return player_perform(player_is_trick_bounding);
                        }
                        case objKnuckles:
                        {
                            y_speed = 1;
                            return player_perform(player_is_trick_drill_clawing);
                        }
                    }
                }
                else
                {
                    x_speed = image_xscale * trick_speed[trick_index][0];
                    y_speed = trick_speed[trick_index][1];
                    return player_perform(player_is_tricking);
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

function player_is_tricking(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Set time
            if (trick_index == TRICK.FRONT and (object_index == objSonic or object_index == objAmy))
            {
                state_time = 45;
            }
            else if ((trick_index == TRICK.FRONT or trick_index == TRICK.BACK) and object_index == objKnuckles)
            {
                state_time = 10;
            }
            else
            {
                state_time = 0;
            }
            
            // Animate
            anim_core.variant++;
            if (object_index == objAmy and trick_index == TRICK.FRONT) amy_create_trick_trail();
            break;
        }
        case PHASE.STEP:
        {
            if (state_time > 0) state_time--;
            if (trick_index == TRICK.FRONT and (object_index == objSonic or object_index == objAmy) and state_time == 0) animation_start("fall");
            
            var trick_spiral = (trick_index == TRICK.UP and object_index == objKnuckles);
            var trick_glide = ((trick_index == TRICK.FRONT or trick_index == TRICK.BACK) and object_index == objKnuckles and state_time > 0);
            
            // Accelerate
            if (not trick_spiral or y_speed > 0)
            {
                if (input_axis_x != 0)
                {
                    if (abs(x_speed) < speed_cap or sign(x_speed) != input_axis_x)
                    {
                        x_speed += air_acceleration * input_axis_x;
                        if (abs(x_speed) > speed_cap and sign(x_speed) == input_axis_x)
                        {
                            x_speed = speed_cap * input_axis_x;
                        }
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
                if (trick_index == TRICK.FRONT and object_index == objKnuckles) return player_perform(player_is_trick_somersaulting);
                return player_perform(x_speed != 0 ? player_is_running : player_is_standing);
            }
            
            // Skill
            
            if (not trick_glide)
            {
                // Apply air resistance
                if (y_speed < 0 and y_speed > -4) x_speed -= x_speed / 32;
                
                // Fall
                if (y_speed < gravity_cap)
                {
                    var trick_force = gravity_force;
                    var trick_float = ((trick_index == TRICK.FRONT or trick_index == TRICK.BACK) and (object_index == objMiles or object_index == objCream) and y_speed < 0);
                    if (trick_float) trick_force /= 2;
                    y_speed = min(y_speed + trick_force, gravity_cap);
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

function player_is_trick_bounding(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Animate
            anim_core.variant++;
            if (object_index == objAmy) amy_create_hammer_trail(HEART_PATTERN.HAMMER_WHIRL);
            break;
        }
        case PHASE.STEP:
        {
            // Move
            player_move_in_air();
            if (state_changed) exit;
            
            // Rebound
            if (on_ground) return player_perform(player_is_trick_rebounding);
            
            // Apply air resistance
            if (y_speed < 0 and y_speed > -4) x_speed -= x_speed / 32;
            
            // Fall
            if (y_speed < gravity_cap) y_speed = min(y_speed + trick_bound_force, gravity_cap);
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}

function player_is_trick_rebounding(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Rebound
            var sine = dsin(local_direction);
            var cosine = dcos(local_direction);
            y_speed = -cosine * trick_bound_height;
            x_speed = -sine * trick_bound_height / 2;
            
            // Detach from ground
            player_ground(false);
            break;
        }
        case PHASE.STEP:
        {
            // Move
            player_move_in_air();
            if (state_changed) exit;
            
            // Land
            if (on_ground) return player_perform(x_speed != 0 ? player_is_running : player_is_standing);
            
            // Apply air resistance
            if (y_speed < 0 and y_speed > -4) x_speed -= x_speed / 32;
            
            // Fall
            if (y_speed < gravity_cap) y_speed = min(y_speed + trick_bound_force, gravity_cap);
            
            // Animate
            if (y_speed > 0)
            {
                anim_core.variant++;
                return player_perform(player_is_falling, false);
            }
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}

function player_is_trick_drill_clawing(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Animate
            anim_core.variant++;
            break;
        }
        case PHASE.STEP:
        {
            if (anim_core.variant == 2)
            {
                // Move
                player_move_on_ground();
                if (state_changed) exit;
                
                // Fall
                if (not on_ground) return player_perform(player_is_falling);
                
                // Stand
                if (animation_is_finished()) return player_perform(player_is_standing);
            }
            else
            {
                // Move
                player_move_in_air();
                if (state_changed) exit;
                
                // Land
                if (on_ground) return player_perform(player_is_trick_drill_clawing);
                
                // Apply air resistance
                if (y_speed < 0 and y_speed > -4) x_speed -= x_speed / 32;
                
                // Fall
                if (y_speed < gravity_cap) y_speed = min(y_speed + (42 / 256), gravity_cap);
            }
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}

function player_is_trick_somersaulting(_phase)
{
    switch (_phase)
    {
        case PHASE.ENTER:
        {
            // Animate
            anim_core.variant++;
            break;
        }
        case PHASE.STEP:
        {
            if (on_ground)
            {
                // Move
                player_move_on_ground();
                if (state_changed) exit;
                
                // Detatch from ground
                if (not on_ground) player_ground(false);
            }
            else
            {
                // Move
                player_move_in_air();
                if (state_changed) exit;
                
                // Fall
                if (not on_ground)
                {
                    if (y_speed < gravity_cap) y_speed = min(y_speed + gravity_force, gravity_cap);
                }
            }
            
            // Roll
            if (animation_is_finished())
            {
                animation_start("roll");
                return player_perform(on_ground ? player_is_rolling : player_is_falling, false);
            }
            break;
        }
        case PHASE.EXIT:
        {
            break;
        }
    }
}