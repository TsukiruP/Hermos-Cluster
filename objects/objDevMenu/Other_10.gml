/// @description Home
for (var i = 0; i < INPUT_MAX_PLAYERS; i++)
{
    new dev_option_player(i, mnu_home);
}

with (new dev_option("Config", mnu_home))
{
    confirm = function() { with (objDevMenu) dev_menu_goto(mnu_config); };
}

with (new dev_option("Goto Test", mnu_home))
{
    confirm = function() { transition_create(rmNewTest); };
}

menu_index = mnu_home;