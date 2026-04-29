// Constants
#macro SAVE_DATABASE global.save_database

// Create
global.save_database = db_create();

// Metadata
db_write(SAVE_DATABASE, "", "name");
db_write(SAVE_DATABASE, 0, "playtime");
db_write(SAVE_DATABASE, room_get_name(rmTest), "stage");

// Characters
for (var i = 0; i < INPUT_MAX_PLAYERS; i++)
{
    db_write(SAVE_DATABASE, CHARACTER.NONE, "character", i);
}

db_write(SAVE_DATABASE, CHARACTER.SONIC, "character", 0);

// Sonic
db_write(SAVE_DATABASE, SONIC_DEFAULT_GROUND_SKILL, "sonic", "ground_skill");
db_write(SAVE_DATABASE, SONIC_DEFAULT_JUMP_SKILL, "sonic", "jump_skill");
db_write(SAVE_DATABASE, SONIC_DEFAULT_AUX_SKILL, "sonic", "aux_skill");
db_write(SAVE_DATABASE, SONIC_DEFAULT_SLAM_SKILL, "sonic", "slam_skill");
db_write(SAVE_DATABASE, SONIC_DEFAULT_HOMING_ATTACK, "sonic", "homing_attack");
db_write(SAVE_DATABASE, SONIC_DEFAULT_PEEL_OUT, "sonic", "peel_out");
db_write(SAVE_DATABASE, SONIC_DEFAULT_SHIELD_ACTIONS, "sonic", "shield_actions");

// Miles
db_write(SAVE_DATABASE, MILES_DEFAULT_GROUND_SKILL, "miles", "ground_skill");

// Knuckles

// Amy
db_write(SAVE_DATABASE, AMY_DEFAULT_HAMMER_SKILL, "amy", "hammer_skill");
db_write(SAVE_DATABASE, AMY_DEFAULT_HAMMER_WHIRL, "amy", "hammer_whirl");
db_write(SAVE_DATABASE, AMY_DEFAULT_HAMMER_JUMP, "amy", "hammer_jump");
db_write(SAVE_DATABASE, AMY_DEFAULT_SPIN, "amy", "spin");
db_write(SAVE_DATABASE, AMY_DEFAULT_SPIN_ALT, "amy", "spin_alt");

// Cream