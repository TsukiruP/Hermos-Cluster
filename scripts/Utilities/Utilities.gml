/// @description Checks if the given instance is visible within the game view.
/// @param {Asset.GMObject|Id.Instance} [ind] Object or instance to check (optional, default is the calling instance).
/// @param {Real} [padding] Distance to extend the size of the view when checking (optional, default is the CAMERA_PADDING macro).
/// @returns {Bool}
function instance_in_view(_ind = id, _padding = CAMERA_PADDING)
{
	var left = camera_get_view_x(CAMERA_ID);
	var top = camera_get_view_y(CAMERA_ID);
	var right = left + CAMERA_WIDTH;
	var bottom = top + CAMERA_HEIGHT;
	
	with (_ind) return point_in_rectangle(x, y, left - _padding, top - _padding, right + _padding, bottom + _padding);
}

/// @description Creates the given sprite particle a given number of times at the given position.
/// @param {String} name Name of the particle.
/// @param {Real} x x-coordinate of the particle.
/// @param {Real} y y-coordinate of the particle.
/// @param {Real} [num] Number of particles to create (optional, default is 1).
function particle_spawn(name, ox, oy, num = 1)
{
	with (global.sprite_particles)
	{
		part_particles_create(system, ox, oy, self[$ name], num);
	}
}