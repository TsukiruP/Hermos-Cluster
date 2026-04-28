/// @description Initialize
image_speed = 0;
player_index = -1;
character_index = CHARACTER.NONE;

// State machine
state = player_is_ready;
state_previous = state;
state_changed = false;

cliff_sign = 0;

spin_dash_charge = 0;
spin_dash_dust = new attachment();

aerial_flags = 0;

jump_cap = true;
jump_alternate = 0;

trick_index = TRICK.FRONT;
trick_speed = [[0, 0], [0, 0], [0, 0], [0, 0]];

flight_ride = noone;
glide_ride = noone;

// Timers
control_lock_time = 0;
swap_time = 0;
state_time = 0;

recovery_time = 0;
invincibility_time = 0;
superspeed_time = 0;
confusion_time = 0;

cpu_state_time = 0;
cpu_respawn_time = CPU_RESPAWN_DURATION;
cpu_gamepad_time = 0;

// Movement and collision
x_speed = 0;
y_speed = 0;

x_radius = 8;
x_wall_radius = 10;

y_radius = 15;
y_snap_distance = 14;

hitboxes[0] = new hitbox(c_maroon);
hitboxes[1] = new hitbox(c_green);

landed = false;
on_ground = true;
ground_id = noone;

direction = 0;
gravity_direction = 0;
local_direction = 0;
mask_direction = 0;

collision_layer = 0;

tilemaps = variable_clone(ctrlStage.tilemaps, 0);
tilemap_count = array_length(tilemaps);

// Validate semisolid tilemap
if (tilemap_count & 1 == 0)
{
    semisolid_tilemap = array_last(tilemaps);
    tilemap_count--;
}
else
{
	semisolid_tilemap = -1;
}

// Delist the "TilesLayer1" layer tilemap
if (tilemap_count == 3)
{
    array_delete(tilemaps, 2, 1);
    tilemap_count--;
}

// Boost Mode
boost_mode = false;
boost_index = 0;
boost_speed = 0;
boost_thresholds = [8.0, 7.96875, 6.5625, 5.625, 4.21875];

// Input
input_enabled = false;
input_axis_x = 0;
input_axis_y = 0;

/// @description Creates a new button.
/// @param {Enum.INPUT_VERB} verb Verb to check.
button = function(_verb) constructor
{
    verb = _verb;
    check = false;
    pressed = false;
    released = false;
};

input_button =
{
    jump : new button(INPUT_VERB.JUMP),
    aux : new button(INPUT_VERB.AUX),
    swap : new button(INPUT_VERB.SWAP),
    extra : new button(INPUT_VERB.EXTRA),
    tag : new button(INPUT_VERB.TAG),
    alt : new button(INPUT_VERB.ALT),
    start : new button(INPUT_VERB.START),
    select : new button(INPUT_VERB.SELECT)
};

// CPU
cpu_state = CPU_STATE.FOLLOW;
cpu_axis_x = array_create(CPU_RECORD_COUNT);
cpu_axis_y = array_create(CPU_RECORD_COUNT);
cpu_input_jump = array_create(CPU_RECORD_COUNT);
cpu_input_jump_pressed = array_create(CPU_RECORD_COUNT);

// Animation core
anim_core = new animation_core();

// Status
shield = new attachment();
miasma = new attachment();

// Speed Break
speed_break =
{
    x : 0,
    y : 0,
    visible : false,
    sprite_index : -1,
    image_index : 0,
    image_angle : 0,
    anim_core : new animation_core(),
    time : 0,
    positions : array_create_ext(SPEED_BREAK_COUNT, function() { return array_create(2); }),
    accelerations : array_create_ext(SPEED_BREAK_COUNT, function() { return array_create(2); }),
    x_drag : 128,
    y_drag : 0,
};

// Animation history
/// @description Creates a new animation record.
animation_record = function() constructor
{
    x = 0;
    y = 0;
    image_xscale = 1;
    image_yscale = 1;
    image_angle = 0;
    anim = undefined;
    speed = 1;
};

anim_history =
{
    index : 0,
    records : array_create_ext(ANIMATION_RECORD_COUNT, function() { return new animation_record(); })
};

// Afterimage
/// @description Creates a new afterimage.
afterimage = function() constructor
{
    sprite_index = -1;
    image_index = 0;
    image_xscale = 1;
    image_yscale = 1;
    image_angle = 0;
    image_blend = c_white;
    image_alpha = 1;
    anim_core = new animation_core();
    time = 0;
};

afterimage_trail =
{
    visible : false,
    afterimages : array_create_ext(AFTERIMAGE_COUNT, function() { return new afterimage(); })
};

// Methods
var n = 0;
repeat (16) event_user(n++);

// Misc.
player_refresh_physics();
player_refresh_status();
