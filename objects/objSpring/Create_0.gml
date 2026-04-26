/// @description Initialize
event_inherited();
active = 0;
anim_core = new animation_core();
reaction = function(_pla)
{
    var bit = 1 << _pla.player_index;
    var collision_hammer = false;
    
    // High Jump
    with (_pla)
    {
        if (state == player_is_hammer_attacking or anim_core.name == "air_hammer_attack" or anim_core.name == "hammer_jump" or
            anim_core.name == "hammer_whirl" or (anim_core.name == "trick_down" and object_index == objAmy))
        {
            with (other)
            {
                if (collision_player(0, _pla, 1)) collision_hammer = true;
            }
        }
    }
    
    if (collision_hammer or collision_player(0, _pla))
    {
        if (active & bit == 0)
        {
            var diff = angle_wrap(direction - _pla.gravity_direction);
            with (_pla)
            {
                if (diff == 90 or diff == 270)
                {
                    y_speed = -dsin(diff) * other.force;
                    player_perform(player_is_sprung);
                    if (collision_hammer) y_speed *= 1.5;
                }
                else if (diff == 0 or diff == 180)
                {
                    if (on_ground)
                    {
                        control_lock_time = SPRING_DURATION;
                        if (other.force > 9) boost_mode = true;
                    }
                    else
                    {
                        player_perform(player_is_sprung);
                    }
                    
                    image_xscale = dcos(diff);
                    x_speed = image_xscale * other.force;
                }
                else
                {
                    image_xscale = dcos(diff);
                    x_speed = image_xscale * other.force;
                    y_speed = -dsin(diff) * other.force;
                    player_perform(player_is_sprung);
                    if (collision_hammer) y_speed *= 1.5;
                }
                
                if (state == player_is_sprung) state_time = max(2, TRICK_LOCK_DURATION - (other.force / 1.5) div 1);
            }
            
            active |= bit;
            anim_core.variant = 1;
            audio_play_sfx(sfxSpring);
        }
    }
    else
    {
        active &= ~bit;
    }
};