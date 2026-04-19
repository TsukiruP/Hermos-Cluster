/// @description Animations
event_inherited();
player_render = function()
{
    switch (anim_core.name)
    {
        case "idle":
        {
            player_animate(global.anim_cream_idle);
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
            player_animate_teeter(global.anim_cream_teeter);
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
            player_animate(global.anim_cream_turn);
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
            player_animate_run(global.anim_cream_run);
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
            player_animate(global.anim_cream_brake);
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
            player_animate(global.anim_cream_look);
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
            player_animate(global.anim_cream_crouch);
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
            player_animate(global.anim_cream_roll);
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
            player_animate(global.anim_cream_spin_dash);
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
            player_animate_fall(global.anim_cream_fall);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -12, 6, 10);
                hitboxes[1].resize();
            }
            break;
        }
        case "jump":
        {
            player_animate_jump(global.anim_cream_jump);
            switch (anim_core.variant)
            {
                case 0:
                {
                    player_resize(6, 14);
                    if (image_index == 0)
                    {
                        hitboxes[0].resize(-6, -14, 6, 8);
                        hitboxes[1].resize(-6, -14, 6, 8);
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
                        hitboxes[0].resize(-6, -14, 6, 8);
                        hitboxes[1].resize(-10, -7, 10, 13);
                    }
                    break;
                }
            }
            break;
        }
        case "hurt":
        {
            player_animate(global.anim_cream_hurt);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -13, 6, 13);
                hitboxes[1].resize();
            }
            break;
        }
        case "dead":
        {
            player_animate(global.anim_cream_dead);
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
            player_animate_spring(global.anim_cream_spring);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -12, 6, 10);
                hitboxes[1].resize();
            }
            break;
        }
        case "spring_twirl":
        {
            player_animate(global.anim_cream_spring_twirl);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -17, 6, 5);
                hitboxes[1].resize();
            }
            break;
        }
        case "trick_up":
        {
            if (anim_core.variant == 1 and y_speed > 0) anim_core.variant = 2;
            player_animate(global.anim_cream_trick_up);
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
            player_animate(global.anim_cream_trick_down);
            player_resize(6, 9);
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
                    else if (image_index == 3)
                    {
                        hitboxes[0].resize(-6, -12, 6, 10);
                        hitboxes[1].resize(-6, 0, 6, 10);
                    }
                    break;
                }
            }
            break;
        }
        case "trick_front":
        {
            player_animate(global.anim_cream_trick_front);
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
            if (anim_core.variant == 1 and y_speed > 0) anim_core.variant = 2;
            player_animate(global.anim_cream_trick_back);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -12, 6, 10);
                hitboxes[1].resize();
            }
            break;
        }
        case "flight_ride":
        {
            player_animate(global.anim_cream_flight_ride);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-1, -15, 11, 11);
                hitboxes[1].resize();
            }
            break;
        }
        case "flight":
        {
            if (anim_core.variant == 1 and animation_is_finished()) anim_core.variant = 0;
            player_animate(global.anim_cream_flight);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -12, 6, 10);
                hitboxes[1].resize();
            }
            break;
        }
        case "flight_tired":
        {
            player_animate(global.anim_cream_flight_tired);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -12, 6, 10);
                hitboxes[1].resize();
            }
            break;
        }
        case "flight_cancel":
        {
            player_animate(global.anim_cream_flight_cancel);
            player_resize(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].resize(-6, -12, 6, 10);
                hitboxes[1].resize();
            }
            else if (image_index == 1)
            {
                hitboxes[0].resize(-6, -12, 6, 10);
                hitboxes[1].resize(-6, 7, 6, 17);
            }
            break;
        }
        case "hammer":
        {
            break;
        }
    }
}