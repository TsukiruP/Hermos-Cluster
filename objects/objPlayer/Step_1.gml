/// @description Count
if (control_lock_time > 0 and on_ground)
{
	--control_lock_time;
}

if (recovery_time > 0 and --recovery_time mod 4 == 0)
{
	image_alpha ^= 1;
}