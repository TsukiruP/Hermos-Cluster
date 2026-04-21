/// @description Initialize
image_speed = 0;
mute = 0;
swap = false;

playlist = ds_priority_create();
music = noone;
jingle = [];
drown = noone;
life = noone;

fade_music = function(_ind, _gain = 0)
{
    if (_ind != noone and audio_is_playing(_ind)) audio_sound_gain(_ind, _gain, TEN_MILLISECONDS);
}

mute_music = function(_flags)
{
    if (_flags & MUTE_FLAG_MUSIC)
    {
        if (music != noone and audio_is_playing(music)) audio_sound_gain(music, 0);
    }
    
    if (_flags & MUTE_FLAG_JINGLE)
    {
        if (array_length(jingle) > 0)
        {
            audio_sound_gain(array_last(jingle), 0);
        }
    }
    
    if (_flags & MUTE_FLAG_DROWN)
    {
        if (drown != noone and audio_is_playing(drown)) audio_sound_gain(drown, 0);
    }
}

looped_music = [];
var set_music_loop = function(_ind, _start = 0, _end = 0)
{
    audio_loop_section(_ind, _start, _end);
    array_push(looped_music, _ind);
};

// Define music loop points here; looped music w/o loop points should be inserted into the `looped_music` array.
set_music_loop(bgmExtraDungeon1A, 814140 / 44100, 6676039 / 44100);
set_music_loop(bgmSunshineCoastline, 00450784 / 48000, 08694455 / 48000);