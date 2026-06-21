global.animations = {};

with (global.animations)
{
    #region Player
    
    #region Characters
    
    #region Sonic
    
    sonic_idle_v0 = new animation(sprSonicIdle, [6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 12, 6, 6, 6, 12, 8, 6, 6, 6, 6]);
    sonic_idle = [sonic_idle_v0];
    
    sonic_teeter_front_v0 = new animation(sprSonicTeeterFront, 3, 1);
    sonic_teeter_back_v0 = new animation(sprSonicTeeterBack, [3, 4, 4, 4, 4, 4, 4, 4, 4], 1);
    sonic_teeter = [sonic_teeter_front_v0, sonic_teeter_back_v0];
    
    sonic_turn_v0 = new animation(sprSonicTurn, 1, -1);
    sonic_turn_brake_v0 = new animation(sprSonicTurnBrake, 2, -1);
    sonic_turn = [sonic_turn_v0, sonic_turn_brake_v0];
    
    sonic_run_v0 = new animation(sprSonicRun0, 8);
    sonic_run_v1 = new animation(sprSonicRun1, 8);
    sonic_run_v2 = new animation(sprSonicRun2, 8);
    sonic_run_v3 = new animation(sprSonicRun3, 8);
    sonic_run_v4 = new animation(sprSonicRun4, 8);
    sonic_run = [sonic_run_v0, sonic_run_v1, sonic_run_v2, sonic_run_v3, sonic_run_v4];
    
    sonic_brake_v0 = new animation(sprSonicBrake, [2, 4, 4], 1);
    sonic_brake_fast_v0 = new animation(sprSonicBrakeFast, [1, 1, 3, 3], 2);
    sonic_brake = [sonic_brake_v0, sonic_brake_fast_v0];
    
    sonic_push_v0 = new animation(sprSonicPush, 6, 1);
    sonic_push = [sonic_push_v0];
    
    sonic_look_v0 = new animation(sprSonicLook, [4, 4, 12, 12, 12, 12], 2);
    sonic_look_v1 = new animation(sprSonicLook, 2, -1, [1, 0]);
    sonic_look = [sonic_look_v0, sonic_look_v1];
    
    sonic_crouch_v0 = new animation(sprSonicCrouch, 1, -1);
    sonic_crouch_v1 = new animation(sprSonicCrouch, 1, -1, [1, 0]);
    sonic_crouch = [sonic_crouch_v0, sonic_crouch_v1];
    
    sonic_roll_v0 = new animation(sprSonicRoll, 2);
    sonic_roll = [sonic_roll_v0];
    
    sonic_spin_dash_v0 = new animation(sprSonicSpinDash0, 2);
    sonic_spin_dash_v1 = new animation(sprSonicSpinDash1, 2, -1);
    sonic_spin_dash = [sonic_spin_dash_v0, sonic_spin_dash_v1];
    
    sonic_fall_v0 = new animation(sprSonicSpring1, 2, -1, [4, 5]);
    sonic_fall_v1 = new animation(sprSonicSpring2, 2);
    sonic_fall = [sonic_fall_v0, sonic_fall_v1];
    
    sonic_jump_v0 = new animation(sprSonicJump0, [3, 2], -1);
    sonic_jump_v1 = new animation(sprSonicJump1, 2);
    sonic_jump_v2 = new animation(sprSonicJump2, [1, 2, 2, 2], 1);
    sonic_jump = [sonic_jump_v0, sonic_jump_v1, sonic_jump_v2];
    
    sonic_hurt_v0 = new animation(sprSonicHurt0, [3, 8, 8, 8, 8], -1);
    sonic_hurt_v1 = new animation(sprSonicHurt1, 5, -1);
    sonic_hurt = [sonic_hurt_v0, sonic_hurt_v1];
    
    sonic_dead_v0 = new animation(sprSonicDead, [3, 3, 12, 2, 3, 3], 4);
    sonic_dead = [sonic_dead_v0];
    
    sonic_spring_v0 = new animation(sprSonicSpring0, 3, 1);
    sonic_spring_v1 = new animation(sprSonicSpring1, [2, 2, 2, 3, 3, 3], -1);
    sonic_spring_v2 = new animation(sprSonicSpring2, 3);
    sonic_spring = [sonic_spring_v0, sonic_spring_v1, sonic_spring_v2];
    
    sonic_spring_twirl_v0 = new animation(sprSonicSpringTwirl, [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3], 11);
    sonic_spring_twirl = [sonic_spring_twirl_v0];
    
    sonic_trick_up_v0 = new animation(sprSonicTrickUp0, [3, 6, 2], -1);
    sonic_trick_up_v1 = new animation(sprSonicTrickUp1, [1, 1, 3, 3, 3], 2);
    sonic_trick_up_v2 = new animation(sprSonicTrickUp2, [3, 3, 3, 2, 2, 2], 3);
    sonic_trick_up = [sonic_trick_up_v0, sonic_trick_up_v1, sonic_trick_up_v2];
    
    sonic_trick_down_v0 = new animation(sprSonicTrickDown0, [3, 3, 6, 2, 2, 2, 2, 2], -1);
    sonic_trick_down_v2 = new animation(sprSonicTrickDown2, [2, 2, 2, 2, 3, 3, 3], 4);
    sonic_trick_down = [sonic_trick_down_v0, sonic_roll_v0, sonic_trick_down_v2];
    
    sonic_trick_front_v0 = new animation(sprSonicTrickFront0, [2, 4, 1], -1);
    sonic_trick_front_v1 = new animation(sprSonicTrickFront1, 1);
    sonic_trick_front = [sonic_trick_front_v0, sonic_trick_front_v1];
    
    sonic_trick_back_v0 = new animation(sprSonicTrickBack, 1, -1, [0]);
    sonic_trick_back_v1 = new animation(sprSonicTrickBack, [5, 4, 3, 2, 2, 2, 2, 2, 3, 3, 3], 8);
    sonic_trick_back = [sonic_trick_back_v0, sonic_trick_back_v1];
    
    sonic_flight_ride_v0 = new animation(sprSonicFlightRide, 5);
    sonic_flight_ride = [sonic_flight_ride_v0];
    
    sonic_air_dash_v0 = new animation(sprSonicAirDash, 2, -1, [0, 1, 2, 3]);
    sonic_air_dash_v1 = new animation(sprSonicAirDash, 2, 0, [4, 5, 6]);
    sonic_air_dash = [sonic_air_dash_v0, sonic_air_dash_v1];
    
    #endregion
    
    #region Miles
    
    miles_idle_v0 = new animation(sprMilesIdle, 8);
    miles_idle = [miles_idle_v0];
    
    miles_teeter_front_v0 = new animation(sprMilesTeeterFront, 3, 1);
    miles_teeter_back_v0 = new animation(sprMilesTeeterBack, 4, 1);
    miles_teeter = [miles_teeter_front_v0, miles_teeter_back_v0];
    
    miles_turn_v0 = new animation(sprMilesTurn, 1, -1);
    miles_turn_brake_v0 = new animation(sprMilesTurnBrake, 2, -1);
    miles_turn = [miles_turn_v0, miles_turn_brake_v0];
    
    miles_run_v0 = new animation(sprMilesRun0, 8);
    miles_run_v1 = new animation(sprMilesRun1, 8);
    miles_run_v2 = new animation(sprMilesRun2, 8);
    miles_run_v3 = new animation(sprMilesRun3, 8);
    miles_run_v4 = new animation(sprMilesRun4, 8);
    miles_run_v5 = new animation(sprMilesRun5, 8);
    miles_run = [miles_run_v0, miles_run_v1, miles_run_v2, miles_run_v3, miles_run_v4, miles_run_v5];
    
    miles_brake_v0 = new animation(sprMilesBrake, [2, 4, 4, 4], 1);
    miles_brake_fast_v0 = new animation(sprMilesBrakeFast, [2, 3, 3], 1);
    miles_brake = [miles_brake_v0, miles_brake_fast_v0];
    
    miles_push_v0 = new animation(sprMilesPush, [4, 7, 7, 7, 7, 7, 7, 7, 7], 1);
    miles_push = [miles_push_v0];
    
    miles_look_v0 = new animation(sprMilesLook, [4, 4, 10, 10, 10, 10], 2);
    miles_look_v1 = new animation(sprMilesLook, 2, -1, [1, 0]);
    miles_look = [miles_look_v0, miles_look_v1];
    
    miles_crouch_v0 = new animation(sprMilesCrouch, [1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6], 2);
    miles_crouch_v1 = new animation(sprMilesCrouch, 1, -1, [1, 0]);
    miles_crouch = [miles_crouch_v0, miles_crouch_v1];
    
    miles_roll_v0 = new animation(sprMilesRoll, 2);
    miles_roll = [miles_roll_v0];
    
    miles_tails_v0 = new animation(sprMilesTails, 2);
    miles_tails = [miles_tails_v0];
    
    miles_spin_dash_v0 = new animation(sprMilesSpinDash0, 2);
    miles_spin_dash_v1 = new animation(sprMilesSpinDash1, 2, -1);
    miles_spin_dash = [miles_spin_dash_v0, miles_spin_dash_v1];
    
    miles_fall_v0 = new animation(sprMilesSpring1, 2, -1, [4, 5]);
    miles_fall_v1 = new animation(sprMilesSpring2, 2);
    miles_fall = [miles_fall_v0, miles_fall_v1];
    
    miles_jump_v0 = new animation(sprMilesJump0, 3, -1);
    miles_jump_v1 = new animation(sprMilesJump1, 2);
    miles_jump_v2 = new animation(sprMilesJump2, [1, 2, 2, 2, 2, 2], 3);
    miles_jump = [miles_jump_v0, miles_jump_v1, miles_jump_v2];
    
    miles_hurt_v0 = new animation(sprMilesHurt0, [3, 8, 8, 8, 8], -1);
    miles_hurt_v1 = new animation(sprMilesHurt1, 5, -1);
    miles_hurt = [miles_hurt_v0, miles_hurt_v1];
    
    miles_dead_v0 = new animation(sprMilesDead, [3, 3, 12, 2, 3, 3], 4);
    miles_dead = [miles_dead_v0];
    
    miles_spring_v0 = new animation(sprMilesSpring0, 2);
    miles_spring_v1 = new animation(sprMilesSpring1, [2, 3, 3, 4, 4, 4], -1);
    miles_spring_v2 = new animation(sprMilesSpring2, 3, 1);
    miles_spring = [miles_spring_v0, miles_spring_v1, miles_spring_v2];
    
    miles_spring_twirl_v0 = new animation(sprMilesSpringTwirl, [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3], 11);
    miles_spring_twirl = [miles_spring_twirl_v0];
    
    miles_trick_up_v0 = new animation(sprMilesTrickUp0, [2, 1, 1, 8], -1);
    miles_trick_up_v1 = new animation(sprMilesTrickUp1, [3, 4, 4, 4, 4], 2);
    miles_trick_up_v2 = new animation(sprMilesTrickUp2, [2, 4, 4, 3, 3, 3], 3);
    miles_trick_up = [miles_trick_up_v0, miles_trick_up_v1, miles_trick_up_v2];
    
    miles_trick_down_v0 = new animation(sprMilesTrickDown0, [2, 2, 4], -1);
    miles_trick_down_v1 = new animation(sprMilesTrickDown1, [2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3], 3);
    miles_trick_down = [miles_trick_down_v0, miles_trick_down_v1];
    
    miles_trick_front_v0 = new animation(sprMilesTrickFront0, [2, 2, 2, 2, 4], -1);
    miles_trick_front_v1 = new animation(sprMilesTrickFront1, [2, 1, 1, 1, 3, 3, 3, 3, 3, 3, 3, 3], 4);
    miles_trick_front_v2 = new animation(sprMilesTrickFront2, 3, 1);
    miles_trick_front = [miles_trick_front_v0, miles_trick_front_v1, miles_trick_front_v2];
    
    miles_trick_back_v0 = new animation(sprMilesTrickBack0, [2, 2, 2, 4], -1);
    miles_trick_back_v1 = new animation(sprMilesTrickBack1, [2, 2, 2, 3, 3, 3, 3], 3);
    miles_trick_back_v2 = new animation(sprMilesTrickBack2, [4, 4, 4, 4, 3, 3, 3, 3, 3, 3], 7);
    miles_trick_back = [miles_trick_back_v0, miles_trick_back_v1, miles_trick_back_v2];
    
    miles_flight_v0 = new animation(sprMilesFlight0, 2);
    miles_flight_v1 = new animation(sprMilesFlight1, 1, -1);
    miles_flight = [miles_flight_v0, miles_flight_v1];
    
    miles_flight_hammer_v0 = new animation(sprMilesHammerFlight0, 2);
    miles_flight_hammer_v1 = new animation(sprMilesHammerFlight1, [1, 1, 1, 2, 3, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2], -1);
    miles_flight_hammer = [miles_flight_hammer_v0, miles_flight_hammer_v1];
    
    miles_flight_tired_v0 = new animation(sprMilesFlightTired, [6, 4, 6, 6, 6, 6, 6, 6, 6, 6], 2);
    miles_flight_tired = [miles_flight_tired_v0];
    
    miles_flight_cancel_v0 = new animation(sprMilesFlightCancel, 3, 2);
    miles_flight_cancel = [miles_flight_cancel_v0];
    
    #endregion 
    
    #region Knuckles
    
    knuckles_idle_v0 = new animation(sprKnucklesIdle, [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10, 5, 5, 5, 5, 5, 5, 5, 12, 6, 5, 5, 5, 5, 5, 5]);
    knuckles_idle = [knuckles_idle_v0];
    
    knuckles_teeter_front_v0 = new animation(sprKnucklesTeeterFront, 3, 1);
    knuckles_teeter_back_v0 = new animation(sprKnucklesTeeterBack, [3, 4, 4, 4, 4, 4, 4], 1);
    knuckles_teeter = [knuckles_teeter_front_v0, knuckles_teeter_back_v0];
    
    knuckles_turn_v0 = new animation(sprKnucklesTurn, 1, -1);
    knuckles_turn_brake_v0 = new animation(sprKnucklesTurnBrake, 1, -1);
    knuckles_turn = [knuckles_turn_v0, knuckles_turn_brake_v0];
    
    knuckles_run_v0 = new animation(sprKnucklesRun0, 8);
    knuckles_run_v1 = new animation(sprKnucklesRun1, 8);
    knuckles_run_v2 = new animation(sprKnucklesRun2, 8);
    knuckles_run_v3 = new animation(sprKnucklesRun3, 8);
    knuckles_run_v4 = new animation(sprKnucklesRun4, 8);
    knuckles_run = [knuckles_run_v0, knuckles_run_v1, knuckles_run_v2, knuckles_run_v3, knuckles_run_v4];
    
    knuckles_brake_v0 = new animation(sprKnucklesBrake, 2, 1);
    knuckles_brake_fast_v0 = new animation(sprKnucklesBrakeFast, [1, 1, 3, 3], 2);
    knuckles_brake = [knuckles_brake_v0, knuckles_brake_fast_v0];
    
    knuckles_push_v0 = new animation(sprKnucklesPush, [4, 6, 6, 6, 6, 6, 6, 6, 6], 1);
    knuckles_push = [knuckles_push_v0];
    
    knuckles_look_v0 = new animation(sprKnucklesLook, [4, 4, 2], -1);
    knuckles_look_v1 = new animation(sprKnucklesLook, 2, -1, [1, 0]);
    knuckles_look = [knuckles_look_v0, knuckles_look_v1];
    
    knuckles_crouch_v0 = new animation(sprKnucklesCrouch, 1, -1);
    knuckles_crouch_v1 = new animation(sprKnucklesCrouch, 1, -1, [1, 0]);
    knuckles_crouch = [knuckles_crouch_v0, knuckles_crouch_v1];
    
    knuckles_roll_v0 = new animation(sprKnucklesRoll, 2);
    knuckles_roll = [knuckles_roll_v0];
    
    knuckles_spin_dash_v0 = new animation(sprKnucklesSpinDash0, 2);
    knuckles_spin_dash_v1 = new animation(sprKnucklesSpinDash1, 2, -1);
    knuckles_spin_dash = [knuckles_spin_dash_v0, knuckles_spin_dash_v1];
    
    knuckles_fall_v0 = new animation(sprKnucklesSpring1, 2, -1, [4, 5]);
    knuckles_fall_v1 = new animation(sprKnucklesSpring2, 2);
    knuckles_fall = [knuckles_fall_v0, knuckles_fall_v1];
    
    knuckles_jump_v0 = new animation(sprKnucklesJump0, [3, 2], -1);
    knuckles_jump_v1 = new animation(sprKnucklesJump1, 2);
    knuckles_jump_v2 = new animation(sprKnucklesJump2, [1, 2, 2, 2], 1);
    knuckles_jump = [knuckles_jump_v0, knuckles_jump_v1, knuckles_jump_v2];
    
    knuckles_hurt_v0 = new animation(sprKnucklesHurt0, [3, 8, 8, 8, 8], -1);
    knuckles_hurt_v1 = new animation(sprKnucklesHurt1, 5, -1);
    knuckles_hurt = [knuckles_hurt_v0, knuckles_hurt_v1];
    
    knuckles_dead_v0 = new animation(sprKnucklesDead, [3, 3, 12, 2, 3, 3], 4);
    knuckles_dead = [knuckles_dead_v0];
    
    knuckles_spring_v0 = new animation(sprKnucklesSpring0, 3, 1);
    knuckles_spring_v1 = new animation(sprKnucklesSpring1, 3, -1);
    knuckles_spring_v2 = new animation(sprKnucklesSpring2, 3);
    knuckles_spring = [knuckles_spring_v0, knuckles_spring_v1, knuckles_spring_v2];
    
    knuckles_spring_twirl_v0 = new animation(sprKnucklesSpringTwirl, [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3], 11);
    knuckles_spring_twirl = [knuckles_spring_twirl_v0];
    
    knuckles_trick_up_v0 = new animation(sprKnucklesTrickUp0, [1, 2, 1], -1);
    knuckles_trick_up_v1 = new animation(sprKnucklesTrickUp1, [4, 4, 8, 8, 8], -1);
    knuckles_trick_up_v2 = new animation(sprKnucklesTrickUp2, [7, 6, 3, 3, 3], 2);
    knuckles_trick_up = [knuckles_trick_up_v0, knuckles_trick_up_v1, knuckles_trick_up_v2];
    
    knuckles_trick_down_v0 = new animation(sprKnucklesTrickDown0, [2, 3, 2, 2], -1);
    knuckles_trick_down_v1 = new animation(sprKnucklesTrickDown1, 2);
    knuckles_trick_down_v2 = new animation(sprKnucklesTrickDown2, [1, 1, 1, 1, 4, 2, 2], -1);
    knuckles_trick_down = [knuckles_trick_down_v0, knuckles_trick_down_v1, knuckles_trick_down_v2];
    
    knuckles_trick_front_v0 = new animation(sprKnucklesTrickFront0, [2, 2, 2, 2, 4], -1);
    knuckles_trick_front_v1 = new animation(sprKnucklesTrickFront1, 2, 3);
    knuckles_trick_front_v2 = new animation(sprKnucklesTrickFront2, 2, -1);
    knuckles_trick_front = [knuckles_trick_front_v0, knuckles_trick_front_v1, knuckles_trick_front_v2];
    
    knuckles_trick_back_v0 = new animation(sprKnucklesTrickBack0, [2, 2, 4], -1);
    knuckles_trick_back_v1 = new animation(sprKnucklesTrickBack1, [2, 2, 3, 3], 2);
    knuckles_trick_back = [knuckles_trick_back_v0, knuckles_trick_back_v1];
    
    knuckles_flight_ride_v0 = new animation(sprKnucklesFlightRide, 5);
    knuckles_flight_ride = [knuckles_flight_ride_v0];
    
    #endregion
    
    #region Amy
    
    amy_idle_v0 = new animation(sprAmyIdle, 7);
    amy_idle = [amy_idle_v0];
    
    amy_idle_alt_v0 = new animation(sprAmyIdleAlt, 6);
    amy_idle_alt = [amy_idle_alt_v0];
    
    amy_teeter_front_v0 = new animation(sprAmyTeeterFront, [5, 4, 3, 20, 6, 8, 6], 3);
    amy_teeter_back_v0 = new animation(sprAmyTeeterBack, [3, 4, 5, 15, 5, 5, 5], 3);
    amy_teeter = [amy_teeter_front_v0, amy_teeter_back_v0];
    
    amy_turn_v0 = new animation(sprAmyTurn, 1, -1);
    amy_turn_brake_v0 = new animation(sprAmyTurnBrake, 2, -1);
    amy_turn = [amy_turn_v0, amy_turn_brake_v0];
    
    amy_run_v0 = new animation(sprAmyRun0, 8);
    amy_run_v1 = new animation(sprAmyRun1, 8);
    amy_run_v2 = new animation(sprAmyRun2, 8);
    amy_run_v3 = new animation(sprAmyRun3, 8);
    amy_run_v4 = new animation(sprAmyRun4, 8);
    amy_run = [amy_run_v0, amy_run_v1, amy_run_v2, amy_run_v3, amy_run_v4];
    
    amy_run_alt_v0 = new animation(sprAmyRunAlt0, 8);
    amy_run_alt_v1 = new animation(sprAmyRunAlt1, 8);
    amy_run_alt_v2 = new animation(sprAmyRunAlt2, 8);
    amy_run_alt_v3 = new animation(sprAmyRunAlt3, 8);
    amy_run_alt = [amy_run_alt_v0, amy_run_alt_v1, amy_run_alt_v2, amy_run_alt_v3];
    
    amy_brake_v0 = new animation(sprAmyBrake, 2, 1);
    amy_brake_fast_v0 = new animation(sprAmyBrakeFast, [1, 1, 3, 3, 3], 2);
    amy_brake = [amy_brake_v0, amy_brake_fast_v0];
    
    amy_push_v0 = new animation(sprAmyPush, [4, 7, 7, 7, 7, 7, 7, 7, 7,], 1);
    amy_push = [amy_push_v0];
    
    amy_look_v0 = new animation(sprAmyLook0, [3, 3, 3, 60, 6, 8, 6], 3);
    amy_look_v1 = new animation(sprAmyLook1, 2, -1);
    amy_look = [amy_look_v0, amy_look_v1];
    
    amy_crouch_v0 = new animation(sprAmyCrouch0, [1, 1, 10, 6, 8, 6, 60, 6, 8, 6], 6);
    amy_crouch_v1 = new animation(sprAmyCrouch1, 1, -1);
    amy_crouch = [amy_crouch_v0, amy_crouch_v1];
    
    amy_roll_v0 = new animation(sprAmyRoll, 2);
    amy_roll = [amy_roll_v0];
    
    amy_spin_dash_v0 = new animation(sprAmySpinDash, 3);
    amy_spin_dash = [amy_spin_dash_v0];
    
    amy_fall_v0 = new animation(sprAmySpring1, 2, -1, [4, 5]);
    amy_fall_v1 = new animation(sprAmySpring2, 2);
    amy_fall = [amy_fall_v0, amy_fall_v1];
    
    amy_jump_v0 = new animation(sprAmyJump0, [3, 2], -1);
    amy_jump_v1 = new animation(sprAmyJump1, 2);
    amy_jump_v2 = new animation(sprAmyJump2, [1, 2, 2, 2, 2], 2);
    amy_jump = [amy_jump_v0, amy_jump_v1, amy_jump_v2];
    
    amy_hurt_v0 = new animation(sprAmyHurt0, [3, 8, 8, 8], -1);
    amy_hurt_v1 = new animation(sprAmyHurt1, 5, -1);
    amy_hurt = [amy_hurt_v0, amy_hurt_v1];
    
    amy_dead_v0 = new animation(sprAmyDead, [6, 12, 2, 3, 3], 3);
    amy_dead = [amy_dead_v0];
    
    amy_spring_v0 = new animation(sprAmySpring0, 3);
    amy_spring_v1 = new animation(sprAmySpring1, [3, 3, 3, 4, 4, 4], -1);
    amy_spring_v2 = new animation(sprAmySpring2, 3, 1);
    amy_spring = [amy_spring_v0, amy_spring_v1, amy_spring_v2];
    
    amy_spring_twirl_v0 = new animation(sprAmySpringTwirl, [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3], 11);
    amy_spring_twirl = [amy_spring_twirl_v0];
    
    amy_trick_up_v0 = new animation(sprAmyTrickUp0, [3, 6], -1);
    amy_trick_up_v1 = new animation(sprAmyTrickUp1, [2, 1, 1, 3, 3, 3], 3);
    amy_trick_up_v2 = new animation(sprAmyTrickUp2, [2, 1, 1, 3, 3, 3], 3);
    amy_trick_up = [amy_trick_up_v0, amy_trick_up_v1, amy_trick_up_v2];
    
    amy_trick_down_v0 = new animation(sprAmyTrickDown0, [2, 2, 4, 2], -1);
    amy_trick_down_v1 = new animation(sprAmyTrickDown1, 2);
    amy_trick_down_v2 = new animation(sprAmyTrickDown2, [2, 2, 2, 2, 3, 3, 3], 4);
    amy_trick_down = [amy_trick_down_v0, amy_trick_down_v1, amy_trick_down_v2];
    
    amy_trick_front_v0 = new animation(sprAmyTrickFront0, [1, 2, 3, 1], -1);
    amy_trick_front_v1 = new animation(sprAmyTrickFront1, 2);
    amy_trick_front = [amy_trick_front_v0, amy_trick_front_v1];
    
    amy_trick_back_v0 = new animation(sprAmyTrickBack0, [1, 2, 2, 3], -1);
    amy_trick_back_v1 = new animation(sprAmyTrickBack1, [2, 2, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3], 14);
    amy_trick_back = [amy_trick_back_v0, amy_trick_back_v1];
    
    amy_flight_ride_v0 = new animation(sprAmyFlightRide, 5);
    amy_flight_ride = [amy_flight_ride_v0];
    
    amy_hammer_attack_v0 = new animation(sprAmyHammerAttack0, [1, 1, 1, 1, 2, 3, 1, 1, 1, 1, 1, 1, 3, 3, 3], -1);
    amy_hammer_attack_v1 = new animation(sprAmyHammerAttack1, [1, 1, 1, 1, 3, 4, 2, 1, 1, 1, 1, 2, 2, 2, 8, 3, 3, 3], -1);
    amy_hammer_attack = [amy_hammer_attack_v0, amy_hammer_attack_v1];
    
    amy_big_hammer_attack_v0 = new animation(sprAmyBigHammerAttack, [2, 2, 2, 2, 3, 3, 3, 6, 3, 2, 2, 2, 2, 2, 2, 4, 2, 2], -1);
    amy_big_hammer_attack = [amy_big_hammer_attack_v0];
    
    amy_air_hammer_attack_v0 = new animation(sprAmyAirHammerAttack, [2, 3, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 3], 14);
    amy_air_hammer_attack = [amy_air_hammer_attack_v0];
    
    amy_hammer_whirl_v0 = new animation(sprAmyHammerWhirl, [3, 4, 3, 2, 2, 2, 2, 2, 2], 3);
    amy_hammer_whirl = [amy_hammer_whirl_v0];
    
    amy_hammer_jump_v0 = new animation(sprAmyHammerJump, [1, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3], 22);
    amy_hammer_jump = [amy_hammer_jump_v0];
    
    amy_heart_v0 = new animation(sprAmyHeart, 3, -1);
    amy_heart = [amy_heart_v0];
    
    amy_leap_v0 = new animation(sprAmyLeap, [1, 1, 2, 2, 2, 2], 3);
    amy_leap = [amy_leap_v0];
    
    amy_head_slide_v0 = new animation(sprAmyHeadSlide0, [2, 6, 6, 2], -1);
    amy_head_slide_v1 = new animation(sprAmyHeadSlide1, 2);
    amy_head_slide_v2 = new animation(sprAmyHeadSlide2, [2, 3, 2, 2, 2], -1);
    amy_head_slide = [amy_head_slide_v0, amy_head_slide_v1, amy_head_slide_v2];
    
    #endregion
    
    #region Cream
    
    cream_idle_v0 = new animation(sprCreamIdle, [5, 5, 7, 10, 3, 3, 3, 7, 5, 5, 7, 10, 3, 3, 3, 7]);
    cream_idle = [cream_idle_v0];
    
    cream_teeter_front_v0 = new animation(sprCreamTeeterFront, 3);
    cream_teeter_back_v0 = new animation(sprCreamTeeterBack, 4);
    cream_teeter = [cream_teeter_front_v0, cream_teeter_back_v0];
    
    cream_turn_v0 = new animation(sprCreamTurn, 1, -1);
    cream_turn_brake_v0 = new animation(sprCreamTurnBrake, 2, -1);
    cream_turn = [cream_turn_v0, cream_turn_brake_v0];
    
    cream_run_v0 = new animation(sprCreamRun0, 8);
    cream_run_v1 = new animation(sprCreamRun1, 8);
    cream_run_v2 = new animation(sprCreamRun2, 8);
    cream_run_v3 = new animation(sprCreamRun3, 8);
    cream_run_v4 = new animation(sprCreamRun4, 8);
    cream_run = [cream_run_v0, cream_run_v1, cream_run_v2, cream_run_v3, cream_run_v4];
    
    cream_brake_v0 = new animation(sprCreamBrake, [2, 4, 4], 1);
    cream_brake_fast_v0 = new animation(sprCreamBrakeFast, 2);
    cream_brake = [cream_brake_v0, cream_brake_fast_v0];
    
    cream_push_v0 = new animation(sprCreamPush, [4, 6, 6, 6, 6, 6, 6, 6, 6], 1);
    cream_push = [cream_push_v0];
    
    cream_look_v0 = new animation(sprCreamLook, [3, 3, 3, 60, 6, 6, 6], 3);
    cream_look_v1 = new animation(sprCreamLook, 2, -1, [3, 2, 1, 0]);
    cream_look = [cream_look_v0, cream_look_v1];
    
    cream_crouch_v0 = new animation(sprCreamCrouch, 1, -1);
    cream_crouch_v1 = new animation(sprCreamCrouch, 1, -1, [1, 0]);
    cream_crouch = [cream_crouch_v0, cream_crouch_v1];
    
    cream_roll_v0 = new animation(sprCreamRoll, 2);
    cream_roll = [cream_roll_v0];
    
    cream_ears_v0 = new animation(sprCreamEars, 2);
    cream_ears = [cream_ears_v0];
    
    cream_spin_dash_v0 = new animation(sprCreamSpinDash, 2);
    cream_spin_dash = [cream_spin_dash_v0];
    
    cream_fall_v0 = new animation(sprCreamSpring1, 2, -1, [4, 5]);
    cream_fall_v1 = new animation(sprCreamSpring2, 2);
    cream_fall = [cream_fall_v0, cream_fall_v1];
    
    cream_jump_v0 = new animation(sprCreamJump0, 3, -1);
    cream_jump_v1 = new animation(sprCreamJump1, 2);
    cream_jump_v2 = new animation(sprCreamJump2, [1, 2, 2, 2], 1);
    cream_jump = [cream_jump_v0, cream_jump_v1, cream_jump_v2];
    
    cream_hurt_v0 = new animation(sprCreamHurt0, [3, 8, 8, 8, 8], -1);
    cream_hurt_v1 = new animation(sprCreamHurt1, 5, -1);
    cream_hurt = [cream_hurt_v0, cream_hurt_v1];
    
    cream_dead_v0 = new animation(sprCreamDead, [6, 12, 2, 3, 3], 3);
    cream_dead = [cream_dead_v0];
    
    cream_spring_v0 = new animation(sprCreamSpring0, 3, 1);
    cream_spring_v1 = new animation(sprCreamSpring1, [2, 3, 3, 4, 4, 4], -1);
    cream_spring_v2 = new animation(sprCreamSpring2, 3);
    cream_spring = [cream_spring_v0, cream_spring_v1, cream_spring_v2];
    
    cream_spring_twirl_v0 = new animation(sprCreamSpringTwirl, [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2, 3, 3, 3], 12);
    cream_spring_twirl = [cream_spring_twirl_v0];
    
    cream_trick_up_v0 = new animation(sprCreamTrickUp0, [1, 4, 4, 4, 2], -1);
    cream_trick_up_v1 = new animation(sprCreamTrickUp1, [2, 2, 2, 3, 3, 3], 3);
    cream_trick_up_v2 = new animation(sprCreamTrickUp2, [2, 2, 2, 2, 2, 3, 3, 3], 5);
    cream_trick_up = [cream_trick_up_v0, cream_trick_up_v1, cream_trick_up_v2];
    
    cream_trick_down_v0 = new animation(sprCreamTrickDown0, [2, 2, 4, 6, 2], -1);
    cream_trick_down_v1 = new animation(sprCreamTrickDown1, [2, 2, 2, 3, 3, 3], 3);
    cream_trick_down = [cream_trick_down_v0, cream_trick_down_v1];
    
    cream_trick_front_v0 = new animation(sprCreamTrickFront0, [2, 2, 4, 1], -1);
    cream_trick_front_v1 = new animation(sprCreamTrickFront1, 2);
    cream_trick_front = [cream_trick_front_v0, cream_trick_front_v1];
    
    cream_trick_back_v0 = new animation(sprCreamTrickBack0, [2, 2, 4, 6, 2], -1);
    cream_trick_back_v1 = new animation(sprCreamTrickBack1, [2, 2, 3, 3, 3], 2);
    cream_trick_back_v2 = new animation(sprCreamTrickBack2, [2, 2, 2, 3, 3, 3], 3);
    cream_trick_back = [cream_trick_back_v0, cream_trick_back_v1, cream_trick_back_v2];
    
    cream_flight_ride_v0 = new animation(sprCreamFlightRide, 5);
    cream_flight_ride = [cream_flight_ride_v0];
    
    cream_flight_v0 = new animation(sprCreamFlight0, [2, 4, 4, 4, 4, 2, 1, 1, 2, 4, 4, 4, 4, 2, 1, 1]);
    cream_flight_v1 = new animation(sprCreamFlight1, 1, -1);
    cream_flight = [cream_flight_v0, cream_flight_v1];
    
    cream_flight_tired_v0 = new animation(sprCreamFlightTired, [6, 4, 6, 6, 6, 6, 6, 6, 6, 6], 2);
    cream_flight_tired = [cream_flight_tired_v0];
    
    cream_flight_cancel_v0 = new animation(sprCreamFlightCancel, [2, 2, 3, 3, 3], 2);
    cream_flight_cancel = [cream_flight_cancel_v0];
    
    #endregion
    
    #endregion
    
    #region Shields
    
    shield_basic_v0 = new animation(sprShieldBasic, 3);
    shield_basic = [shield_basic_v0];
    
    shield_magnetic_v0 = new animation(sprShieldMagnetic, 3);
    shield_magnetic = [shield_magnetic_v0];
    
    shield_aqua_wave_v0 = new animation(sprShieldAquaWave, 12);
    shield_aqua_bound_v0 = new animation(sprShieldAquaShell, 6, -1, [0]);
    shield_aqua_bound_v1 = new animation(sprShieldAquaBound, 0);
    shield_aqua_rebound_v0 = new animation(sprShieldAquaBound, [12, 6], -1, [1, 0]);
    shield_aqua = [shield_aqua_wave_v0, shield_aqua_bound_v0, shield_aqua_bound_v1, shield_aqua_rebound_v0];
    
    shield_flame_v0 = new animation(sprShieldFlame, 2);
    shield_flame_dash_v0 = new animation(sprShieldFlameDash, 2, -1, [0, 1, 2, 3, 2, 4, 0, 1, 2, 3, 2, 4]);
    shield_flame = [shield_flame_v0, shield_flame_dash_v0];
    
    shield_thunder_v0 = new animation(sprShieldThunder, [2, 2, 2, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2, 2, 2], -1, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 0, 1, 2]);
    shield_thunder_v1 = new animation(sprShieldThunder, 4, -1, [11, 10, 9, 8, 7, 6, 5, 4, 3]);
    shield_thunder = [shield_thunder_v0, shield_thunder_v1];
    
    shield_thunder_spark_v0 = new animation(sprShieldThunderSpark, 1);
    shield_thunder_spark = [shield_thunder_spark_v0];
    
    shield_invincibility_v0 = new animation(sprShieldInvincibility, 2);
    shield_invincibility = [shield_invincibility_v0];
    
    shield_invincibility_sparkle_v0 = new animation(sprShieldInvincibilitySparkle, 2, -1);
    shield_invincibility_sparkle = [shield_invincibility_sparkle_v0];
    
    #endregion
    
    #region Effects
    
    brake_dust_v0 = new animation(sprBrakeDust, 2, -1);
    brake_dust = [brake_dust_v0];
    
    spin_dash_dust_v0 = new animation(sprSpinDashDust0, 2);
    spin_dash_dust_v1 = new animation(sprSpinDashDust1, 2);
    spin_dash_dust = [spin_dash_dust_v0, spin_dash_dust_v1];
    
    miasma_v0 = new animation(sprMiasma, 7);
    miasma = [miasma_v0];
    
    speed_break_v0 = new animation(sprSpeedBreak, 2, 0, [0, 1]);
    speed_break_v1 = new animation(sprSpeedBreak, 2, -1);
    speed_break = [speed_break_v0, speed_break_v1];
    
    swap_cooldown_v0 = new animation(sprSwapCooldown0, 3);
    swap_cooldown_v1 = new animation(sprSwapCooldown1, 3);
    swap_cooldown_v2 = new animation(sprSwapCooldown2, 3);
    swap_cooldown_v3 = new animation(sprSwapCooldown3, 3);
    swap_cooldown_v4 = new animation(sprSwapCooldown4, 3);
    swap_cooldown = [swap_cooldown_v0, swap_cooldown_v1, swap_cooldown_v2, swap_cooldown_v3, swap_cooldown_v4];
    
    #endregion
    
    #endregion
    
    #region Interactables
    
    ring_sparkle_v0 = new animation(sprRingSparkle, 4, -1);
    ring_sparkle = [ring_sparkle_v0];
    
    spring_vertical_v0 = new animation(sprSpringVertical, 0);
    spring_vertical_v1 = new animation(sprSpringVertical, [2, 4, 2, 4, 2], -1, [1, 2, 3, 4, 5]);
    spring_vertical = [spring_vertical_v0, spring_vertical_v1];
    
    spring_horizontal_v0 = new animation(sprSpringHorizontal, 0);
    spring_horizontal_v1 = new animation(sprSpringHorizontal, [2, 4, 2, 4, 2], -1, [1, 2, 3, 4, 5]);
    spring_horizontal = [spring_horizontal_v0, spring_horizontal_v1];
    
    spring_diagonal_v0 = new animation(sprSpringDiagonal, 0);
    spring_diagonal_v1 = new animation(sprSpringDiagonal, [2, 4, 2, 4, 2], -1, [1, 2, 3, 4, 5]);
    spring_diagonal = [spring_diagonal_v0, spring_diagonal_v1];
    
    spring_diagonal_alt_v0 = new animation(sprSpringDiagonalAlt, 0);
    spring_diagonal_alt_v1 = new animation(sprSpringDiagonalAlt, [2, 4, 2, 4, 2], -1, [1, 2, 3, 4, 5]);
    spring_diagonal_alt = [spring_diagonal_alt_v0, spring_diagonal_alt_v1];
    
    item_balloon_v0 = new animation(sprItemBalloon, 12);
    item_balloon = [item_balloon_v0];
    
    #endregion
    
    #region Particles
    
    explosion_destroy_v0 = new animation(sprExplosionDestroy, [3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5, 6], -1);
    explosion_destroy = [explosion_destroy_v0];
    
    #endregion
}