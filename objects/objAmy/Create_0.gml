/// @description Initialize
event_inherited();
character_index = CHARACTER.AMY;
trick_speed = [[0, -6], [0, 1], [6, 0], [-3.5, -2]];

// Hammer trail
hammer_trail =
{
    visible : false,
    gravity_direction : 0,
    anim_name : "",
    anim_variant : 0,
    hearts : array_create_ext(HEART_COUNT, function() { return new attachment(); }),
    time : 0,
    pattern : 0,
    offset_index : 0,
    offsets :
    [
        [
            [10, 0, -27],
            [12, 13, -22],
            [14, 23, -13],
            [16, 26, 0],
            [-1, 0, 0],
            [0, 0, 0],
            [0, 0, 0],
            [0, 0, 0]
        ],
        [
            [10, 7, -27],
            [12, 20, -22],
            [14, 30, -13],
            [16, 33, 0],
            [-1, 0, 0],
            [0, 0, 0],
            [0, 0, 0],
            [0, 0, 0]
        ],
        [
            [0, -10, -26],
            [4, 8, -27],
            [8, 22, -17],
            [12, 28, -1],
            [16, 23, 16],
            [20, 10, 26],
            [-1, 0, 0],
            [0, 0, 0]
        ],
        [
            [2, 0, 4],
            [6, 19, 6],
            [10, 28, 2],
            [14, 19, 4],
            [18, 0, 6],
            [22, -19, 2],
            [26, -28, 4],
            [30, -19, 6]
        ]
    ],
    refresh : function(_pla)
    {
        var i = 0;
        while (hearts[i].visible)
        {
            if (++i >= HEART_COUNT) exit;
        }
        
        if (i < HEART_COUNT)
        {
            var x_int = _pla.x div 1;
            var y_int = _pla.y div 1;
            var sine = dsin(_pla.gravity_direction);
            var cosine = dcos(_pla.gravity_direction);
            
            var x_offset = offsets[pattern][offset_index][1] * _pla.image_xscale;
            var y_offset = offsets[pattern][offset_index][2];
            
            with (hearts[i])
            {
                x = x_int + cosine * x_offset + sine * y_offset;
                y = y_int - sine * x_offset + cosine * y_offset;
                visible = true;
                image_angle = other.gravity_direction;
                animation_set(global.anim_amy_heart);
            }
        }
    }
};

// Trick trail
trick_trail =
{
    visible : false,
    gravity_direction : 0,
    hearts : array_create_ext(HEART_COUNT, function() { return new attachment(); }),
    time : 0,
    active : 0,
    destroy : 0,
    offset : function(_pla, _index)
    {
        with (hearts[_index])
        {
            x = _pla.x;
            y = _pla.y;
            anim_core.force = true;
            animation_set(global.anim_amy_heart);
            
            if (_index == 1) y += 8;
            else if (_index == 3) y -= 8;
            // TODO: This should consider gravity_direction
        }
        
        active |= (1 << _index);
    }
};

// Misc.
hammer_double = false;
head_slide_state = 0;