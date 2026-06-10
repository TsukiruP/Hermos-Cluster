/// @description Initialize
image_speed = 0;
reaction = function (ind)
{
	// Get crushed
	/*if (collision_point(x, y, ind, false, false) != noone)
	{
		return player_perform(player_is_dead);
	}*/
	
	// Knock down monitor / Rebound
	if (y_speed < 0)
	{
		if (player_boxcast(ind, -y_radius)) then with (ind)
		{
			tilemap = ctrlZone.tilemaps[0];
			vspeed = -2;
			gravity = 0.21875;
			alarm[0] = 1;
		}
	}
	else if (rolling and player_intersect(ind, x_wall_radius))
	{
		if (not on_ground) y_speed *= -1;
		audio_play_sfx(sfxDestroy);
		
		with (ind)
		{
			particle_spawn("explosion", x, y);
			instance_create_layer(x, y, layer, objMonitorBroken, { image_speed: 0 });
			instance_create_layer(x, y - 5, layer, objMonitorIcon,
			{
				image_speed: 0,
				image_index: icon,
				vspeed: -3,
				gravity: 0.09375,
				alarm: 32, // Defaults to Alarm 0 (using [] in struct entries is not permitted)
				owner: other.id
			});
			instance_destroy();
		}
	}
};