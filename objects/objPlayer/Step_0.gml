/// @description Behave
if (ctrlGame.game_paused) exit;

// Boost Mode
player_refresh_boost_mode();

// Input
if (input_enabled and (player_index == 0 or cpu_gamepad_time > 0))
{
    input_axis_x = InputOpposing(INPUT_VERB.LEFT, INPUT_VERB.RIGHT, player_index);
    input_axis_y = InputOpposing(INPUT_VERB.UP, INPUT_VERB.DOWN, player_index);
    
    struct_foreach(input_button, function(_name, _value)
    {
        var verb = _value.verb;
        _value.check = InputCheck(verb, player_index);
        _value.pressed = InputPressed(verb, player_index);
        _value.released = InputReleased(verb, player_index);
    });
    
    if (confusion_time > 0) input_axis_x *= -1;
    if (cpu_gamepad_time > 0) cpu_gamepad_time--;
    if (input_button.select.pressed) player_obtain_item(irandom_range(ITEM.BASIC, ITEM.INVINCIBILITY));
}

// CPU

// State
state(PHASE.STEP);
if (state_changed) state_changed = false;
player_render();

//Swap

// Spin Dash Dust
with (spin_dash_dust)
{
    var action = other.state;
    if (action == player_is_spin_dashing)
    {
        var x_int = other.x div 1;
        var y_int = other.y div 1;
        var sine = dsin(other.gravity_direction);
        var cosine = dcos(other.gravity_direction);
        
        x = x_int + sine * other.y_radius;
        y = y_int + cosine * other.y_radius;
        image_xscale = other.image_xscale;
        image_angle = other.mask_direction;
        anim_core.variant = (floor(other.spin_dash_charge) > 2);
        animation_set(global.anim_spin_dash_dust);
    }
    else if (anim_core.anim != undefined)
    {
        animation_set(undefined);
    }
}

// Shield
with (shield)
{
    var invincible = (other.invincibility_time > 0);
    if (index != SHIELD.NONE or invincible)
    {
        x = other.x div 1;
        y = other.y div 1;
        
        var shield_advance = (index == SHIELD.BASIC or index == SHIELD.MAGNETIC or invincible);
        var flicker_config = db_read(CONFIG_DATABASE, CONFIG_DEFAULT_FLICKER, "flicker");
        if (invincible)
        {
            animation_start("invincibility");
            animation_set(global.anim_shield_invincibility);
            if (anim_core.time mod 8 == 0)
            {
                var x_off = irandom_range(-16, 16);
                var y_off = irandom_range(-16, 16);
                particle_create(x + x_off, y + y_off, global.anim_shield_invincibility_sparkle);
            }
        }
        else
        {
            switch (index)
            {
                case SHIELD.BASIC:
                {
                    animation_start("basic");
                    animation_set(global.anim_shield_basic);
                    break;
                }
                case SHIELD.MAGNETIC:
                {
                    animation_start("magnetic");
                    animation_set(global.anim_shield_magnetic_v0);
                    break;
                }
                case SHIELD.AQUA:
                {
                    animation_start("aqua");
                    if (animation_is_finished())
                    {
                        switch (anim_core.variant)
                        {
                            case 1:
                            {
                                anim_core.variant = 2;
                                break;
                            }
                            case 3:
                            {
                                anim_core.variant = 0;
                                break;
                            }
                        }
                    }
                    
                    animation_set(global.anim_shield_aqua);
                    break;
                }
                case SHIELD.FLAME:
                {
                    animation_start("flame");
                    if (anim_core.variant == 1 and animation_is_finished()) anim_core.variant = 0;
                    animation_set(global.anim_shield_flame);
                    break;
                }
                case SHIELD.THUNDER:
                {
                    animation_start("thunder");
                    if (animation_is_finished()) anim_core.variant = (anim_core.variant == 0 ? 1 : 0);
                    animation_set(global.anim_shield_thunder);
                    break;
                }
            }
        }
        
        // Visible
        if (shield_advance)
        {
            switch (flicker_config)
            {
                case CONFIG_FLICKER.ORIGINAL:
                {
                    visible = anim_core.time mod 4 < 2;
                    break;
                }
                case CONFIG_FLICKER.VIRTUAL_CONSOLE:
                case CONFIG_FLICKER.VIRTUAL_CONSOLE_ADVANCE_3:
                {
                    visible = anim_core.time mod 6 < (flicker_config == CONFIG_FLICKER.VIRTUAL_CONSOLE_ADVANCE_3 ? 4 : 2);
                    break;
                }
            }
        }
        else if (anim_core.name == "aqua" and anim_core.variant == 0)
        {
            visible = anim_core.time mod 4 < 2;
        }
        else if (not visible)
        {
            visible = true;
        }
        
        if (not (anim_core.name == "flame" and anim_core.variant == 1))
        {
            image_xscale = 1;
        }
        
        image_angle = other.gravity_direction;
        image_alpha = (shield_advance and flicker_config == CONFIG_FLICKER.OFF ? 0.6 : 1);
    }
    else if (anim_core.anim != undefined)
    {
        animation_set(undefined);
    }
}

