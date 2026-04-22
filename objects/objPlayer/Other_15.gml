/// @description Misc.
/// @description Increases the player's score count by the given amount.
/// @param {Real} num Amount of points to give.
player_gain_score = function(_num)
{
    var previous_count = global.score_count div 50000;
    global.score_count = min(global.score_count + _num, SCORE_CAP);
    
    // Gain lives
    var count = global.score_count div 50000;
    if (count != previous_count) player_gain_lives(count - previous_count);
};

/// @description Increases the player's ring count by the given amount.
/// @param {Real} num Amount of rings to give.
player_gain_rings = function(_num)
{
    global.ring_count = min(global.ring_count + _num, RING_CAP);
    
    // Gain lives
    if (global.ring_count > global.ring_life_threshold)
    {
        var change = global.ring_count div 100;
        player_gain_lives(change - global.ring_life_threshold div 100);
        global.ring_life_threshold = change * 100 + RING_LIFE_BASE_THRESHOLD;
    }
};

/// @description Spawns up to 32 dropped rings in circles of 16 at the player's position, and resets their ring count.
player_drop_rings = function()
{
    var spd = 3;
    var dir = 101.25;
    
    for (var n = min(global.ring_count, 32); n > 0; --n)
    {
        with (instance_create_layer(x, y, ctrlStage.stage_depth, objRing))
        {
            gravity_direction = other.gravity_direction;
            image_angle = gravity_direction;
            
            lost = true;
            x_speed = lengthdir_x(spd, dir);
            y_speed = lengthdir_y(spd, dir);
            
            if (n & 1 != 0)
            {
                x_speed *= -1;
                dir += 22.5;
            }
        }
        
        if (n == 16)
        {
            spd = 2;
            dir = 101.25;
        }
    }
    
    global.ring_count = 0;
    audio_play_sfx(sfxDropRings);
};

/// @description Increases the player's life count by the given amount.
/// @param {Real} num Amount of lives to give.
player_gain_lives = function(_num)
{
    if (LIVES_ENABLED)
    {
        global.life_count = min(global.life_count + _num, LIVES_CAP);
        audio_play_life();
    }
};

/// @description Gives the player the given item.
/// @param {Enum.ITEM} item Item to obtain.
player_obtain_item = function(_item)
{
    switch (_item)
    {
        case ITEM.LIFE:
        {
            player_gain_lives(1);
            break;
        }
        case ITEM.RING_BONUS:
        {
            player_gain_rings(5);
            break;
        }
        case ITEM.SUPER_RING_BONUS:
        {
            player_gain_rings(10);
            break;
        }
        case ITEM.RANDOM_RING_BONUS:
        {
            player_gain_rings(choose(1, 5, 10, 20, 30, 40));
            break;
        }
        case ITEM.BASIC:
        {
            shield.index = SHIELD.BASIC;
            audio_play_sfx(sfxItemBasic);
            break;
        }
        case ITEM.MAGNETIC:
        {
            shield.index = SHIELD.MAGNETIC;
            audio_play_sfx(sfxItemBasic);
            break;
        }
        case ITEM.AQUA:
        {
            shield.index = SHIELD.AQUA;
            audio_play_sfx(sfxItemAqua);
            break;
        }
        case ITEM.FLAME:
        {
            shield.index = SHIELD.FLAME;
            audio_play_sfx(sfxItemFlame);
            break;
        }
        case ITEM.THUNDER:
        {
            shield.index = SHIELD.THUNDER;
            audio_play_sfx(sfxItemThunder);
            break;
        }
        case ITEM.INVINCIBILITY:
        {
            invincibility_time = INVINCIBILITY_DURATION;
            if (superspeed_time < 0)
            {
                superspeed_time = 0;
                player_refresh_physics();
            }
            if (confusion_time > 0) confusion_time = 0;
            audio_play_jingle(bgmInvincibility);
            break;
        }
        case ITEM.SPEED_UP:
        {
            superspeed_time = SPEED_UP_DURATION;
            player_refresh_physics();
            audio_play_jingle(bgmSpeedUp);
            break;
        }
        case ITEM.SLOW_DOWN:
        {
            if (invincibility_time == 0)
            {
                superspeed_time = -DEBUFF_DURAION;
                player_refresh_physics();
                audio_stop_sound(bgmSpeedUp);
                audio_play_sfx(sfxItemDebuff);
            }
            break;
        }
        case ITEM.CONFUSION:
        {
            if (invincibility_time == 0)
            {
                confusion_time = DEBUFF_DURAION;
                audio_play_sfx(sfxItemDebuff);
            }
            break;
        }
        case ITEM.EGGMAN:
        {
            player_damage(noone);
            break;
        }
    }
    
    with (objHUD)
    {
        if (item_feed_config)
        {
            array_push(item_feed, new item_popup(_item));
            item_feed_time = item_feed_duration;
        }
    }
};

/// @description Creates a Speed Break effect.
player_speed_break = function()
{
    with (speed_break)
    {
        var x_scale = other.image_xscale;
        var rot = other.direction;
        visible = true;
        time = 0;
        animation_set(global.anim_speed_break);
        for (var i = 0; i < SPEED_BREAK_COUNT; i++)
        {
            var old_rot, accel;
            positions[i][1] = irandom(4) + 16;
            if (x_scale == -1)
            {
                old_rot = rot + 270;
                positions[i][0] = dcos(rot + 180) * positions[i][1];
                positions[i][1] = -dsin(rot + 180) * positions[i][1];
            }
            else
            {
                old_rot = rot + 90;
                positions[i][0] = dcos(rot) * positions[i][1];
                positions[i][1] = -dsin(rot) * positions[i][1];
            }
            
            accel = irandom(4) + 2;
            accelerations[i][0] = dcos(old_rot) * accel;
            accelerations[i][1] = -dsin(old_rot) * accel;
        }
    }
};

/// @description Draws player effects behind the character sprite.
player_draw_before = function() {};

/// @description Draws player effects in front of the character sprite.
player_draw_after = function() {};