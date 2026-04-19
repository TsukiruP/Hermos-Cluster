/// @description Initialize
event_inherited();
character_index = CHARACTER.MILES;
tails = new attachment();

// Flight
flight_time = 0;
flight_reset_time = 0;
flight_carry_time = 0;
flight_carry = false;
flight_hammer = false;
flight_base_force = 0.03125;
flight_ascent_force = 0.09375;
flight_buddy = noone;
flight_soundid = noone;

// Misc.
trick_speed =
[
    [0, -6],
    [0, 0.5],
    [4, -2.5],
    [-3.5, -3]
];