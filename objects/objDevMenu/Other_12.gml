/// @description Config
with (new dev_option("Visuals", mnu_config))
{
    confirm = function() { with (objDevMenu) dev_menu_goto(mnu_visuals); };
}

with (new dev_option("Gameplay", mnu_config))
{
    confirm = function() { with (objDevMenu) dev_menu_goto(mnu_gameplay); };
}

with (new dev_option("Controls", mnu_config))
{
    confirm = function() { with (objDevMenu) dev_menu_goto(mnu_controls); };
}

// Visuals
with (new dev_option_int("HUD", mnu_visuals))
{
    keys = ["hud"];
    minimum = CONFIG_HUD.NONE;
    maximum = CONFIG_HUD.EPISODE_II;
    offset = CONFIG_HUD.NONE;
    specifiers = ["None", "Cluster", "Adventure", "Adventure 2", "Advance 2", "Advance 3", "Episode II"];
    get = function() { return db_read(CONFIG_DATABASE, CONFIG_DEFAULT_HUD, keys[0]); };
    set = function(_val) { db_write(CONFIG_DATABASE, _val, keys[0]); };
}

with (new dev_option_int("Status Bar", mnu_visuals))
{
    keys = ["status_bar"];
    minimum = CONFIG_STATUS_BAR.OFF;
    maximum = CONFIG_STATUS_BAR.ALL;
    specifiers = ["Off", "Active", "All"];
    get = function() { return db_read(CONFIG_DATABASE, CONFIG_DEFAULT_STATUS_BAR, keys[0]); };
    set = function(_val) { db_write(CONFIG_DATABASE, _val, keys[0]); };
}

with (new dev_option_bool("Item Feed", mnu_visuals))
{
    keys = ["item_feed"];
    get = function() { return db_read(CONFIG_DATABASE, CONFIG_DEFAULT_TIME_OVER, keys[0]); };
    set = function(_val) { db_write(CONFIG_DATABASE, _val, keys[0]); };
}

with (new dev_option_int("Flicker", mnu_visuals))
{
    keys = ["flicker"];
    minimum = CONFIG_FLICKER.OFF;
    maximum = CONFIG_FLICKER.VIRTUAL_CONSOLE_ADVANCE_3;
    specifiers = ["Off", "Original", "Virtual Console", "Virtual Console (Advance 3)"];
    get = function() { return db_read(CONFIG_DATABASE, CONFIG_DEFAULT_FLICKER, keys[0]); };
    set = function(_val) { db_write(CONFIG_DATABASE, _val, keys[0]); };
}

// Gameplay

// Controls
with (new dev_option("Device Setup", mnu_controls))
{
    confirm = function() { InputPartySetJoin(true); };
}

with (new dev_option_bool("Aerial Mastery", mnu_controls))
{
    keys = ["aerial_mastery"];
    get = function() { return db_read(CONFIG_DATABASE, CONFIG_DEFAULT_AERIAL_MASTERY, keys[0]); };
    set = function(_val) { db_write(CONFIG_DATABASE, _val, keys[0]); };
}

with (new dev_option_int("Flight Style", mnu_controls))
{
    keys = ["flight_style"];
    minimum = CONFIG_FLIGHT_STYLE.CLASSIC;
    maximum = CONFIG_FLIGHT_STYLE.ADVENTURE;
    specifiers = ["Classic", "Adventure"];
    get = function() { return db_read(CONFIG_DATABASE, CONFIG_DEFAULT_FLIGHT_STYLE, keys[0]); };
    set = function(_val) { db_write(CONFIG_DATABASE, _val, keys[0]); };
}

with (new dev_option_bool("Flight Assist", mnu_controls))
{
    keys = ["flight_assist"];
    get = function() { return db_read(CONFIG_DATABASE, CONFIG_DEFAULT_FLIGHT_STYLE, keys[0]); };
    set = function(_val) { db_write(CONFIG_DATABASE, _val, keys[0]); };
}