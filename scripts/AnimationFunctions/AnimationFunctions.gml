/// @description Creates a new animation with the given sprite and duration.
/// @param {Asset.GMSprite} sprite Sprite to draw.
/// @param {Real|Array} duration Duration of each frame. Provide an array to set the duration per frame.
/// @param {Real} [loop] Loop frame. If a custom order is provided, this will be an index in that order. Use -1 to mark that the animation doesn't loop.
/// @param {Array} [order] Custom frame order.
function animation(_sprite, _duration, _loop = 0, _order = []) constructor
{
    sprite = _sprite;
    duration = _duration;
    loop = _loop;
    order = _order;
}

/// @description Creates a new animation core.
function animation_core() constructor
{
    force = false;
    name = "";
    variant = 0;
    anim = undefined;
    delay = 0;
    speed = 1;
    position = 0;
    time = 0;
}

/// @description Starts the given animation.
/// @param {Real} name Name of the animation to start.
/// @param {Real} [variant] Variant to set (optional, defaults to 0 if the animations don't match).
/// @param {Array} [alternatives] Alternative animations to consider.
function animation_start(_name, _variant = -1, _alternatives = [])
{
    // Abort if...
    if (anim_core.name == _name and _variant == -1) exit; // Names match with no given variant
    if (array_contains(_alternatives, anim_core.name)) exit; // Current animation is a given alternative
    
    anim_core.force = (anim_core.name == _name);
    anim_core.name = _name;
    anim_core.variant = (_variant == -1 ? 0 : _variant);
}

/// @description Sets the animation core to the given animation.
/// @param {Undefined|Struct.animation|Array} anim Animation to set. Accepts an array as animation variants.
function animation_set(_anim)
{
    // Extract from a given array
    if (is_array(_anim)) _anim = _anim[min(array_length(_anim) - 1, anim_core.variant)];
    
    if (_anim == undefined)
    {
        sprite_index = -1;
        image_index = 0;
        anim_core.variant = 0;
        anim_core.delay = 0;
        anim_core.position = 0;
        anim_core.time = 0;
    }
    else if (anim_core.force or anim_core.anim != _anim)
    {
        var sprite = _anim.sprite;
        var duration = _anim.duration;
        var loop = _anim.loop;
        var order = _anim.order;
        var start = 0;
        
        sprite_index = sprite;
        image_index = (array_length(order) > 0 ? order[start] : start);
        anim_core.delay = (is_array(duration) ? duration[start] : duration);
        anim_core.position = start;
        anim_core.time = 0;
    }
    
    anim_core.force = false;
    anim_core.anim = _anim;
    anim_core.speed = 1;
}

/// @description Updates the animation core.
function animation_update()
{
    // Abort if undefined
    if (anim_core.anim == undefined) exit;
    
    with (anim_core)
    {
        if (delay > 0)
        {
            delay -= speed;
            if (delay <= 0)
            {
                var sprite = anim.sprite;
                var duration = anim.duration;
                var order = anim.order;
                var order_length = array_length(order);
                var last = (order_length > 0 ? order_length - 1 : sprite_get_number(sprite) - 1);
                
                position++;
                if (position > last)
                {
                    var loop = anim.loop;
                    position = loop;
                }
                
                if (position != -1)
                {
                    delay = (is_array(duration) ? duration[position] : duration);
                    other.image_index = (order_length > 0 ? order[position] : position);
                }
            }
        }
        
        time++;
    }
}

/// @description Checks if the animation core is starting.
/// @param {Real} [index] Animation index to check (optional, defaults to 0).
/// @returns {Bool}
function animation_is_starting(_index)
{
    with (anim_core)
    {
        var duration = anim.duration;
        return (position == _index and delay == (is_array(duration) ? duration[_index] : duration));
    }
}

/// @description Checks if the animation core is finished.
/// @returns {Bool}
function animation_is_finished()
{
    with (anim_core)
    {
        return position == -1;
    }
}

/// @description Creates a new attachment.
function attachment() constructor
{
    x = 0;
    y = 0;
    visible = true;
    sprite_index = -1;
    image_index = 0;
    image_xscale = 1;
    image_yscale = 1;
    image_angle = 0;
    image_blend = c_white;
    image_alpha = 1;
    anim_core = new animation_core();
}