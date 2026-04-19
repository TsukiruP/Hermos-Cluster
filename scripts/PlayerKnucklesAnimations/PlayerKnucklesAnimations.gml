global.anim_knuckles_idle_v0 = new animation(sprKnucklesIdle, [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10, 5, 5, 5, 5, 5, 5, 5, 12, 6, 5, 5, 5, 5, 5, 5]);
global.anim_knuckles_idle = [global.anim_knuckles_idle_v0];

global.anim_knuckles_teeter_front_v0 = new animation(sprKnucklesTeeterFront, 3, 1);
global.anim_knuckles_teeter_back_v0 = new animation(sprKnucklesTeeterBack, [3, 4, 4, 4, 4, 4, 4], 1);
global.anim_knuckles_teeter = [global.anim_knuckles_teeter_front_v0, global.anim_knuckles_teeter_back_v0];

global.anim_knuckles_turn_v0 = new animation(sprKnucklesTurn, 1, -1);
global.anim_knuckles_turn_brake_v0 = new animation(sprKnucklesTurnBrake, 1, -1);
global.anim_knuckles_turn = [global.anim_knuckles_turn_v0, global.anim_knuckles_turn_brake_v0];

global.anim_knuckles_run_v0 = new animation(sprKnucklesRun0, 8);
global.anim_knuckles_run_v1 = new animation(sprKnucklesRun1, 8);
global.anim_knuckles_run_v2 = new animation(sprKnucklesRun2, 8);
global.anim_knuckles_run_v3 = new animation(sprKnucklesRun3, 8);
global.anim_knuckles_run_v4 = new animation(sprKnucklesRun4, 8);
global.anim_knuckles_run = [global.anim_knuckles_run_v0, global.anim_knuckles_run_v1, global.anim_knuckles_run_v2, global.anim_knuckles_run_v3, global.anim_knuckles_run_v4];

global.anim_knuckles_brake_v0 = new animation(sprKnucklesBrake, 2, 1);
global.anim_knuckles_brake_fast_v0 = new animation(sprKnucklesBrakeFast, [1, 1, 3, 3], 2);
global.anim_knuckles_brake = [global.anim_knuckles_brake_v0, global.anim_knuckles_brake_fast_v0];

global.anim_knuckles_look_v0 = new animation(sprKnucklesLook, [4, 4, 2], -1);
global.anim_knuckles_look_v1 = new animation(sprKnucklesLook, 2, -1, [1, 0]);
global.anim_knuckles_look = [global.anim_knuckles_look_v0, global.anim_knuckles_look_v1];

global.anim_knuckles_crouch_v0 = new animation(sprKnucklesCrouch, 1, -1);
global.anim_knuckles_crouch_v1 = new animation(sprKnucklesCrouch, 1, -1, [1, 0]);
global.anim_knuckles_crouch = [global.anim_knuckles_crouch_v0, global.anim_knuckles_crouch_v1];

global.anim_knuckles_roll_v0 = new animation(sprKnucklesRoll, 2);
global.anim_knuckles_roll = [global.anim_knuckles_roll_v0];

global.anim_knuckles_spin_dash_v0 = new animation(sprKnucklesSpinDash0, 2);
global.anim_knuckles_spin_dash_v1 = new animation(sprKnucklesSpinDash1, 2, -1);
global.anim_knuckles_spin_dash = [global.anim_knuckles_spin_dash_v0, global.anim_knuckles_spin_dash_v1];

global.anim_knuckles_fall_v0 = new animation(sprKnucklesSpring1, 2, -1, [4, 5]);
global.anim_knuckles_fall_v1 = new animation(sprKnucklesSpring2, 2);
global.anim_knuckles_fall = [global.anim_knuckles_fall_v0, global.anim_knuckles_fall_v1];

