/// @description Initialize
image_speed = 0;
menu_index = undefined;
menu_history = [];

// Menus
mnu_home = new dev_menu();

mnu_character = new dev_menu();
mnu_sonic = new dev_menu();
mnu_miles = new dev_menu();
mnu_knuckles = new dev_menu();
mnu_amy = new dev_menu();
mnu_cream = new dev_menu();

mnu_config = new dev_menu();
mnu_visuals = new dev_menu();
mnu_gameplay = new dev_menu();
mnu_controls = new dev_menu();

// Setup
var n = 0;
repeat (16) event_user(n++);