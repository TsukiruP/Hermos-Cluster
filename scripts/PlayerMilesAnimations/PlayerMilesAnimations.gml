global.anim_miles_idle_v0 = new animation(sprMilesIdle, 8);
global.anim_miles_idle = [global.anim_miles_idle_v0];

global.anim_miles_teeter_front_v0 = new animation(sprMilesTeeterFront, 3, 1);
global.anim_miles_teeter_back_v0 = new animation(sprMilesTeeterBack, 4, 1);
global.anim_miles_teeter = [global.anim_miles_teeter_front_v0, global.anim_miles_teeter_back_v0];

global.anim_miles_turn_v0 = new animation(sprMilesTurn, 1, -1);
global.anim_miles_turn_brake_v0 = new animation(sprMilesTurnBrake, 2, -1);
global.anim_miles_turn = [global.anim_miles_turn_v0, global.anim_miles_turn_brake_v0];

global.anim_miles_run_v0 = new animation(sprMilesRun0, 8);
global.anim_miles_run_v1 = new animation(sprMilesRun1, 8);
global.anim_miles_run_v2 = new animation(sprMilesRun2, 8);
global.anim_miles_run_v3 = new animation(sprMilesRun3, 8);
global.anim_miles_run_v4 = new animation(sprMilesRun4, 8);
global.anim_miles_run_v5 = new animation(sprMilesRun5, 8);
global.anim_miles_run = [global.anim_miles_run_v0, global.anim_miles_run_v1, global.anim_miles_run_v2, global.anim_miles_run_v3, global.anim_miles_run_v4, global.anim_miles_run_v5];

global.anim_miles_brake_v0 = new animation(sprMilesBrake, [2, 4, 4, 4], 1);
global.anim_miles_brake_fast_v0 = new animation(sprMilesBrakeFast, [2, 3, 3], 1);
global.anim_miles_brake = [global.anim_miles_brake_v0, global.anim_miles_brake_fast_v0];

global.anim_miles_look_v0 = new animation(sprMilesLook, [4, 4, 10, 10, 10, 10], 2);
global.anim_miles_look_v1 = new animation(sprMilesLook, 2, -1, [1, 0]);
global.anim_miles_look = [global.anim_miles_look_v0, global.anim_miles_look_v1];

global.anim_miles_crouch_v0 = new animation(sprMilesCrouch, [1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6], 2);
global.anim_miles_crouch_v1 = new animation(sprMilesCrouch, 1, -1, [1, 0]);
global.anim_miles_crouch = [global.anim_miles_crouch_v0, global.anim_miles_crouch_v1];

global.anim_miles_roll_v0 = new animation(sprMilesRoll, 2);
global.anim_miles_roll = [global.anim_miles_roll_v0];

global.anim_miles_tails_v0 = new animation(sprMilesTails, 2);
global.anim_miles_tails = [global.anim_miles_tails_v0];

global.anim_miles_spin_dash_v0 = new animation(sprMilesSpinDash0, 2);
global.anim_miles_spin_dash_v1 = new animation(sprMilesSpinDash1, 2, -1);
global.anim_miles_spin_dash = [global.anim_miles_spin_dash_v0, global.anim_miles_spin_dash_v1];

global.anim_miles_fall_v0 = new animation(sprMilesSpring1, 2, -1, [4, 5]);
global.anim_miles_fall_v1 = new animation(sprMilesSpring2, 2);
global.anim_miles_fall = [global.anim_miles_fall_v0, global.anim_miles_fall_v1];

global.anim_miles_jump_v0 = new animation(sprMilesJump0, 3, -1);
global.anim_miles_jump_v1 = new animation(sprMilesJump1, 2);
global.anim_miles_jump_v2 = new animation(sprMilesJump2, [1, 2, 2, 2, 2, 2], 3);
global.anim_miles_jump = [global.anim_miles_jump_v0, global.anim_miles_jump_v1, global.anim_miles_jump_v2];

global.anim_miles_hurt_v0 = new animation(sprMilesHurt0, [3, 8, 8, 8, 8], -1);
global.anim_miles_hurt_v1 = new animation(sprMilesHurt1, 5, -1);
global.anim_miles_hurt = [global.anim_miles_hurt_v0, global.anim_miles_hurt_v1];

