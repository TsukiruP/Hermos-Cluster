/// @description Draw
event_inherited();
player_draw_before = function()
{
    with (hammer_trail)
    {
        array_foreach(hearts, function(_element, _index)
        {
            with (_element)
            {
                if (visible) draw_self_floored();
            }
        });
    }
};

player_draw_after = function()
{
    with (trick_trail)
    {
        var j = 1;
        for (var i = 0; i < HEART_COUNT; i++)
        {
            if (active & j)
            {
                with (hearts[i])
                {
                    if (not animation_is_finished()) draw_self_floored();
                }
            }
            
            j = j << 1;
        }
    }
};