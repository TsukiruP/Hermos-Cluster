/// @description Update
event_inherited();
if (ctrlGame.game_paused & PAUSE_FLAG_MENU) exit;

// Hammer trail
with (hammer_trail)
{
    array_foreach(hearts, function(_element, _index)
    {
        with (_element)
        {
            if (visible) animation_update();
        }
    });
}

// Trick trail
with (trick_trail)
{
    array_foreach(hearts, function(_element, _index)
    {
        with (_element) animation_update();
    });
}