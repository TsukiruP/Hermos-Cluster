global.anim_cream_idle_v0 = new animation(sprCreamIdle, [5, 5, 7, 10, 3, 3, 3, 7, 5, 5, 7, 10, 3, 3, 3, 7]);
global.anim_cream_idle = [global.anim_cream_idle_v0];

global.anim_cream_teeter_front_v0 = new animation(sprCreamTeeterFront, 3);
global.anim_cream_teeter_back_v0 = new animation(sprCreamTeeterBack, 4);
global.anim_cream_teeter = [global.anim_cream_teeter_front_v0, global.anim_cream_teeter_back_v0];

global.anim_cream_turn_v0 = new animation(sprCreamTurn, 1, -1);
global.anim_cream_turn_brake_v0 = new animation(sprCreamTurnBrake, 2, -1);
global.anim_cream_turn = [global.anim_cream_turn_v0, global.anim_cream_turn_brake_v0];

global.anim_cream_run_v0 = new animation(sprCreamRun0, 8);
global.anim_cream_run_v1 = new animation(sprCreamRun1, 8);
global.anim_cream_run_v2 = new animation(sprCreamRun2, 8);
global.anim_cream_run_v3 = new animation(sprCreamRun3, 8);
global.anim_cream_run_v4 = new animation(sprCreamRun4, 8);
global.anim_cream_run = [global.anim_cream_run_v0, global.anim_cream_run_v1, global.anim_cream_run_v2, global.anim_cream_run_v3, global.anim_cream_run_v4];

global.anim_cream_brake_v0 = new animation(sprCreamBrake, [2, 4, 4], 1);
global.anim_cream_brake_fast_v0 = new animation(sprCreamBrakeFast, 2);
global.anim_cream_brake = [global.anim_cream_brake_v0, global.anim_cream_brake_fast_v0];

global.anim_cream_look_v0 = new animation(sprCreamLook, [3, 3, 3, 60, 6, 6, 6], 3);
global.anim_cream_look_v1 = new animation(sprCreamLook, 2, -1, [3, 2, 1, 0]);
global.anim_cream_look = [global.anim_cream_look_v0, global.anim_cream_look_v1];

global.anim_cream_crouch_v0 = new animation(sprCreamCrouch, 1, -1);
global.anim_cream_crouch_v1 = new animation(sprCreamCrouch, 1, -1, [1, 0]);
global.anim_cream_crouch = [global.anim_cream_crouch_v0, global.anim_cream_crouch_v1];

global.anim_cream_roll_v0 = new animation(sprCreamRoll, 2);
global.anim_cream_roll = [global.anim_cream_roll_v0];

global.anim_cream_ears_v0 = new animation(sprCreamEars, 2);
global.anim_cream_ears = [global.anim_cream_ears_v0];

global.anim_cream_spin_dash_v0 = new animation(sprCreamSpinDash, 2);
global.anim_cream_spin_dash = [global.anim_cream_spin_dash_v0];

global.anim_cream_fall_v0 = new animation(sprCreamSpring1, 2, -1, [4, 5]);
global.anim_cream_fall_v1 = new animation(sprCreamSpring2, 2);
global.anim_cream_fall = [global.anim_cream_fall_v0, global.anim_cream_fall_v1];

global.anim_cream_jump_v0 = new animation(sprCreamJump0, 3, -1);
global.anim_cream_jump_v1 = new animation(sprCreamJump1, 2);
global.anim_cream_jump_v2 = new animation(sprCreamJump2, [1, 2, 2, 2], 1);
global.anim_cream_jump = [global.anim_cream_jump_v0, global.anim_cream_jump_v1, global.anim_cream_jump_v2];

global.anim_cream_hurt_v0 = new animation(sprCreamHurt0, [3, 8, 8, 8, 8], -1);
global.anim_cream_hurt_v1 = new animation(sprCreamHurt1, 5, -1);
global.anim_cream_hurt = [global.anim_cream_hurt_v0, global.anim_cream_hurt_v1];

