/// @description Initialize
event_inherited();
hitboxes[0].resize(-15, -17, 15, 15);
reaction = function(_pla)
{
    // Abort if broken or player is a cpu
    if (image_index != 0 or _pla.player_index != 0) exit;
    
    var hurtbox_flags = [collision_player(0, _pla, 0), collision_player(0, _pla, 1)];
    if (hurtbox_flags[0] or hurtbox_flags[1])
    {
        with (_pla)
        {
            if (not on_ground and state != player_is_trick_drill_clawing)
            {
                var in_shape = (gravity_direction mod 180 == 0 ?
                    sign(y - other.y) * dcos(gravity_direction) :
                    sign(x - other.x) * dsin(gravity_direction));
                
                if (y_speed < 0 or in_shape == 1)
                {
                    y_speed -= sign(y_speed);
                }
                else if (y_speed >= 0 and in_shape == -1)
                {
                    y_speed *= -1;
                    if (state == player_is_aqua_bounding)
                    {
                        player_perform(player_is_jumping);
                        audio_play_sfx(sfxAquaBound);
                    }
                    else if (state == player_is_trick_bounding)
                    {
                        player_perform(player_is_trick_rebounding);
                    }
                }
            }
            
            player_obtain_item(other.index);
        }
        
        image_index = 1;
        audio_play_sfx(sfxDestroy);
        particle_create(x, y + 15, global.anim_explosion_destroy, image_angle);
    }
};

// Change debuffs to Eggman
if (not db_read(CONFIG_DATABASE, CONFIG_DEFAULT_DEBUFFS, "debuffs") and (index == ITEM.SLOW_DOWN or index == ITEM.CONFUSION))
{
    index = ITEM.EGGMAN;
}