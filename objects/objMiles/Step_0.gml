/// @description Tails
event_inherited();
if (ctrlGame.game_paused) exit;
with (tails)
{
    var rolling = false;
    with (other) rolling = (anim_core.anim == global.anim_miles_roll_v0 or anim_core.anim == global.anim_miles_jump_v1);
    if (rolling)
    {
        x = other.x;
        y = other.y;
        image_xscale = other.image_xscale;
        animation_set(global.anim_miles_tails);
        
        if (other.on_ground)
        {
            image_angle = angle_wrap(other.direction - 90);
            if (sign(other.x_speed) == -1) image_angle = angle_wrap(image_angle + 180);
        }
        else
        {
            image_angle = angle_wrap(point_direction(0, 0, other.x_speed, other.y_speed) - 90) + other.gravity_direction;
        }
    }
    else if (anim_core.anim != undefined)
    {
        animation_set(undefined);
    }
}