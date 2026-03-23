/// @description Behave
//if (instance_exists(objTransition)) exit;

if (not InputPartyGetJoin())
{
    with (menu_index)
    {
        var input_axis_y = InputOpposingRepeat(INPUT_VERB.UP, INPUT_VERB.DOWN);
        var menu_length = array_length(options);
        cursor = clamp_inverse(cursor + input_axis_y, 0, menu_length - 1);
        
        if (menu_length > 0)
        {
            var option_element = options[cursor];
            
            // Update
            if (is_instanceof(option_element, dev_option_value))
            {
                var input_axis_x = InputOpposingRepeat(INPUT_VERB.LEFT, INPUT_VERB.RIGHT);
                if (input_axis_x != 0) option_element.update(input_axis_x);
            }
            
            // Confirm
            if (InputPressed(INPUT_VERB.CONFIRM)) option_element.confirm();
        }
    }
    
    // Cancel
    if (InputPressed(INPUT_VERB.CANCEL) and array_length(menu_history) > 0) menu_index = array_pop(menu_history);
}
else
{
	// Exit
    if (InputPartyGetReady())
    {
        if (InputLong(INPUT_VERB.CONFIRM)) InputPartySetJoin(false);
    }
}