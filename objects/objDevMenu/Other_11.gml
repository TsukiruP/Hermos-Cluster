/// @description Character

// Amy
with (new dev_option_int("Hammer Skill", mnu_amy))
{
    minimum = AMY_HAMMER_SKILL.HAMMER_ATTACK;
    maximum = AMY_HAMMER_SKILL.BIG_HAMMER_ATTACK;
    specifiers = ["Hammer Attack", "Double Hammer Attack", "Big Hammer Attack"];
    get = function() { return db_read(SAVE_DATABASE, AMY_DEFAULT_HAMMER_SKILL, "amy", "hammer_skill"); };
    set = function(_val) { db_write(SAVE_DATABASE, _val, "amy", "hammer_skill"); };
}

with (new dev_option_bool("Hammer Whirl", mnu_amy))
{
    get = function() { return db_read(SAVE_DATABASE, AMY_DEFAULT_HAMMER_WHIRL, "amy", "hammer_whirl"); };
    set = function(_val) { db_write(SAVE_DATABASE, _val, "amy", "hammer_whirl"); };
}

with (new dev_option_bool("Hammer Jump", mnu_amy))
{
    get = function() { return db_read(SAVE_DATABASE, AMY_DEFAULT_HAMMER_JUMP, "amy", "hammer_jump"); };
    set = function(_val) { db_write(SAVE_DATABASE, _val, "amy", "hammer_jump"); };
}

with (new dev_option_bool("Spin", mnu_amy))
{
    get = function() { return db_read(SAVE_DATABASE, AMY_DEFAULT_SPIN, "amy", "spin"); };
    set = function(_val) { db_write(SAVE_DATABASE, _val, "amy", "spin"); };
}

with (new dev_option_int("Spin Dash Alt", mnu_amy))
{
    minimum = AMY_SPIN_ALT.LEAP;
    maximum = AMY_SPIN_ALT.DASH;
    specifiers = ["Leap", "Amy Dash"];
    get = function() { return db_read(SAVE_DATABASE, AMY_DEFAULT_SPIN_ALT, "amy", "spin_alt"); };
    set = function(_val) { db_write(SAVE_DATABASE, _val, "amy", "spin_alt"); };
}