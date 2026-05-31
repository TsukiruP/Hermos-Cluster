/// @description Collision
/// @description Checks if the given collider's mask intersects the player's virtual mask.
/// @param {Asset.GMObject|Id.Instance|Id.TileMapElement|Array} ind Object, instance, or tilemap to check, or an array containing any of these.
/// @param {Real} [xrad] Distance to extend the player's mask horizontally both ways (optional, default is the player's x-radius).
/// @param {Real} [yrad] Distance to extend the player's mask vertically both ways (optional, default is the player's y-radius).
/// @returns {Bool}
player_intersect = function(_ind, _xrad = x_radius, _yrad = y_radius)
{
    var x_int = x div 1;
    var y_int = y div 1;
    
    return mask_direction mod 180 == 0 ?
        collision_rectangle(x_int - _xrad, y_int - _yrad, x_int + _xrad + SUBPIXEL, y_int + _yrad + SUBPIXEL, _ind, true, false) != noone :
        collision_rectangle(x_int - _yrad, y_int - _xrad, x_int + _yrad + SUBPIXEL, y_int + _xrad + SUBPIXEL, _ind, true, false) != noone;
};

/// @description Checks if the given collider's mask intersects a vertical portion of the player's virtual mask.
/// @param {Asset.GMObject|Id.Instance|Id.TileMapElement|Array} ind Object, instance, or tilemap to check, or an array containing any of these.
/// @param {Real} ylen Distance to extend the player's mask vertically.
/// @param {Bool} [get_id] Whether to return the id of the collider found (optional, default is false).
/// @returns {Bool|Id.Instance|Id.TileMapElement}
player_boxcast = function(_ind, _ylen, _get_id)
{
    var x_int = x div 1;
    var y_int = y div 1;
    var sine = dsin(mask_direction);
    var cosine = dcos(mask_direction);
    
    var x1 = x_int - cosine * x_radius;
    var y1 = y_int + sine * x_radius;
    var x2 = x_int + cosine * x_radius + sine * _ylen;
    var y2 = y_int - sine * x_radius + cosine * _ylen;
    
    // Extend right/bottom sides slightly for tilemaps
    var left = min(x1, x2);
    var top = min(y1, y2);
    var right = max(x1, x2) + SUBPIXEL;
    var bottom = max(y1, y2) + SUBPIXEL;
    
    var ind = collision_rectangle(left, top, right, bottom, _ind, true, false);
	return _get_id ? ind : ind != noone;
};

/// @description Checks if the given collider's mask intersects the 'arms' of the player's virtual mask.
/// @param {Asset.GMObject|Id.Instance|Id.TileMapElement|Array} ind Object, instance, or tilemap to check, or an array containing any of these.
/// @param {Bool} [get_id] Whether to return the id of the collider found (optional, default is false).
/// @returns {Bool|Id.Instance|Id.TileMapElement}
player_linecast = function(_ind, _get_id = false)
{
    var x_int = x div 1;
    var y_int = y div 1;

    var ind = (mask_direction mod 180 == 0 ?
        collision_line(x_int - x_wall_radius, y_int, x_int + x_wall_radius, y_int, _ind, true, false) :
        collision_line(x_int, y_int - x_wall_radius, x_int, y_int + x_wall_radius, _ind, true, false));

    return _get_id ? ind : ind != noone;
};

/// @description Checks if the given collider's mask intersects a line from the player.
/// @param {Asset.GMObject|Id.Instance|Id.TileMapElement|Array} ind Object, instance, or tilemap to check, or an array containing any of these.
/// @param {Real} xoff Distance to offset the line horizontally.
/// @param {Real} ylen Distance to extend the line vertically.
/// @returns {Bool}
player_raycast = function(_ind, _xoff, _ylen)
{
    var sine = dsin(mask_direction);
    var cosine = dcos(mask_direction);
    
    var x1 = x div 1 + cosine * _xoff;
    var y1 = y div 1 - sine * _xoff;
    var x2 = x1 + sine * _ylen;
    var y2 = y1 + cosine * _ylen;
    
    return collision_line(x1, y1, x2, y2, _ind, true, false) != noone;
};

/// @description Refreshes the player's local tilemaps, and executes the reaction of interactables.
player_get_collisions = function()
{
    // Reset solid
    ground_id = noone;
    
    // Reset tilemaps
    array_resize(tilemaps, tilemap_count);
    
    // Calculate the area of the upper half of the player's virtual mask
    var x_int = x div 1;
    var y_int = y div 1;
    var sine = dsin(mask_direction);
    var cosine = dcos(mask_direction);
    
    var x1 = x_int - cosine * x_wall_radius - sine * y_radius;
    var y1 = y_int + sine * x_wall_radius - cosine * y_radius;
    var x2 = x_int + cosine * x_wall_radius;
    var y2 = y_int - sine * x_wall_radius;
    
    // Register semisolid tilemap
    if (semisolid_tilemap != -1)
    {
        var left = min(x1, x2);
        var top = min(y1, y2);
        var right = max(x1, x2) + SUBPIXEL;
        var bottom = max(y1, y2) + SUBPIXEL;

        if (collision_rectangle(left, top, right, bottom, semisolid_tilemap, true, false) == noone) array_push(tilemaps, semisolid_tilemap);
    }
    
    // Execute reactions
    with (objInteractable) reaction(other);
};

/// @description Calculates the angle of the terrain found within a 16x16 area at the given point relative to the player's mask direction.
/// @param {Real} x x-coordinate of the point.
/// @param {Real} y y-coordinate of the point.
/// @returns {Real}
player_calculate_angle = function(_x, _y)
{
    var sine = dsin(mask_direction);
    var cosine = dcos(mask_direction);
    var ind = tilemaps;

    // Set up angle sensors, one at each end of a tile
    if (sine == 0)
    {
        var oy = array_create(2, _y);
        var ox = array_create(2, _x - _x mod 16);
        var right_sensor = mask_direction == 0; // 'Right' is absolute, not relative
        ox[right_sensor] += 15;
    }
    else
    {
        var ox = array_create(2, _x);
        var oy = array_create(2, _y - _y mod 16);
        var bottom_sensor = mask_direction == 270;
        oy[bottom_sensor] += 15;
    }

    // Extend / regress angle sensors
    for (var n = 0; n < 2; ++n)
    {
        repeat (16)
        {
            if (collision_point(ox[n], oy[n], ind, true, false) == noone)
            {
                ox[n] += sine;
                oy[n] += cosine;
            }
            else if (collision_point(ox[n] - sine, oy[n] - cosine, ind, true, false) != noone)
            {
                ox[n] -= sine;
                oy[n] -= cosine;
            }
            else break;
        }
    }

    return round(point_direction(ox[0], oy[0], ox[1], oy[1]));
};
