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
/// @returns {Bool}
player_boxcast = function(_ind, _ylen)
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
    
    return collision_rectangle(left, top, right, bottom, _ind, true, false) != noone;
};

/// @description Checks if the given collider's mask intersects the 'arms' of the player's virtual mask.
/// @param {Asset.GMObject|Id.Instance|Id.TileMapElement|Array} ind Object, instance, or tilemap to check, or an array containing any of these.
/// @param {Real} [xrad] Distance to extend the player's mask horizontally both ways (optional, default is the player's wall radius).
/// @returns {Bool}
player_linecast = function(_ind, _xrad = x_wall_radius)
{
    var x_int = x div 1;
    var y_int = y div 1;
    var sine = dsin(mask_direction);
    var cosine = dcos(mask_direction);
    
    var x1 = x_int - cosine * _xrad;
    var y1 = y_int + sine * _xrad;
    var x2 = x_int + cosine * _xrad;
    var y2 = y_int - sine * _xrad;
    
    return collision_line(x1, y1, x2, y2, _ind, true, false) != noone;
};

/// @description Checks if the given collider's mask intersects a line from the player.
/// @param {Asset.GMObject|Id.Instance|Id.TileMapElement|Array} ind Object, instance, or tilemap to check, or an array containing any of these.
/// @param {Real} xoff Distance to offset the line horizontally.
/// @param {Real} ylen Distance to extend the line vertically.
/// @returns {Bool}
player_raycast = function(_ind, _xoff, _ylen)
{
    var x_int = x div 1;
    var y_int = y div 1;
    var sine = dsin(mask_direction);
    var cosine = dcos(mask_direction);
    
    var x1 = x_int + cosine * _xoff;
    var y1 = y_int - sine * _xoff;
    var x2 = x_int + cosine * _xoff + sine * _ylen;
    var y2 = y_int - sine * _xoff + cosine * _ylen;
    
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

/// @description Calculates the surface normal of the tiles found within the 16x16 area relative to the given point.
/// @param {Real} x x-coordinate of the point.
/// @param {Real} y y-coordinate of the point.
/// @returns {Real}
player_calc_tile_normal = function(_x, _y)
{
    var sine = dsin(mask_direction);
    var cosine = dcos(mask_direction);
    
    // Set up angle sensors, one at each end of a tile
    if (sine == 0)
    {
        var sensor_y = array_create(2, _y);
        var sensor_x = array_create(2, _x - _x mod 16);
        sensor_x[mask_direction == 0] += 15;
    }
    else
    {
        var sensor_x = array_create(2, _x);
        var sensor_y = array_create(2, _y - _y mod 16);
        sensor_y[mask_direction == 270] += 15;
    }
    
    // Extend / regress angle sensors
    for (var n = 0; n < 2; n++)
    {
        repeat (16)
        {
            if (collision_point(sensor_x[n], sensor_y[n], tilemaps, true, false) == noone)
            {
                sensor_x[n] += sine;
                sensor_y[n] += cosine;
            }
            else if (collision_point(sensor_x[n] - sine, sensor_y[n] - cosine, tilemaps, true, false) != noone)
            {
                sensor_x[n] -= sine;
                sensor_y[n] -= cosine;
            }
            else
            {
                break;
            }
        }
    }
    
    return round(point_direction(sensor_x[0], sensor_y[0], sensor_x[1], sensor_y[1]));
};