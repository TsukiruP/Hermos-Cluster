/// @description Animate
if (ctrlGame.game_paused) exit;
if (anim_core.variant == 1 and animation_is_finished()) anim_core.variant = 0;
switch (anim_core.name)
{
    case "horizontal":
    {
        animation_set(global.animations.spring_horizontal);
        break;
    }
    case "vertical":
    {
        animation_set(global.animations.spring_vertical);
        break;
    }
    case "diagonal":
    {
        animation_set(global.animations.spring_diagonal);
        break;
    }
    case "diagonal_alt":
    {
        animation_set(global.animations.spring_diagonal_alt);
        break;
    }
}
