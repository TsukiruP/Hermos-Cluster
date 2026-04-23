/// @description Render
var x_int = x div 1;
var y_int = y div 1;
var shield_behind = false;

// Shield (behind)
with (shield)
{
    if ((anim_core.anim == global.anim_shield_flame_v0 and image_index mod 2 != 0) or
        anim_core.anim == global.anim_shield_thunder_v1)
    {
        shield_behind = true;
        draw_self_floored();
    }
}

// Afterimages
with (afterimage_trail)
{
    if (visible)
    {
        array_foreach(afterimages, function(_element, _index)
        {
            with (_element)
            {
                if (time == _index and sprite_exists(sprite_index))
                {
                    var alpha = 0.625 - _index * 0.125;
                    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, alpha);
                }
            }
        });
    }
}

// Player
image_alpha = (recovery_time > 0 ? (recovery_time mod 4 < 2) : 1);
player_draw_before();
draw_self_floored();
player_draw_after();

// Spin Dash Dust
with (spin_dash_dust) draw_self_floored();

// Shield
if (not shield_behind)
{
    with (shield)
    {
        if (visible)
        {
            draw_self_floored();
        }
        else if (anim_core.anim == global.anim_shield_aqua_wave_v0)
        {
            draw_self_as(sprShieldAquaShell, anim_core.time mod 24 < 12);
        }
    }
}

// Miasma
with (miasma) draw_self_floored();

// Speed Break
with (speed_break)
{
    if (visible)
    {
        for (var i = 0; i < SPEED_BREAK_COUNT / 2; i++)
        {
            if (anim_core.variant == 1 and time & 1)
            {
                draw_sprite(sprite_index, image_index, x + positions[i + (SPEED_BREAK_COUNT / 2)][0], y + positions[i + (SPEED_BREAK_COUNT / 2)][1]);
            }
            else
            {
                draw_sprite(sprite_index, image_index, x + positions[i][0], y + positions[i][1]);
            }
        }
    }
}

// Virtual mask
var sine = dsin(mask_direction);
if (sine == 0)
{
	draw_rectangle_color(x_int - x_radius, y_int - y_radius, x_int + x_radius, y_int + y_radius, c_lime, c_lime, c_lime, c_lime, true);
	draw_line_color(x_int - x_wall_radius, y_int, x_int + x_wall_radius, y_int, c_white, c_white);
}
else
{
	draw_rectangle_color(x_int - y_radius, y_int - x_radius, x_int + y_radius, y_int + x_radius, c_lime, c_lime, c_lime, c_lime, true);
	draw_line_color(x_int, y_int - x_wall_radius, x_int, y_int + x_wall_radius, c_white, c_white);
}

draw_line_color(x_int, y_int, x_int + sine * y_radius, y_int + dcos(mask_direction) * y_radius, c_white, c_white);

// Hitboxes
draw_hitboxes();