/// @description Initialize
if (force > 10) sprite_index = sprSpringRed;
image_speed = 0;
image_index = 1;

reaction = function (ind)
{
	// Get orientation relative to mask direction
	var rotation_offset = angle_wrap(ind.image_angle - mask_direction);
	var react = false;
	
	// React if touching the correct side
	if (player_linecast(ind))
	{
		if ((rotation_offset == 90 and x_speed > 0) or (rotation_offset == 270 and x_speed < 0))
		{
			react = true;
		}
	}
	else if (player_boxcast(ind, y_radius))
	{
		if (rotation_offset == 0 and y_speed >= 0)
		{
			react = true;
		}
	}
	else if (rotation_offset == 180 and y_speed < 0 and player_boxcast(ind, -y_radius))
	{
		react = true;
	}
	
	if (not react) exit;
	
	// Calculate movement vectors
	var x_spring_speed = -dsin(rotation_offset) * ind.force;
	var y_spring_speed = -dcos(rotation_offset) * ind.force;
	
	// Bounce
	if (x_spring_speed != 0)
	{
		x_speed = x_spring_speed;
		image_xscale = sign(x_speed);
		control_lock_time = 16;
	}
	else
	{
		if (y_spring_speed < 0)
		{
			player_perform(player_is_falling);
			player_animate("rise");
			rolling = false;
		}
		y_speed = y_spring_speed;
	}
	
	// Animate spring
	ind.image_index = 0;
	ind.alarm[0] = 1;
	
	audio_play_sfx(sfxSpring);
};