global.anim_knuckles_jump_v0 = new animation(sprKnucklesJump0, [3, 2], -1);
global.anim_knuckles_jump_v1 = new animation(sprKnucklesJump1, 2);
global.anim_knuckles_jump_v2 = new animation(sprKnucklesJump2, [1, 2, 2, 2], 1);
global.anim_knuckles_jump = [global.anim_knuckles_jump_v0, global.anim_knuckles_jump_v1, global.anim_knuckles_jump_v2];

global.anim_knuckles_hurt_v0 = new animation(sprKnucklesHurt0, [3, 8, 8, 8, 8], -1);
global.anim_knuckles_hurt_v1 = new animation(sprKnucklesHurt1, 5, -1);
global.anim_knuckles_hurt = [global.anim_knuckles_hurt_v0, global.anim_knuckles_hurt_v1];

global.anim_knuckles_dead_v0 = new animation(sprKnucklesDead, [3, 3, 12, 2, 3, 3], 4);
global.anim_knuckles_dead = [global.anim_knuckles_dead_v0];

global.anim_knuckles_spring_v0 = new animation(sprKnucklesSpring0, 3, 1);
global.anim_knuckles_spring_v1 = new animation(sprKnucklesSpring1, 3, -1);
global.anim_knuckles_spring_v2 = new animation(sprKnucklesSpring2, 3);
global.anim_knuckles_spring = [global.anim_knuckles_spring_v0, global.anim_knuckles_spring_v1, global.anim_knuckles_spring_v2];

global.anim_knuckles_spring_twirl_v0 = new animation(sprKnucklesSpringTwirl, [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3], 11);
global.anim_knuckles_spring_twirl = [global.anim_knuckles_spring_twirl_v0];

global.anim_knuckles_trick_up_v0 = new animation(sprKnucklesTrickUp0, [1, 2, 1], -1);
global.anim_knuckles_trick_up_v1 = new animation(sprKnucklesTrickUp1, [4, 4, 8, 8, 8], -1);
global.anim_knuckles_trick_up_v2 = new animation(sprKnucklesTrickUp2, [7, 6, 3, 3, 3], 2);
global.anim_knuckles_trick_up = [global.anim_knuckles_trick_up_v0, global.anim_knuckles_trick_up_v1, global.anim_knuckles_trick_up_v2];

global.anim_knuckles_trick_down_v0 = new animation(sprKnucklesTrickDown0, [2, 3, 2, 2], -1);
global.anim_knuckles_trick_down_v1 = new animation(sprKnucklesTrickDown1, 2);
global.anim_knuckles_trick_down_v2 = new animation(sprKnucklesTrickDown2, [1, 1, 1, 1, 4, 2, 2], -1);
global.anim_knuckles_trick_down = [global.anim_knuckles_trick_down_v0, global.anim_knuckles_trick_down_v1, global.anim_knuckles_trick_down_v2];

global.anim_knuckles_trick_front_v0 = new animation(sprKnucklesTrickFront0, [2, 2, 2, 2, 4], -1);
global.anim_knuckles_trick_front_v1 = new animation(sprKnucklesTrickFront1, 2, 3);
global.anim_knuckles_trick_front_v2 = new animation(sprKnucklesTrickFront2, 2, -1);
global.anim_knuckles_trick_front = [global.anim_knuckles_trick_front_v0, global.anim_knuckles_trick_front_v1, global.anim_knuckles_trick_front_v2];

global.anim_knuckles_trick_back_v0 = new animation(sprKnucklesTrickBack0, [2, 2, 4], -1);
global.anim_knuckles_trick_back_v1 = new animation(sprKnucklesTrickBack1, [2, 2, 3, 3], 2);
global.anim_knuckles_trick_back = [global.anim_knuckles_trick_back_v0, global.anim_knuckles_trick_back_v1];

global.anim_knuckles_flight_ride_v0 = new animation(sprKnucklesFlightRide, 5);
global.anim_knuckles_flight_ride = [global.anim_knuckles_flight_ride_v0];