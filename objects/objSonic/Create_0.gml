/// @description Initialize
event_inherited();
character_index = CHARACTER.SONIC;

// Misc.
trick_speed =
[
    [0, -6],
    [0, 1],
    [6, 0],
    [-5, -3.5]
];

player_render = function()
{
    switch (anim_core.name)
    {
        case "idle":
        {
            player_animate(global.anim_sonic_idle_v0);
            player_set_radii(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].set_size(-6, -16, 6, 16);
                hitboxes[1].set_size();
            }
            break;
        }
        case "teeter":
        {
            player_animate_teeter(global.anim_sonic_teeter);
            player_set_radii(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].set_size(-6, -13, 6, 16);
                hitboxes[1].set_size();
            }
            break;
        }
        case "turn":
        {
            player_animate(global.anim_sonic_turn);
            player_set_radii(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].set_size(-6, -16, 6, 16);
                hitboxes[1].set_size();
            }
            break;
        }
        case "run":
        {
            player_animate_run(global.anim_sonic_run);
            player_set_radii(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].set_size(-6, -16, 6, 16);
                hitboxes[1].set_size();
            }
            break;
        }
        case "brake":
        {
            player_animate(global.anim_sonic_brake);
            player_set_radii(6, 14);
            switch (anim_core.variant)
            {
                case 0:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].set_size(-6, -16, 6, 16);
                        hitboxes[1].set_size();
                    }
                    else if (image_index == 1)
                    {
                        hitboxes[0].set_size(-6, -13, 6, 16);
                        hitboxes[1].set_size();
                    }
                    break;
                }
                case 1:
                {
                    if (image_index == 0)
                    {
                        hitboxes[0].set_size(-6, -13, 6, 16);
                        hitboxes[1].set_size();
                    }
                    break;
                }
            }
            break;
        }
        case "look":
        {
            player_animate(global.anim_sonic_look);
            player_set_radii(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].set_size(-6, -13, 6, 16);
                hitboxes[1].set_size();
            }
            break;
        }
        case "crouch":
        {
            player_animate(global.anim_sonic_crouch);
            player_set_radii(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].set_size(-6, -6, 6, 16);
                hitboxes[1].set_size();
            }
            break;
        }
        case "roll":
        {
            player_animate(global.anim_sonic_roll_v0);
            player_set_radii(6, 9);
            if (image_index == 0)
            {
                hitboxes[0].set_size(-8, -8, 8, 8);
                hitboxes[1].set_size(-8, -8, 8, 8);
            }
            break;
        }
        case "spin_dash":
        {
            if (anim_core.variant == 1 and animation_is_finished()) anim_core.variant = 0;
            player_animate(global.anim_sonic_spin_dash);
            player_set_radii(6, 9);
            if (image_index == 0)
            {
                hitboxes[0].set_size(-6, -8, 6, 8);
                hitboxes[1].set_size(-8, -8, 8, 8);
            }
            break;
        }
        case "fall":
        {
            player_animate_fall(global.anim_sonic_fall);
            player_set_radii(6, 14);
            if (image_index == 0)
            {
                hitboxes[0].set_size(-6, -16, 6, 14);
                hitboxes[1].set_size();
            }
            break;
        }
        case "jump":
        {
            player_animate_jump(global.anim_sonic_jump);
            switch (anim_core.variant)
            {
                case 0:
                {
                    player_set_radii(6, 14);
                    if (image_index == 0)
                    {
                        hitboxes[0].set_size(-6, -16, 6, 16);
                        hitboxes[1].set_size(-6, -16, 6, 16);
                    }
                    break;
                }
                case 1:
                {
                    player_set_radii(6, 9);
                    if (image_index == 0)
                    {
                        hitboxes[0].set_size(-8, -8, 8, 8);
                        hitboxes[1].set_size(-8, -8, 8, 8);
                    }
                    break;
                }
                case 2:
                {
                    player_set_radii(6, 9);
                    if (image_index == 0)
                    {
                        hitboxes[0].set_size(-8, -8, 8, 8);
                        hitboxes[1].set_size(-8, -8, 8, 8);
                    }
                    break;
                }
            }
            break;
        }
    }
};