/// @description Initialize
scale = 0;
max_scale = min(display_get_width() div CAMERA_WIDTH, display_get_height() div CAMERA_HEIGHT);
event_perform(ev_keypress, vk_f4);