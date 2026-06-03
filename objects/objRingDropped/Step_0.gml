/// @description Move / Animate
if (not instance_in_view(, CAMERA_PADDING * 0.5))
{
	instance_destroy();
	exit;
}

var sine = dsin(gravity_direction);
var cosine = dcos(gravity_direction);

// Resolve movement and collision on separate axes
var dx = cosine * x_speed;
var dy = -sine * x_speed;
x += dx;
y += dy;

var ind = instance_place(x, y, tilemaps);
if (ind != noone and not place_meeting(xprevious, yprevious, ind))
{
	while (place_meeting(x, y, ind))
	{
		x -= sign(dx);
		y -= sign(dy);
	}
	x_speed *= -0.25;
}

dx = sine * y_speed;
dy = cosine * y_speed;
x += dx;
y += dy;

ind = instance_place(x, y, tilemaps);
if (ind != noone and not place_meeting(xprevious, yprevious, ind))
{
	while (place_meeting(x, y, ind))
	{
		x -= sign(dx);
		y -= sign(dy);
	}
	y_speed *= -0.75;
}

// Apply gravity
y_speed += 0.09375;

image_speed -= 0.002;
if (alarm[0] < 64) visible ^= 1;