global.anim_miles_dead_v0 = new animation(sprMilesDead, [3, 3, 12, 2, 3, 3], 4);
global.anim_miles_dead = [global.anim_miles_dead_v0];

global.anim_miles_spring_v0 = new animation(sprMilesSpring0, 2);
global.anim_miles_spring_v1 = new animation(sprMilesSpring1, [2, 3, 3, 4, 4, 4], -1);
global.anim_miles_spring_v2 = new animation(sprMilesSpring2, 3, 1);
global.anim_miles_spring = [global.anim_miles_spring_v0, global.anim_miles_spring_v1, global.anim_miles_spring_v2];

global.anim_miles_spring_twirl_v0 = new animation(sprMilesSpringTwirl, [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3], 11);
global.anim_miles_spring_twirl = [global.anim_miles_spring_twirl_v0];

global.anim_miles_trick_up_v0 = new animation(sprMilesTrickUp0, [2, 1, 1, 8], -1);
global.anim_miles_trick_up_v1 = new animation(sprMilesTrickUp1, [3, 4, 4, 4, 4], 2);
global.anim_miles_trick_up_v2 = new animation(sprMilesTrickUp2, [2, 4, 4, 3, 3, 3], 3);
global.anim_miles_trick_up = [global.anim_miles_trick_up_v0, global.anim_miles_trick_up_v1, global.anim_miles_trick_up_v2];

global.anim_miles_trick_down_v0 = new animation(sprMilesTrickDown0, [2, 2, 4], -1);
global.anim_miles_trick_down_v1 = new animation(sprMilesTrickDown1, [2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3], 3);
global.anim_miles_trick_down = [global.anim_miles_trick_down_v0, global.anim_miles_trick_down_v1];

global.anim_miles_trick_front_v0 = new animation(sprMilesTrickFront0, [2, 2, 2, 2, 4], -1);
global.anim_miles_trick_front_v1 = new animation(sprMilesTrickFront1, [2, 1, 1, 1, 3, 3, 3, 3, 3, 3, 3, 3], 4);
global.anim_miles_trick_front_v2 = new animation(sprMilesTrickFront2, 3, 1);
global.anim_miles_trick_front = [global.anim_miles_trick_front_v0, global.anim_miles_trick_front_v1, global.anim_miles_trick_front_v2];

global.anim_miles_trick_back_v0 = new animation(sprMilesTrickBack0, [2, 2, 2, 4], -1);
global.anim_miles_trick_back_v1 = new animation(sprMilesTrickBack1, [2, 2, 2, 3, 3, 3, 3], 3);
global.anim_miles_trick_back_v2 = new animation(sprMilesTrickBack2, [4, 4, 4, 4, 3, 3, 3, 3, 3, 3], 7);
global.anim_miles_trick_back = [global.anim_miles_trick_back_v0, global.anim_miles_trick_back_v1, global.anim_miles_trick_back_v2];

global.anim_miles_flight_v0 = new animation(sprMilesFlight0, 2);
global.anim_miles_flight_v1 = new animation(sprMilesFlight1, 1, -1);
global.anim_miles_flight = [global.anim_miles_flight_v0, global.anim_miles_flight_v1];

global.anim_miles_flight_hammer_v0 = new animation(sprMilesHammerFlight0, 2);
global.anim_miles_flight_hammer_v1 = new animation(sprMilesHammerFlight1, [1, 1, 1, 2, 3, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2], -1);
global.anim_miles_flight_hammer = [global.anim_miles_flight_hammer_v0, global.anim_miles_flight_hammer_v1];

global.anim_miles_flight_tired_v0 = new animation(sprMilesFlightTired, [6, 4, 6, 6, 6, 6, 6, 6, 6, 6], 2);
global.anim_miles_flight_tired = [global.anim_miles_flight_tired_v0];

global.anim_miles_flight_cancel_v0 = new animation(sprMilesFlightCancel, 3, 2);
global.anim_miles_flight_cancel = [global.anim_miles_flight_cancel_v0];