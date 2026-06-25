/// @description Initialize
image_speed = 0;
reaction = function (ind)
{
	if (median(xprevious, ind.x, x) == ind.x and player_boxcast(ind, y_radius))
	{
		collision_path = sign(ind.image_xscale) == sign(x - xprevious);
		hard_colliders[1] = ctrlZone.tilemaps[collision_path + 1];
	}
};