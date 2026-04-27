/// @description Unmute
var playback_id = ds_map_find_value(async_load, "sound_id");
var playback_stopped = ds_map_find_value(async_load, "was_stopped");

// Life
if (playback_id == life and not playback_stopped)
{
    if (drown != noone and audio_is_playing(drown))
    {
        mute &= ~MUTE_FLAG_DROWN;
        fade_music(drown, global.volume_music);
    }
    else if (array_length(jingle) > 0 and audio_is_playing(array_last(jingle)))
    {
        mute &= ~(MUTE_FLAG_DROWN | MUTE_FLAG_JINGLE);
        fade_music(array_last(jingle), global.volume_music);
    }
    else
    {
        mute = 0;
        fade_music(music, global.volume_music);
    }
    
    life = noone;
}

// Drown
if (playback_id == drown)
{
    if (mute & MUTE_FLAG_DROWN == 0)
    {
        if (array_length(jingle) > 0 and audio_is_playing(array_last(jingle)))
        {
            mute &= ~MUTE_FLAG_JINGLE;
            fade_music(array_last(jingle), global.volume_music);
        }
        else
        {
            mute = 0;
            fade_music(music, global.volume_music);
        }
    }
    
    drown = noone;
}

// Jingles
if (array_contains(jingle, playback_id))
{
    var jingle_index = array_get_index(jingle, playback_id);
    array_delete(jingle, jingle_index, 1);
    if (mute & MUTE_FLAG_JINGLE == 0)
    {
        if (array_length(jingle) == 0)
        {
            mute &= ~MUTE_FLAG_MUSIC;
            fade_music(music, global.volume_music);
        }
    }
}