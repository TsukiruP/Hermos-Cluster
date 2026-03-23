/// @description Render
var font_height = 15;
if (not InputPartyGetJoin())
{
    with (menu_index)
    {
        var menu_length = array_length(options);
        if (menu_length > 0)
        {
            for (var i = 0; i < menu_length; i++)
            {
                var option_element = options[i];
                var option_label = option_element.label;
                if (is_instanceof(option_element, dev_option_value))
                {
                    option_label = $"{option_label}: {option_element.toString()}";
                }
                
                draw_set_color(cursor == i ? c_white : c_gray);
                draw_text(10, i * font_height, option_label);
                draw_reset();
            }
        }
        else
        {
            draw_text(10, 0, "Work in Progress!");
        }
    }
    
    draw_set_valign(fa_bottom);
    draw_text(10, CAMERA_HEIGHT - 10, $"Confirm: {InputVerbGetBindingName(INPUT_VERB.CONFIRM)}\nCancel: {InputVerbGetBindingName(INPUT_VERB.CANCEL)}");
}
else
{
	for (var i = 0; i < INPUT_MAX_PLAYERS; i++)
    {
        draw_text(10, i * font_height, $"Player {i}: {InputPlayerGetDevice(i)}");
    }
    
    draw_set_valign(fa_bottom);
    draw_text(10, CAMERA_HEIGHT - 10, $"Hold {InputVerbGetBindingName(INPUT_VERB.CONFIRM)} to Exit");
}

draw_reset();