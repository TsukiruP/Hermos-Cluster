// Constants
#macro CAMERA_ID view_camera[0]
#macro CAMERA_PADDING 64
#macro CAMERA_WIDTH 400
#macro CAMERA_HEIGHT 224

#macro SUBPIXEL 0.00390625

enum INPUT
{
	UP, DOWN, LEFT, RIGHT, ACTION
}

enum PHASE
{
	ENTER, STEP, EXIT
}

// Misc.
show_debug_overlay(true);
surface_depth_disable(true);
gc_target_frame_time(-100);
randomize();

// Audio
audio_channel_num(12);
volume_sound = 1;
volume_music = 1;

// Player values
score = 0;
lives = 3;
rings = 0;
rings_for_life = 99;

// Fonts
font_hud = font_add_sprite(sprFontHUD, ord("0"), false, 1);
font_lives = font_add_sprite(sprFontLives, ord("0"), false, 0);

// Particles
sprite_particles = {};
with (sprite_particles)
{
	system = part_system_create();
	
	brake_dust = part_type_create();
	part_type_life(brake_dust, 16, 16);
	part_type_sprite(brake_dust, sprBrakeDust, true, true, false);
	
	ring_sparkle = part_type_create();
	part_type_life(ring_sparkle, 24, 24);
	part_type_sprite(ring_sparkle, sprRingSparkle, true, true, false);
}

// Start the game!
call_later(1, time_source_units_frames, room_goto_next);