/// @description Animations
/// @description Sets the player's current animation, radii, and hitboxes.
player_render = function() {};

/// @description Sets the player's current animation.
/// @param {Undefined|Struct.animation|Array} anim Animation to set. Accepts an array as animation variants.
/// @param {Real} [ang] Angle to set (optional, defaults to gravity_direction).
player_animate = function(_anim, _ang = gravity_direction)
{
    image_angle = _ang;
    animation_set(_anim);
};

/// @description Sets the player's current animation based on teeter conditions.
/// @param {Undefined|Struct.animation|Array} anim Animation to set. Accepts an array as animation variants.
player_animate_teeter = function(_anim)
{
    anim_core.variant = (cliff_sign != image_xscale);
    player_animate(_anim);
};

/// @description Sets the player's current animation based on running conditions.
/// @param {Undefined|Struct.animation|Array} anim Animation to set. Accepts an array as animation variants.
player_animate_run = function(_anim)
{
    var variant = (on_ground ? 5 : anim_core.variant);
    if (on_ground)
    {
        var abs_speed = abs(x_speed);
        if (abs_speed <= 1.25) variant = 0;
        else if (abs_speed <= 2.5) variant = 1;
        else if (abs_speed <= 4.0) variant = 2;
        else if (abs_speed <= 9.0) variant = 3;
        else if (abs_speed <= 11.5) variant = 4;
    }
    
    anim_core.variant = variant;
    player_animate(_anim);
    if (on_ground) anim_core.speed = clamp((abs(x_speed) / 3) + (abs(x_speed) / 4), 0.5, 8);
};

/// @description Sets the player's current animation based on falling conditions.
/// @param {Undefined|Struct.animation|Array} anim Animation to set. Accepts an array as animation variants.
player_animate_fall = function(_anim)
{
    if (anim_core.variant == 0 and animation_is_finished()) anim_core.variant = 1;
    player_animate(_anim, rotate_towards(mask_direction, image_angle));
};

/// @description Sets the player's current animation based on jumping conditions.
/// @param {Undefined|Struct.animation|Array} anim Animation to set. Accepts an array as animation variants.
player_animate_jump = function(_anim)
{
    switch (anim_core.variant)
    {
        case 0:
        {
            if (animation_is_finished()) anim_core.variant = 1;
            break;
        }
        case 1:
        {
            if (y_speed > 0 and player_boxcast(tilemaps, y_radius + 32)) anim_core.variant = 2;
            break;
        }
    }
    
    player_animate(_anim);
};

/// @description Sets the player's current animation based on spring conditions.
/// @param {Undefined|Struct.animation|Array} anim Animation to set. Accepts an array as animation variants.
player_animate_spring = function(_anim)
{
    switch (anim_core.variant)
    {
        case 0:
        {
            if (y_speed > 0) anim_core.variant = 1;
            break;
        }
        case 1:
        {
            if (animation_is_finished()) anim_core.variant = 2;
            break;
        }
    }
    
    player_animate(_anim);
};