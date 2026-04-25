/// @description Hearts
event_inherited();
if (ctrlGame.game_paused) exit;

// Hammer trail
with (hammer_trail)
{
    if (anim_name != other.anim_core.name or anim_variant != other.anim_core.variant)
    {
        if (visible)
        {
            array_foreach(hearts, function(_element, _index)
            {
                with (_element)
                {
                    visible = false;
                    animation_set(undefined);
                }
            });
            
            visible = false;
        }
    }
    else if (visible)
    {
        array_foreach(hearts, function(_element, _index)
        {
            with (_element)
            {
                if (visible and animation_is_finished())
                {
                    visible = false;
                    animation_set(undefined);
                }
            }
        });
        
        var duration = offsets[pattern][offset_index][0];
        if (duration != -1)
        {
            var old_time = time++;
            if (old_time > duration)
            {
                gravity_direction = other.gravity_direction;
                refresh(other);
                
                offset_index = ++offset_index mod 8;
                if (offset_index == 0) time = 0;
            }
        }
    }
}

// Trick trail
with (trick_trail)
{
    if (visible)
    {
        if (destroy and active == 0)
        {
            visible = false;
            exit;
        }
        
        var j = 1;
        for (var i = 0; i < HEART_COUNT; i++)
        {
            if (active & j)
            {
                with (hearts[i])
                {
                    if (animation_is_finished())
                    {
                        animation_set(undefined);
                        other.active &= ~(1  << i);
                    }
                }
            }
            
            j = j << 1;
        }
        
        if (not destroy)
        {
            if (time == 0)
            {
                offset(other, 0);
            }
            else if (time == 3)
            {
                offset(other, 1);
            }
            else if (time == 7)
            {
                offset(other, 2);
            }
            else if (time == 11)
            {
                offset(other, 3);
            }
        }
        
        time = ++time mod 15;
        if (other.anim_core.anim != global.anim_amy_trick_front_v1) destroy = true;
    }
}