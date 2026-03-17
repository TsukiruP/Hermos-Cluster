// Constants
#macro CAMERA_ID view_camera[0]
#macro CAMERA_PADDING 64
#macro CAMERA_WIDTH 400
#macro CAMERA_HEIGHT 224

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

// Particles
sprite_particles = {};
with (sprite_particles)
{
	system = part_system_create();
	
	brake_dust = part_type_create();
	part_type_life(brake_dust, 16, 16);
	part_type_sprite(brake_dust, sprBrakeDust, true, true, false);
}

// Start the game!
call_later(1, time_source_units_frames, room_goto_next);