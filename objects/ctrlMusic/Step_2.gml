/// @description Swap
if (swap)
{
    if (music == noone or not audio_is_playing(music) or audio_sound_get_gain(music) <= 0)
    {
        swap = false;
        if (music != noone and audio_is_playing(music)) audio_stop_sound(music);
        if (ds_priority_size(playlist > 0))
        {
            var up_next = ds_priority_find_max(playlist);
            music = audio_play_sound(up_next, PRIORITY_MUSIC, array_contains(looped_music, up_next), global.volume_music * (mute & MUTE_FLAG_MUSIC == 0));
        }
    }
}