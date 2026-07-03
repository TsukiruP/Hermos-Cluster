/// @description Initialize
scale = 0;
max_scale = min(display_get_width() div CAMERA_WIDTH, display_get_height() div CAMERA_HEIGHT);
event_perform(ev_keypress, vk_f4);
display_set_gui_size(CAMERA_WIDTH, CAMERA_HEIGHT);