/// @description Animations
event_inherited();
player_render = function()
{
    switch (anim_core.name)
    {
        case "idle":
        {
            player_animate(global.anim_miles_idle);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -10, 6, 16);
                hitboxes[1].resize();
            }
            break;
        }
        case "teeter":
        {
            player_animate_teeter(global.anim_miles_teeter);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -10, 6, 16);
                hitboxes[1].resize();
            }
            break;
        }
        case "turn":
        {
            player_animate(global.anim_miles_turn);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -10, 6, 16);
                hitboxes[1].resize();
            }
            break;
        }
        case "run":
        {
            player_animate_run(global.anim_miles_run);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -10, 6, 16);
                hitboxes[1].resize();
            }
            break;
        }
        case "brake":
        {
            player_animate(global.anim_miles_brake);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -10, 6, 16);
                hitboxes[1].resize();
            }
            break;
        }
        case "look":
        {
            player_animate(global.anim_miles_look);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -10, 6, 16);
                hitboxes[1].resize();
            }
            break;
        }
        case "crouch":
        {
            player_animate(global.anim_miles_crouch);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -4, 6, 16);
                hitboxes[1].resize();
            }
            break;
        }
        case "roll":
        {
            player_animate(global.anim_miles_roll);
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
            player_animate(global.anim_miles_spin_dash);
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
            player_animate_fall(global.anim_miles_fall);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -10, 6, 12);
                hitboxes[1].resize();
            }
            break;
        }
        case "jump":
        {
            player_animate_jump(global.anim_miles_jump);
            switch (anim_core.variant)
            {
                case 0:
                {
                    player_resize(6, 14);
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -18, 6, 4);
                        hitboxes[1].resize(-6, -18, 6, 4);
                    }
                    else if (image_index == 1)
                    {
                        hitboxes[0].resize(-7, -6, 5, 16);
                        hitboxes[0].resize(-7, -6, 5, 16);
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
                        hitboxes[0].resize(-6, -16, 6, 6);
                        hitboxes[1].resize(-10, -8, 10, 12);
                    }
                    else if (image_index == 1)
                    {
                        hitboxes[0].resize(-6, -18, 8, 4);
                        hitboxes[1].resize(-9, -9, 9, 9);
                    }
                    break;
                }
            }
            break;
        }
        case "hurt":
        {
            player_animate(global.anim_miles_hurt);
            player_resize(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -12, 10, 16);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-8, -9, 8, 19);
                        hitboxes[1].resize();
                    }
                    break;
                }
            }
            break;
        }
        case "dead":
        {
            player_animate(global.anim_miles_dead);
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
            player_animate_spring(global.anim_miles_spring);
            player_resize(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -12, 6, 10);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -12, 6, 10);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 1)
                    {
                        hitboxes[0].resize(-6, -14, 6, 8);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 4)
                    {
                        hitboxes[0].resize(-6, -16, 6, 6);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 5)
                    {
                        hitboxes[0].resize(-6, -14, 6, 6);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 2:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -16, 6, 6);
                        hitboxes[1].resize();
                    }
                    break;
                }
            }
            break;
        }
        case "spring_twirl":
        {
            player_animate(global.anim_miles_spring_twirl);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -11, 6, 11);
                hitboxes[1].resize();
            }
            break;
        }
        case "trick_up":
        {
            if (anim_core.variant == 1 and y_speed > 0) anim_core.variant = 2;
            player_animate(global.anim_miles_trick_up);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -12, 6, 10);
                hitboxes[1].resize();
            }
            break;
        }
        case "trick_down":
        {
            player_animate(global.anim_miles_trick_down);
            player_resize(6, 9);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -12, 6, 10);
                hitboxes[1].resize();
            }
            break;
        }
        case "trick_front":
        {
            player_animate(global.anim_miles_trick_front);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -12, 6, 10);
                hitboxes[1].resize();
            }
            break;
        }
        case "trick_back":
        {
            player_animate(global.anim_miles_trick_back);
            player_resize(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                case 2:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -12, 6, 10);
                        hitboxes[1].resize();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -12, 6, 10);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 3)
                    {
                        hitboxes[0].resize(-6, -12, 6, 10);
                        hitboxes[1].resize(-23, 0, 14, 10);
                    }
                    break;
                }
            }
            break;
        }
        case "flight":
        {
            if (anim_core.variant == 1 and animation_is_finished()) anim_core.variant = 0;
            player_animate(global.anim_miles_flight);
            player_resize(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -10, 6, 10);
                        hitboxes[1].resize(-22, -23, 21, -11);
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -10, 6, 10);
                        hitboxes[1].resize(-17, -19, 17, -11);
                    }
                    break;
                }
            }
            break;
        }
        case "flight_tired":
        {
            player_animate(global.anim_miles_flight_tired);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -10, 6, 10);
                hitboxes[1].resize();
            }
            break;
        }
        case "flight_cancel":
        {
            player_animate(global.anim_miles_flight_cancel);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -10, 6, 10);
                hitboxes[1].resize();
            }
            else if (image_index == 1)
            {
                hitboxes[0].resize(-2, -10, 10, 10);
                hitboxes[1].resize();
            }
            break;
        }
        case "hammer":
        {
            break;
        }
        case "hammer_flight":
        {
            if (anim_core.variant == 1 and animation_is_finished()) anim_core.variant = 0;
            player_animate(global.anim_miles_hammer_flight);
            player_resize(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-7, -10, 6, 10);
                        hitboxes[1].resize(-26, -22, 22, -9);
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-7, -10, 6, 10);
                        hitboxes[1].resize();
                    }
                    else if (image_index == 6)
                    {
                        hitboxes[0].resize(-7, -10, 6, 10);
                        hitboxes[1].resize(4, -24, 38, 11);
                    }
                    else if (image_index == 7)
                    {
                        hitboxes[0].resize(-7, -10, 6, 10);
                        hitboxes[1].resize(-15, -9, 31, 32);
                    }
                    break;
                }
            }
            break;
        }
    }
}