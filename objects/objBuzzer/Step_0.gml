/// @description Behave

// Wait
if (turn_time > 0)
{
	if (--turn_time == 15)
	{
		image_xscale *= -1;
		can_shoot = true;
	}
	else if (turn_time == 0)
	{
		hspeed = image_xscale;
	}
	exit;
}

// Shoot
if (shoot_time > 0)
{
	if (--shoot_time == 20)
	{
		instance_create_layer(x - 12 * image_xscale, y + 24, layer, objProjectile,
		{
			image_speed, image_xscale,
			sprite_index: sprBuzzerProjectile,
			hspeed: 1.5 * image_xscale,
			vspeed: 1.5
		});
	}
	else if (shoot_time == 0)
	{
		sprite_index = sprBuzzer;
		hspeed = image_xscale;
	}
	exit;
}

// Patrol
if (abs(x - xstart) >= 128)
{
	hspeed = 0;
	turn_time = 30;
}
else if (can_shoot)
{
	// Aim
	var player = instance_nearest(x, y, objPlayer);
	if (player != noone and player.y > y)
	{
		var dist = x - player.x;
		if (abs(dist) >= 40 and abs(dist) <= 48 and sign(dist) != image_xscale)
		{
			hspeed = 0;
			shoot_time = 50;
			can_shoot = false;
			sprite_index = sprBuzzerShoot;
		}
	}
}