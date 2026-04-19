/// @description Ears
event_inherited();
if (ctrlGame.game_paused) exit;
with (ears)
{
    var rolling = false;
    with (other) rolling = (anim_core.anim == global.anim_cream_roll_v0 or anim_core.anim == global.anim_cream_jump_v1);
    if (rolling)
    {
        x = other.x;
        y = other.y;
        image_xscale = other.image_xscale;
        animation_set(global.anim_cream_ears);
        
        if (other.on_ground)
        {
            image_angle = angle_wrap(other.direction);
        }
        else
        {
            image_angle = image_angle = rotate_towards(other.gravity_direction, image_angle);
        }
    }
    else if (anim_core.anim != undefined)
    {
        animation_set(undefined);
    }
}