global.anim_cream_dead_v0 = new animation(sprCreamDead, [6, 12, 2, 3, 3], 3);
global.anim_cream_dead = [global.anim_cream_dead_v0];

global.anim_cream_spring_v0 = new animation(sprCreamSpring0, 3, 1);
global.anim_cream_spring_v1 = new animation(sprCreamSpring1, [2, 3, 3, 4, 4, 4], -1);
global.anim_cream_spring_v2 = new animation(sprCreamSpring2, 3);
global.anim_cream_spring = [global.anim_cream_spring_v0, global.anim_cream_spring_v1, global.anim_cream_spring_v2];

global.anim_cream_spring_twirl_v0 = new animation(sprCreamSpringTwirl, [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2, 3, 3, 3], 12);
global.anim_cream_spring_twirl = [global.anim_cream_spring_twirl_v0];

global.anim_cream_trick_up_v0 = new animation(sprCreamTrickUp0, [1, 4, 4, 4, 2], -1);
global.anim_cream_trick_up_v1 = new animation(sprCreamTrickUp1, [2, 2, 2, 3, 3, 3], 3);
global.anim_cream_trick_up_v2 = new animation(sprCreamTrickUp2, [2, 2, 2, 2, 2, 3, 3, 3], 5);
global.anim_cream_trick_up = [global.anim_cream_trick_up_v0, global.anim_cream_trick_up_v1, global.anim_cream_trick_up_v2];

global.anim_cream_trick_down_v0 = new animation(sprCreamTrickDown0, [2, 2, 4, 6, 2], -1);
global.anim_cream_trick_down_v1 = new animation(sprCreamTrickDown1, [2, 2, 2, 3, 3, 3], 3);
global.anim_cream_trick_down = [global.anim_cream_trick_down_v0, global.anim_cream_trick_down_v1];

global.anim_cream_trick_front_v0 = new animation(sprCreamTrickFront0, [2, 2, 4, 1], -1);
global.anim_cream_trick_front_v1 = new animation(sprCreamTrickFront1, 2);
global.anim_cream_trick_front = [global.anim_cream_trick_front_v0, global.anim_cream_trick_front_v1];

global.anim_cream_trick_back_v0 = new animation(sprCreamTrickBack0, [2, 2, 4, 6, 2], -1);
global.anim_cream_trick_back_v1 = new animation(sprCreamTrickBack1, [2, 2, 3, 3, 3], 2);
global.anim_cream_trick_back_v2 = new animation(sprCreamTrickBack2, [2, 2, 2, 3, 3, 3], 3);
global.anim_cream_trick_back = [global.anim_cream_trick_back_v0, global.anim_cream_trick_back_v1, global.anim_cream_trick_back_v2];

global.anim_cream_flight_ride_v0 = new animation(sprCreamFlightRide, 5);
global.anim_cream_flight_ride = [global.anim_cream_flight_ride_v0];

global.anim_cream_flight_v0 = new animation(sprCreamFlight0, [2, 4, 4, 4, 4, 2, 1, 1, 2, 4, 4, 4, 4, 2, 1, 1]);
global.anim_cream_flight_v1 = new animation(sprCreamFlight1, 1, -1);
global.anim_cream_flight = [global.anim_cream_flight_v0, global.anim_cream_flight_v1];

global.anim_cream_flight_tired_v0 = new animation(sprCreamFlightTired, [6, 4, 6, 6, 6, 6, 6, 6, 6, 6], 2);
global.anim_cream_flight_tired = [global.anim_cream_flight_tired_v0];

global.anim_cream_flight_cancel_v0 = new animation(sprCreamFlightCancel, [2, 2, 3, 3, 3], 2);
global.anim_cream_flight_cancel = [global.anim_cream_flight_cancel_v0];