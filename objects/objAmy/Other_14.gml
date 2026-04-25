/// @description Animations
event_inherited();
player_render = function()
{
    var lovely_couple = (global.characters[0] == CHARACTER.SONIC);
    switch (anim_core.name)
    {
        case "idle":
        {
            if (lovely_couple)
            {
                player_animate(global.anim_amy_idle_alt);
                player_resize(6, 14);
                if (image_index == 0)
                {
                    hitboxes[0].resize(-6, -12, 6, 16);
                    hitboxes[1].resize();
                }
            }
            else
            {
                player_animate(global.anim_amy_idle);
                player_resize(6, 14);
                if (image_index == 0)
                {
                    hitboxes[0].resize(-6, -12, 6, 16);
                    hitboxes[1].resize();
                }
            }
            break;
        }
        case "teeter":
        {
            player_animate_teeter(global.anim_amy_teeter);
            player_resize(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-9, -12, 3, 16);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-11, -12, 1, 16);
                        hitboxes[1].resize();
                    }
                    break;
                }
            }
            break;
        }
        case "turn":
        {
            player_animate(global.anim_amy_turn);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -12, 6, 16);
                hitboxes[1].resize();
            }
            break;
        }
        case "run":
        {
            if (lovely_couple)
            {
                player_animate_run(global.anim_amy_run_alt);
                player_resize(6, 14);
                if (image_index == 0)
                {
                    hitboxes[0].resize(-6, -12, 6, 16);
                    hitboxes[1].resize();
                }
            }
            else
            {
                player_animate_run(global.anim_amy_run);
                player_resize(6, 14);
                if (image_index == 0)
                {
                    hitboxes[0].resize(-6, -12, 6, 16);
                    hitboxes[1].resize();
                }
            }
            break;
        }
        case "brake":
        {
            player_animate(global.anim_amy_brake);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -12, 6, 16);
                hitboxes[1].resize();
            }
            break;
        }
        case "look":
        {
            player_animate(global.anim_amy_look);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -12, 6, 16);
                hitboxes[1].resize();
            }
            break;
        }
        case "crouch":
        {
            player_animate(global.anim_amy_crouch);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -6, 6, 16);
                hitboxes[1].resize();
            }
            break;
        }
        case "roll":
        {
            player_animate(global.anim_amy_roll);
            player_resize(6, 9);
            if (image_index == 0)
            {
                hitboxes[0].resize(-10, -10, 10, 10);
                hitboxes[1].resize(-10, -10, 10, 10);
            }
            break;
        }
        case "spin_dash":
        {
            player_animate(global.anim_amy_spin_dash);
            player_resize(6, 9);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -18, 6, 10);
                hitboxes[1].resize(-6, -18, 6, 10);
            }
            break;
        }
        case "fall":
        {
            player_animate_fall(global.anim_amy_fall);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -14, 6, 12);
                hitboxes[1].resize();
            }
            break;
        }
        case "jump":
        {
            player_animate_jump(global.anim_amy_jump);
            switch (anim_core.variant)
            {
                case 0:
                {
                    player_resize(6, 14);
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-10, -10, 10, 10);
                        hitboxes[1].resize(-10, -10, 10, 10);
                    }
                    break;
                }
                case 1:
                {
                    player_resize(6, 9);
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-10, -10, 10, 10);
                        hitboxes[1].resize(-10, -10, 10, 10);
                    }
                    break;
                }
                case 2:
                {
                    player_resize(6, 9);
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-10, -10, 10, 10);
                        hitboxes[1].resize(-10, -10, 10, 10);
                    }
                    else if (image_index == 1)
                    {
                        hitboxes[0].resize(-6, -16, 6, 10);
                        hitboxes[1].resize(-11, -7, 10, 15);
                    }
                    break;
                }
            }
            break;
        }
        case "hurt":
        {
            player_animate(global.anim_amy_hurt);
            player_resize(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -12, 6, 16);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -16, 6, 10);
                        hitboxes[1].resize();
                    }
                    break;
                }
            }
            break;
        }
        case "dead":
        {
            player_animate(global.anim_amy_dead);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize();
                hitboxes[1].resize();
            }
            break;
        }
        case "spring":
        {
            player_animate_spring(global.anim_amy_spring);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -12, 6, 16);
                hitboxes[1].resize();
            }
            break;
        }
        case "spring_twirl":
        {
            player_animate(global.anim_amy_spring_twirl);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -13, 6, 13);
                hitboxes[1].resize();
            }
            break;
        }
        case "trick_up":
        {
            if (anim_core.variant == 1 and y_speed > 0) anim_core.variant = 2;
            player_animate(global.anim_amy_trick_up);
            player_resize(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                case 2:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -16, 6, 10);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -16, 6, 10);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 3)
                    {
                        hitboxes[0].resize(-6, -16, 6, 10);
                        hitboxes[1].resize(-4, -25, 5, -17);
                    }
                    break;
                }
            }
            break;
        }
        case "trick_down":
        {
            player_animate(global.anim_amy_trick_down);
            player_resize(6, 9);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -16, 6, 10);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -16, 6, 10);
                        hitboxes[1].resize(-26, -14, 26, 12);
                    }
                    break;
                }
                case 2:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -16, 6, 14);
                        hitboxes[1].resize();
                    }
                    break;
                }
            }
            break;
        }
        case "trick_front":
        {
            player_animate(global.anim_amy_trick_front);
            player_resize(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -16, 6, 10);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -16, 6, 10);
                        hitboxes[1].resize(-14, -16, 14, 10);
                    }
                    break;
                }
            }
            break;
        }
        case "trick_back":
        {
            player_animate(global.anim_amy_trick_back);
            player_resize(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -16, 8, 10);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -16, 6, 10);
                        hitboxes[1].resize();
                    }
                    break;
                }
            }
            break;
        }
        case "flight_ride":
        {
            player_animate(global.anim_amy_flight_ride);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-1, -17, 11, 14);
                hitboxes[1].resize();
            }
            break;
        }
        case "hammer_attack":
        {
            player_animate(global.anim_amy_hammer_attack);
            player_resize(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -12, 6, 16);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 1)
                    {
                        hitboxes[0].resize(-14, -12, 0, 16);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 2)
                    {
                        hitboxes[0].resize(-14, -12, -2, 16);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 3)
                    {
                        hitboxes[0].resize(-18, -12, -6, 16);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 6)
                    {
                        hitboxes[0].resize(-14, -12, -2, 16);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 7)
                    {
                        hitboxes[0].resize(-12, -12, 0, 16);
                        hitboxes[1].resize(-10, -35, 20, -2);
                    }
                    else if (image_index == 8)
                    {
                        hitboxes[0].resize(-6, -12, 6, 16);
                        hitboxes[1].resize(0, -23, 32, 16);
                    }
                    else if (image_index == 12)
                    {
                        hitboxes[0].resize(-6, -12, 6, 16);
                        hitboxes[1].resize();
                    }
                    
                    // Sound
                    if (animation_is_starting(8)) audio_play_sfx(sfxHammerAttack);
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -12, 6, 16);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 8)
                    {
                        hitboxes[0].resize(-6, -12, 6, 16);
                        hitboxes[1].resize(0, -42, 32, 0);
                    }
                    else if (image_index == 9)
                    {
                        hitboxes[0].resize(2, -12, 14, 16);
                        hitboxes[1].resize(7, -34, 40, 6);
                    }
                    else if (image_index == 10)
                    {
                        hitboxes[0].resize(2, -12, 14, 16);
                        hitboxes[1].resize(11, -23, 44, 16);
                    }
                    else if (image_index == 15)
                    {
                        hitboxes[0].resize(-4, -12, 8, 16);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 16)
                    {
                        hitboxes[0].resize(-8, -12, 4, 16);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 17)
                    {
                        hitboxes[0].resize(-10, -12, 2, 16);
                        hitboxes[1].resize();
                    }
                    
                    // Sound
                    if (animation_is_starting(10)) audio_play_sfx(sfxHammerAttack);
                    break;
                }
            }
            break;
        }
        case "big_hammer_attack":
        {
            player_animate(global.anim_amy_big_hammer_attack);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -12, 6, 16);
                hitboxes[1].resize();
            }
            else if (image_index == 3)
            {
                hitboxes[0].resize(-8, -15, 4, 13);
                hitboxes[1].resize();
            }
            else if (image_index == 4)
            {
                hitboxes[0].resize(-9, -18, 3, 10);
                hitboxes[1].resize();
            }
            else if (image_index == 5)
            {
                hitboxes[0].resize(-10, -21, 2, 7);
                hitboxes[1].resize();
            }
            else if (image_index == 6)
            {
                hitboxes[0].resize(-12, -23, 0, 5);
                hitboxes[1].resize();
            }
            else if (image_index == 7)
            {
                hitboxes[0].resize(-12, -24, 0, 4);
                hitboxes[1].resize();
            }
            else if (image_index == 9)
            {
                hitboxes[0].resize(-10, -21, 2, 7);
                hitboxes[1].resize(-21, -47, 14, -20);
            }
            else if (image_index == 10)
            {
                hitboxes[0].resize(-9, -20, 3, 8);
                hitboxes[1].resize(8, -32, 45, 3);
            }
            else if (image_index == 11)
            {
                hitboxes[0].resize(-5, -19, 7, 9);
                hitboxes[1].resize(12, -24, 54, 16);
            }
            else if (image_index == 14)
            {
                hitboxes[0].resize(-5, -15, 7, 13);
                hitboxes[1].resize();
            }
            else if (image_index == 16)
            {
                hitboxes[0].resize(-6, -12, 6, 16);
                hitboxes[1].resize();
            }
            
            // Sound
            if (animation_is_starting(10)) audio_play_sfx(sfxBigHammerAttack);
            break;
        }
        case "air_hammer_attack":
        {
            player_animate(global.anim_amy_air_hammer_attack);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-10, -8, 10, 12);
                hitboxes[1].resize(-14, -12, 14, 16);
            }
            else if (image_index == 1)
            {
                hitboxes[0].resize(-6, -14, 6, 12);
                hitboxes[1].resize();
            }
            break;
        }
        case "hammer_whirl":
        {
            player_animate(global.anim_amy_hammer_whirl);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -14, 6, 12);
                hitboxes[1].resize();
            }
            else if (image_index == 3)
            {
            	hitboxes[0].resize(-6, -14, 6, 10);
                hitboxes[1].resize(-24, -8, 24, 16);
            }
            break;
        }
        case "hammer_jump":
        {
            player_animate(global.anim_amy_hammer_jump);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-9, -16, 3, 12);
                hitboxes[1].resize();
            }
            else if (image_index == 1)
            {
                hitboxes[0].resize(-5, -16, 8, 12);
                hitboxes[1].resize(-4, -35, 26, -2);
            }
            else if (image_index == 2)
            {
                hitboxes[0].resize(-5, -16, 8, 13);
                hitboxes[1].resize(-5, -25, 37, 14);
            }
            else if (image_index == 3)
            {
                hitboxes[0].resize(-6, -16, 7, 9);
                hitboxes[1].resize();
            }
            else if (image_index == 4)
            {
                hitboxes[0].resize(-6, -14, 6, 12);
                hitboxes[1].resize();
            }
            break;
        }
        case "leap":
        {
            player_animate(global.anim_amy_leap);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -12, 6, 16);
                hitboxes[1].resize();
            }
            break;
        }
        case "head_slide":
        {
            if (anim_core.variant == 0 and animation_is_finished()) anim_core.variant = 1;
            player_animate(global.anim_amy_head_slide);
            player_resize(6, 9);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -17, 6, 11);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 1)
                    {
                        hitboxes[0].resize(-6, -13, 6, 11);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 3)
                    {
                        hitboxes[0].resize(-6, -5, 6, 11);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-8, -4, 6, 10);
                        hitboxes[1].resize(-1, -10, 18, 12);
                    }
                    break;
                }
                case 2:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -9, 6, 11);
                        hitboxes[1].resize();
                    }
                    break;
                }
            }
            break;
        }
    }
};

/// @description Creates a hammer trail effect.
/// @param {Enum.HEART_PATTERN} pattern Heart pattern to use.
amy_create_hammer_trail = function(_pattern)
{
    with (hammer_trail)
    {
        array_foreach(hearts, function(_element, _index)
        {
            with (_element)
            {
                visible = false;
                animation_set(undefined);
            }
        });
        
        visible = true;
        gravity_direction = other.gravity_direction;
        anim_name = other.anim_core.name;
        anim_variant = other.anim_core.variant;
        
        time = 0;
        pattern = _pattern;
        offset_index = 0;
    }
};

/// @description Creates a trick trail effect.
amy_create_trick_trail = function()
{
    with (trick_trail)
    {
        array_foreach(hearts, function(_element, _index)
        {
            with (_element)
            {
                anim_core.force = true;
                animation_set(global.anim_amy_heart)
            }
        });
        
        visible = true;
        time = 0;
        active = 0;
        destroy = false;
    }
};