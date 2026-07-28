/// @description Setters
event_inherited();
player_knuckles_try_wall_jump = function()
{
    if (player_try_jump())
    {
        image_xscale *= -1;
        x_speed = image_xscale * 3;
        y_speed = -2.625;
        return true;
    }
    
    return false;
}