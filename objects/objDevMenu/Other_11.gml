/// @description Character

// Sonic
with (new dev_option_int("Ground Skill", mnu_sonic))
{
    keys = ["sonic", "ground_skill"];
    minimum = SONIC_GROUND_SKILL.NONE;
    maximum = SONIC_GROUND_SKILL.HAMMER_ATTACK;
    specifiers = ["None", "Skid Attack", "Hammer Attack"];
    get = function() { return db_read(SAVE_DATABASE, SONIC_DEFAULT_GROUND_SKILL, keys[0], keys[1]); };
    set = function (_val) { db_write(SAVE_DATABASE, _val, keys[0], keys[1]); };
}

// Amy
with (new dev_option_int("Hammer Skill", mnu_amy))
{
    keys = ["amy", "hammer_skill"];
    minimum = AMY_HAMMER_SKILL.HAMMER_ATTACK;
    maximum = AMY_HAMMER_SKILL.BIG_HAMMER_ATTACK;
    specifiers = ["Hammer Attack", "Double Hammer Attack", "Big Hammer Attack"];
    get = function() { return db_read(SAVE_DATABASE, AMY_DEFAULT_HAMMER_SKILL, keys[0], keys[1]); };
    set = function(_val) { db_write(SAVE_DATABASE, _val, keys[0], keys[1]); };
}

with (new dev_option_bool("Hammer Whirl", mnu_amy))
{
    keys = ["amy", "hammer_whirl"];
    get = function() { return db_read(SAVE_DATABASE, AMY_DEFAULT_HAMMER_WHIRL, keys[0], keys[1]); };
    set = function(_val) { db_write(SAVE_DATABASE, _val, keys[0], keys[1]); };
}

with (new dev_option_bool("Hammer Jump", mnu_amy))
{
    keys = ["amy", "hammer_jump"];
    get = function() { return db_read(SAVE_DATABASE, AMY_DEFAULT_HAMMER_JUMP, keys[0], keys[1]); };
    set = function(_val) { db_write(SAVE_DATABASE, _val, keys[0], keys[1]); };
}

with (new dev_option_bool("Spin", mnu_amy))
{
    keys = ["amy", "spin"];
    get = function() { return db_read(SAVE_DATABASE, AMY_DEFAULT_SPIN, keys[0], keys[1]); };
    set = function(_val) { db_write(SAVE_DATABASE, _val, keys[0], keys[1]); };
}

with (new dev_option_int("Spin Dash Alt", mnu_amy))
{
    keys = ["amy", "spin_alt"];
    minimum = AMY_SPIN_ALT.LEAP;
    maximum = AMY_SPIN_ALT.DASH;
    specifiers = ["Leap", "Amy Dash"];
    get = function() { return db_read(SAVE_DATABASE, AMY_DEFAULT_SPIN_ALT, keys[0], keys[1]); };
    set = function(_val) { db_write(SAVE_DATABASE, _val, keys[0], keys[1]); };
}