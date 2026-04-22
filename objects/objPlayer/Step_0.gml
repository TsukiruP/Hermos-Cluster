/// @description Behave
if (ctrlGame.game_paused) exit;

// Boost Mode
player_refresh_boost_mode();

// Input
if (input_enabled and (player_index == 0 or cpu_gamepad_time > 0))
{
    input_axis_x = InputOpposing(INPUT_VERB.LEFT, INPUT_VERB.RIGHT, player_index);
    input_axis_y = InputOpposing(INPUT_VERB.UP, INPUT_VERB.DOWN, player_index);
    
    struct_foreach(input_button, function(_name, _value)
    {
        var verb = _value.verb;
        _value.check = InputCheck(verb, player_index);
        _value.pressed = InputPressed(verb, player_index);
        _value.released = InputReleased(verb, player_index);
    });
    
    if (confusion_time > 0) input_axis_x *= -1;
    if (cpu_gamepad_time > 0) cpu_gamepad_time--;
}

// CPU

// State
state(PHASE.STEP);
if (state_changed) state_changed = false;
player_render();

//Swap

// Spin Dash Dust
with (spin_dash_dust)
{
    var action = other.state;
    if (action == player_is_spin_dashing)
    {
        var x_int = other.x div 1;
        var y_int = other.y div 1;
        var sine = dsin(other.gravity_direction);
        var cosine = dcos(other.gravity_direction);
        
        x = x_int + sine * other.y_radius;
        y = y_int + cosine * other.y_radius;
        image_xscale = other.image_xscale;
        image_angle = other.mask_direction;
        anim_core.variant = (floor(other.spin_dash_charge) > 2);
        animation_set(global.anim_spin_dash_dust);
    }
    else if (anim_core.anim != undefined)
    {
        animation_set(undefined);
    }
}

// Shield

// Miasma

// Speed Break

// Afterimages
player_enqueue_animation_history();
afterimage_trail.visible = true;
if (afterimage_trail.visible)
{
    for (var i = 0; i < AFTERIMAGE_COUNT; i++)
    {
        var delay = i * 2 + 2;
        var history_index = modwrap(anim_history.index - delay, 0, ANIMATION_RECORD_COUNT);
        var history_element = anim_history.records[history_index];
        with (afterimage_trail.afterimages[i])
        {
            x = history_element.x;
            y = history_element.y;
            image_xscale = history_element.image_xscale;
            image_yscale = history_element.image_yscale;
            image_angle = history_element.image_angle;
            animation_set(history_element.anim);
            anim_core.speed = history_element.speed;
        }
    }
}