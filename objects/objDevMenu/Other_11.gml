/// @description Character

#region Sonic

with (new dev_option_int("Ground Skill", mnu_sonic))
{
    keys = ["sonic", "ground_skill"];
    minimum = SONIC_GROUND_SKILL.NONE;
    maximum = SONIC_GROUND_SKILL.HAMMER_ATTACK;
    specifiers = ["None", "Skid Attack", "Hammer Attack"];
    get = function() { return db_read(SAVE_DATABASE, SONIC_DEFAULT_GROUND_SKILL, keys[0], keys[1]); };
    set = function (_val) { db_write(SAVE_DATABASE, _val, keys[0], keys[1]); };
}

with (new dev_option_int("Jump Skill", mnu_sonic))
{
    keys = ["sonic", "jump_skill"];
    minimum = SONIC_AIR_SKILL.NONE;
    maximum = SONIC_AIR_SKILL.DROP_DASH;
    specifiers = ["None", "Insta-Shield", "Air Dash", "Drop Dash"];
    get = function() { return db_read(SAVE_DATABASE, SONIC_DEFAULT_JUMP_SKILL, keys[0], keys[1]); };
    set = function (_val) { db_write(SAVE_DATABASE, _val, keys[0], keys[1]); };
}

with (new dev_option_int("Aux Skill", mnu_sonic))
{
    keys = ["sonic", "aux_skill"];
    minimum = SONIC_AIR_SKILL.NONE;
    maximum = SONIC_AIR_SKILL.AIR_DASH;
    specifiers = ["None", "Insta-Shield", "Air Dash", "Drop Dash"];
    get = function() { return db_read(SAVE_DATABASE, SONIC_DEFAULT_AUX_SKILL, keys[0], keys[1]); };
    set = function (_val) { db_write(SAVE_DATABASE, _val, keys[0], keys[1]); };
}

with (new dev_option_int("Slam Skill", mnu_sonic))
{
    keys = ["sonic", "slam_skill"];
    minimum = SONIC_SLAM_SKILL.NONE
    maximum = SONIC_SLAM_SKILL.STOMP;
    specifiers = ["None", "Bound", "Stomp"];
    get = function() { return db_read(SAVE_DATABASE, SONIC_DEFAULT_SLAM_SKILL, keys[0], keys[1]); };
    set = function (_val) { db_write(SAVE_DATABASE, _val, keys[0], keys[1]); };
}

with (new dev_option_int("Homing Attack", mnu_sonic))
{
    keys = ["sonic", "homing_attack"];
    minimum = SONIC_HOMING_ATTACK.NONE;
    maximum = SONIC_HOMING_ATTACK.GENERATIONS;
    specifiers = ["None", "Adventure", "Rush", "Unleashed", "Frontiers", "Generations"];
    get = function() { return db_read(SAVE_DATABASE, SONIC_DEFAULT_HOMING_ATTACK, keys[0], keys[1]); };
    set = function (_val) { db_write(SAVE_DATABASE, _val, keys[0], keys[1]); };
}

with (new dev_option_bool("Super Peel Out", mnu_sonic))
{
    keys = ["sonic", "peel_out"];
    get = function() { return db_read(SAVE_DATABASE, SONIC_DEFAULT_PEEL_OUT, keys[0], keys[1]); };
    set = function (_val) { db_write(SAVE_DATABASE, _val, keys[0], keys[1]); };
}

with (new dev_option_bool("Shield Actions", mnu_sonic))
{
    keys = ["sonic", "shield_actions"];
    get = function() { return db_read(SAVE_DATABASE, SONIC_DEFAULT_SHIELD_ACTIONS, keys[0], keys[1]); };
    set = function (_val) { db_write(SAVE_DATABASE, _val, keys[0], keys[1]); };
}

#endregion

#region Amy

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

#endregion