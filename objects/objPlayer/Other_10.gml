/// @description Movement
/// @description Updates the player's position on the ground and checks for collisions.
player_move_on_ground = function()
{
    
    // Ride moving platforms
    with (ground_id)
    {
        var dx = x - xprevious;
        var dy = y - yprevious;
        if (dx != 0) other.x += dx;
        if (dy != 0) other.y += dy;
    }
    
    wall_sign = 0;
    
    // Calculate movement steps
    var total_steps = 1 + abs(x_speed) div 15;
    var step = x_speed / total_steps;
    
    var floor_reach = y_radius + min(2 + abs(x_speed) div 1, y_snap_distance);
    
    repeat (total_steps)
    {
        // Move by a single step
        x += dcos(direction) * step;
        y -= dsin(direction) * step;
        
        // Die if out of bounds
        if (not player_keep_in_bounds()) player_damage(id);
        
        // Detect colliders
        player_get_collisions();
        
        // Detect walls
        var ind = player_linecast(tilemaps, true);
        if (ind != noone)
        {
            wall_sign = player_escape_wall(ind);
            if (sign(x_speed) == wall_sign) x_speed = 0;
        }
        
        // Detect floor
        if (instance_exists(ground_id))
        {
            on_ground = true;
            direction = gravity_direction;
            local_direction = 0;
            mask_direction = gravity_direction;
            mask_sin = dsin(mask_direction);
            mask_cos = dcos(mask_direction);
        }
        else if (player_boxcast(tilemaps, floor_reach))
        {
            player_ground(true);
            player_rotate_mask();
        }
        else
        {
            on_ground = false;
        }
        
        // Abort if stopped or airborne
        if (x_speed == 0 or not on_ground) break;
    }
}

/// @description Updates the player's position in the air and checks for collisions.
player_move_in_air = function()
{
    wall_sign = 0;
    
    // Calculate movement steps
    var total_steps = 1 + abs(x_speed) div 15 + abs(y_speed) div 15;
    var x_step = x_speed / total_steps;
    var y_step = y_speed / total_steps;
    
    repeat (total_steps)
    {
        x += mask_cos * x_step + mask_sin * y_step;
        y += -mask_sin * x_step + mask_cos * y_step;
        
        // Die if out of bounds
        if (not player_keep_in_bounds()) player_damage(id);
        
        // Detect colliders
        player_get_collisions();
        
        // Detect walls
        var ind = player_linecast(tilemaps, true);
        if (ind != noone)
        {
            wall_sign = player_escape_wall(ind);
            if (sign(x_speed) == wall_sign)
            {
                x_speed = 0;
                x_step = 0;
            }
        }
        
        // Detect floors / ceilings
        if (y_speed >= 0)
        {
            if (instance_exists(ground_id))
            {
                landed = true;
                on_ground = true;
                direction = gravity_direction;
                local_direction = 0;
                mask_direction = gravity_direction;
            }
            else if (player_boxcast(tilemaps, y_radius))
            {
                landed = true;
                player_ground(true);
                player_rotate_mask();
            }
        }
        else if (player_boxcast(tilemaps, -y_radius))
        {
            // Flip mask
            mask_direction = (mask_direction + 180) mod 360;
            mask_sin *= -1;
            mask_cos *= -1;
            
            // Land on the ceiling
            landed = true;
            player_ground(true);
            
            // Abort if rising slowly or the ceiling is too shallow
            if (y_speed > -4 or (local_direction >= 135 and local_direction <= 225))
            {
                // Slide against it
                var sine = dsin(local_direction);
                var cosine = dcos(local_direction);
                
                x_step = cosine * x_speed - sine * y_speed;
                x_speed = cosine * x_step;
                y_speed = -sine * x_step;
                
                // Revert mask rotation and abort
                landed = false;
                mask_direction = gravity_direction;
                mask_sin *= -1;
                mask_cos *= -1;
                break;
            }
        }
        
        // Land
        if (landed)
        {
            // Set new horizontal speed
            if (not instance_exists(ground_id) and local_direction >= 23 and local_direction <= 337 and abs(x_speed) <= abs(y_speed))
            {
                x_speed = local_direction < 180 ? -y_speed : y_speed;
                if (mask_direction == gravity_direction) x_speed *= 0.5;
            }
            
            // Stop falling, and abort
            y_speed = 0;
            landed = false;
            on_ground = true;
            aerial_flags = 0;
            player_refresh_air_skills();
            break;
        }
    }
}
