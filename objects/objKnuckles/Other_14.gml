/// @description Animations
event_inherited();
player_render = function()
{
    switch (anim_core.name)
    {
        case "idle":
        {
            player_animate(global.anim_knuckles_idle);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -14, 6, 16);
                hitboxes[1].resize();
            }
            break;
        }
        case "teeter":
        {
            player_animate_teeter(global.anim_knuckles_teeter);
            player_resize(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-5, -14, 7, 16);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -14, 6, 16);
                        hitboxes[1].resize();
                    }
                    break;
                }
            }
            break;
        }
        case "turn":
        {
            player_animate(global.anim_knuckles_turn);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -14, 6, 16);
                hitboxes[1].resize();
            }
            break;
        }
        case "run":
        {
            player_animate_run(global.anim_knuckles_run);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -14, 6, 16);
                hitboxes[1].resize();
            }
            break;
        }
        case "brake":
        {
            player_animate(global.anim_knuckles_brake);
            player_resize(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -14, 6, 16);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -13, 6, 16);
                        hitboxes[1].resize();
                    }
                    break;
                }
            }
            break;
        }
        case "look":
        {
            player_animate(global.anim_knuckles_look);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -14, 6, 16);
                hitboxes[1].resize();
            }
            break;
        }
        case "crouch":
        {
            player_animate(global.anim_knuckles_crouch);
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
            player_animate(global.anim_knuckles_roll);
            player_resize(6, 9);
            if (image_index == 0)
            {
                hitboxes[0].resize(-8, -8, 8, 8);
                hitboxes[1].resize(-8, -8, 8, 8);
            }
            break;
        }
        case "spin_dash":
        {
            if (anim_core.variant == 1 and animation_is_finished()) anim_core.variant = 0;
            player_animate(global.anim_knuckles_spin_dash);
            player_resize(6, 9);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -8, 6, 8);
                hitboxes[1].resize(-8, -8, 8, 8);
            }
            break;
        }
        case "fall":
        {
            player_animate_fall(global.anim_knuckles_fall);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -16, 6, 14);
                hitboxes[1].resize();
            }
            break;
        }
        case "jump":
        {
            player_animate_jump(global.anim_knuckles_jump);
            switch (anim_core.variant)
            {
                case 0:
                {
                    player_resize(6, 14);
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -12, 6, 18);
                        hitboxes[1].resize(-6, -12, 6, 18);
                    }
                    break;
                }
                case 1:
                {
                    player_resize(6, 9);
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-8, -8, 8, 8);
                        hitboxes[1].resize(-8, -8, 8, 8);
                    }
                    break;
                }
                case 2:
                {
                    player_resize(6, 9);
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -16, 6, 4);
                        hitboxes[1].resize(-8, -10, 8, 14);
                    }
                    break;
                }
            }
            break;
        }
        case "hurt":
        {
            player_animate(global.anim_knuckles_hurt);
            player_resize(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -14, 6, 16);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -6, 6, 24);
                        hitboxes[1].resize();
                    }
                    break;
                }
            }
            break;
        }
        case "dead":
        {
            player_animate(global.anim_knuckles_dead);
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
            player_animate_spring(global.anim_knuckles_spring);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -16, 6, 14);
                hitboxes[1].resize();
            }
            break;
        }
        case "spring_twirl":
        {
            player_animate(global.anim_knuckles_spring_twirl);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -16, 6, 14);
                hitboxes[1].resize();
            }
            break;
        }
        case "trick_up":
        {
            if (anim_core.variant == 1 and y_speed > 0) anim_core.variant = 2;
            player_animate(global.anim_knuckles_trick_up);
            player_resize(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                case 2:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -16, 6, 14);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -16, 6, 14);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 2)
                    {
                        hitboxes[0].resize(-6, -16, 6, 14);
                        hitboxes[1].resize(-14, -28, 14, -2);
                    }
                    break;
                }
            }
            break;
        }
        case "trick_down":
        {
            player_animate(global.anim_knuckles_trick_down);
            player_resize(6, 9);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -16, 6, 14);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -12, 6, 18);
                        hitboxes[1].resize(-14, 0, 14, 30);
                    }
                    break;
                }
                case 2:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -14, 6, 16);
                        hitboxes[1].resize();
                    }
                    break;
                }
            }
            break;
        }
        case "trick_front":
        {
            player_animate(global.anim_knuckles_trick_front);
            player_resize(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -14, 6, 16);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -14, 6, 16);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 3)
                    {
                        hitboxes[0].resize(-14, -9, 14, 6);
                        hitboxes[1].resize(4, -16, 19, 14);
                    }
                    break;
                }
                case 2:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -14, 6, 16);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 3)
                    {
                        hitboxes[0].resize(-8, -8, 8, 8);
                        hitboxes[1].resize(-8, -8, 8, 8);
                    }
                    
                    // Sound
                    if (animation_is_starting(5)) audio_play_sfx(sfxRoll);
                    break;
                }
            }
            break;
        }
        case "trick_back":
        {
            player_animate(global.anim_knuckles_trick_back);
            player_resize(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -14, 6, 16);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -14, 6, 16);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 2)
                    {
                        hitboxes[0].resize(-6, -16, 6, 14);
                        hitboxes[1].resize(-18, -16, 0, 14);
                    }
                    break;
                }
            }
            break;
        }
        case "flight_ride":
        {
            player_animate(global.anim_knuckles_flight_ride);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(0, -17, 12, 12);
                hitboxes[1].resize();
            }
            break;
        }
}