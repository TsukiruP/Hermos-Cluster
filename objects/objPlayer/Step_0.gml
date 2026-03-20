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

// State
state(PHASE.STEP);
player_render();
if (state_changed) state_changed = false;