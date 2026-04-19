/// @description Draw
event_inherited();
player_draw_before = function()
{
    with (ears)
    {
        image_alpha = other.image_alpha;
        draw_self_floored();
    }
}