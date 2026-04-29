/// @description Creates a new menu.
/// @param {Array} options Options to display.
function dev_menu(_options = []) constructor
{
    options = _options;
    cursor = 0;
}

/// @description Adds the current menu to the history before going to the given menu.
/// @param {Struct.dev_menu} menu Menu to go to.
function dev_menu_goto(_menu)
{
    array_push(menu_history, menu_index);
    menu_index = _menu;
    menu_index.cursor = 0;
}

/// @description Goes to a character menu.
/// @param {Real} index Character to get the menu of.
function dev_menu_goto_character(_index)
{
    if (_index != CHARACTER.NONE)
    {
        with (objDevMenu)
        {
            var character_menus = [mnu_sonic, mnu_miles, mnu_knuckles, mnu_amy, mnu_cream];
            dev_menu_goto(character_menus[_index]);
        }
    }
}

/// @description Creates a new option.
/// @param {String} label Label to display.
/// @param {Struct.dev_menu} menu Menu to push to.
function dev_option(_label, _menu) constructor
{
    label = _label;
    keys = [];
    confirm = function() {};
    array_push(_menu.options, self);
}

/// @description Creates a new value option.
/// @param {String} label Label to display.
/// @param {Struct.dev_menu} menu Menu to push to.
function dev_option_value(_label, _menu) : dev_option(_label, _menu) constructor
{
    get = function() {};
    set = function(_val) {};
    update = function() {};
    toString = function() {};
}

/// @description Creates a new boolean option.
/// @param {String} label Label to display.
/// @param {Struct.dev_menu} menu Menu to push to.
function dev_option_bool(_label, _menu) : dev_option_value(_label, _menu) constructor
{
    get = function() { return false; };
    update = function() { set(not get()); };
    toString = function() { return (get() ? "True" : "False"); };
}

/// @description Creates a new real number option.
/// @param {String} label Label to display.
/// @param {Struct.dev_menu} menu Menu to push to.
function dev_option_real(_label, _menu) : dev_option_value(_label, _menu) constructor
{
    minimum = 0;
    maximum = 0;
    step = 1;
    wrap = true;
    get = function() { return 0; };
    update = function(_dir)
    {
        var value = get() + _dir * step;
        if (wrap)
        {
            value = clamp_inverse(value, minimum, maximum);
        }
        else
        {
            value = clamp(value, minimum, maximum);
        }
        
        set(value);
    };
    toString =  function() { return string(get()); };
}

/// @description Creates a new integer option.
/// @param {String} label Label to display.
/// @param {Struct.dev_menu} menu Menu to push to.
function dev_option_int(_label, _menu) : dev_option_real(_label, _menu) constructor
{
    offset = 0;
    specifiers = [];
    toString = function()
    {
        if (array_length(specifiers) > 0)
        {
            var index = get() - offset;
            return specifiers[index];
        }
        else
        {
            return string(get());
        }
    };
}

/// @description Creates a new array option.
/// @param {String} label Label to display.
/// @param {Struct.dev_menu} menu Menu to push to.
function dev_option_array(_label, _menu) : dev_option_value(_label, _menu) constructor
{
    index = 0;
    elements = [];
    get = function() { return index; };
    set = function(_val) { index = clamp_inverse(index + _val, 0, array_length(elements) - 1); };
    update = function(_dir) { set(_dir); };
    toString = function() { return $"{elements[index]}"; };
}

/// @description Creates a new player option.
/// @param {Real} player Player to display.
/// @param {Struct.dev_menu} menu Menu to push to.
function dev_option_player(_player, _menu) : dev_option_int($"Player {_player}", _menu) constructor
{
    keys = ["character", _player];
    minimum = (keys[1] == 0 ? CHARACTER.SONIC : CHARACTER.NONE);
    maximum = CHARACTER.CREAM;
    offset = CHARACTER.NONE;
    specifiers = ["None", "Sonic", "Miles", "Knuckles", "Amy", "Cream"];
    confirm = function() { dev_menu_goto_character(get()); };
    get = function() { return db_read(SAVE_DATABASE, CHARACTER.NONE, keys[0], keys[1]); };
    set = function(_val) { db_write(SAVE_DATABASE, _val, keys[0], keys[1]); };
}