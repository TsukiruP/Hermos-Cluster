/// @description Initialize
event_inherited();
active = 0;
anim_core = new animation_core();
reaction = function(_pla)
{
    var bit = 1 << _pla.player_index;
    var collision_hammer = false;
    
    // High Jump
    /*var collision_amy = false;
    if (_pla.object_index == objAmy)
    {
        with (_pla)
        {
            collision_amy = (animation_data.index == AMY_ANIMATION.AIR_HAMMER_ATTACK or animation_data.index == AMY_ANIMATION.HAMMER_JUMP);
            collision_amy = (collision_amy or state == player_is_trick_bounding or state == player_is_hammer_whirling);
        }
    }
    
    if (_pla.state == player_is_hammer_attacking or collision_amy)
    {
        if (collision_player(0, _pla, 1)) collision_hammer = true;
    }*/
    
    if (collision_hammer or collision_player(0, _pla))
    {
        if (active & bit == 0)
        {
            var diff = angle_wrap(direction - _pla.gravity_direction);
            var spring_force = force;
            with (_pla)
            {
                if (diff == 90 or diff == 270)
                {
                    y_speed = -dsin(diff) * spring_force;
                    player_perform(player_is_sprung);
                }
                else if (diff == 0 or diff == 180)
                {
                    if (on_ground)
                    {
                        control_lock_time = SPRING_DURATION;
                        if (spring_force > 9) boost_mode = true;
                    }
                    else
                    {
                        player_perform(player_is_sprung);
                    }
                    
                    image_xscale = dcos(diff);
                    x_speed = image_xscale * spring_force;
                }
                else
                {
                    image_xscale = dcos(diff);
                    x_speed = image_xscale * spring_force;
                    y_speed = -dsin(diff) * spring_force;
                    player_perform(player_is_sprung);
                }
                
                if (state == player_is_sprung) state_time = max(2, TRICK_LOCK_DURATION - (spring_force / 1.5) div 1);
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