// Miasma
with (miasma)
{
    var debuffed = other.superspeed_time < 0 or other.confusion_time > 0;
    if (debuffed)
    {
        var x_int = other.x div 1;
        var y_int = other.y div 1;
        var sine = dsin(other.gravity_direction);
        var cosine = dcos(other.gravity_direction);
        
        x = x_int - sine * 16;
        y = y_int - cosine * 16;
        image_angle = other.mask_direction;
        animation_set(global.anim_miasma);
    }
    else if (anim_core.anim != undefined)
    {
        animation_set(undefined);
    }
}

// Speed Break
with (speed_break)
{
    if (visible)
    {
        x = other.x div 1;
        y = other.y div 1;
        
        switch (anim_core.variant)
        {
            case 0:
            {
                for (var i = 0; i < SPEED_BREAK_COUNT / 2; i++)
                {
                    if (i & 1)
                    {
                        positions[i][0] += accelerations[i][0];
                        positions[i][1] += accelerations[i][1];
                    }
                    else
                    {
                        positions[i][0] -= accelerations[i][0];
                        positions[i][1] -= accelerations[i][1];
                    }
                    
                    accelerations[i][0] *= 0.78125;
                    accelerations[i][1] *= 0.78125;
                }
                
                if (time++ > 8)
                {
                    var x_scale = other.image_xscale;
                    var rot = other.direction;
                    anim_core.variant = 1;
                    animation_set(global.anim_speed_break);
                    for (var i = 0; i < SPEED_BREAK_COUNT; i++)
                    {
                        var rand_rot = irandom(359);
                        if (x_scale == -1)
                        {
                            rand_rot += 90;
                            x_drag = dcos(rot + 180) * 4;
                            y_drag = -dsin(rot + 180) * 4;
                        }
                        else
                        {
                            x_drag = dcos(rot) * 4;
                            y_drag = -dsin(rot) * 4;
                        }
                        
                        var accel = irandom(4) + 6;
                        accelerations[i][0] = dcos(rand_rot) * accel;
                        accelerations[i][1] = -dsin(rand_rot) * accel;
                    }
                }
                break;
            }
            case 1:
            {
                if (time++ > 24)
                {
                    visible = false;
                    animation_set(undefined);
                }
                
                for (var i = 0; i < SPEED_BREAK_COUNT; i++)
                {
                    positions[i][0] += accelerations[i][0];
                    positions[i][1] += accelerations[i][1];
                    
                    positions[i][0] -= x_drag;
                    positions[i][1] -= y_drag;
                    
                    accelerations[i][0] *= 0.78125;
                    accelerations[i][1] *= 0.78125;
                    
                    x_drag *= 1.00390625;
                    y_drag *= 1.00390625;
                }
                break;
            }
        }
    }
}

// Afterimages
player_enqueue_animation_history();
with (afterimage_trail)
{
    visible = boost_mode;
    if (visible)
    {
        var history = other.anim_history;
        for (var i = 0; i < AFTERIMAGE_COUNT; i++)
        {
            var delay = i * 2 + 2;
            var history_index = modwrap(history.index - delay, 0, ANIMATION_RECORD_COUNT);
            var history_element = history.records[history_index];
            with (afterimages[i])
            {
                x = history_element.x;
                y = history_element.y;
                image_xscale = history_element.image_xscale;
                image_yscale = history_element.image_yscale;
                image_angle = history_element.image_angle;
                animation_set(history_element.anim);
                anim_core.speed = history_element.speed;
            }
        }
    }
}