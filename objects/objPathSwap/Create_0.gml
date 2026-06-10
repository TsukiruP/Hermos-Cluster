/// @description Initialize
image_speed = 0;
reaction = function (ind)
{
	if (collision_point(x div 1, y div 1, ind, false, false) != noone)
	{
		collision_path = sign(ind.image_xscale) == sign(x - xprevious);
		hard_colliders[1] = ctrlZone.tilemaps[collision_path + 1];
	}
};