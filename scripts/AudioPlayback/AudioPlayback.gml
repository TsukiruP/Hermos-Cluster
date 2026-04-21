/// @description Sets the loop section of the given sound asset.
/// @param {Asset.GMSound} ind Sound asset to loop.
/// @param {Real} [start] Start point of the loop section in seconds (optional, defaults to 0).
/// @param {Real} [end] End point of the loop section in seconds (optional, defaults to 0).
function audio_loop_section(_ind, _start = 0, _end = 0)
{
    audio_sound_loop_start(_ind, _start);
    audio_sound_loop_end(_ind, _end);
}

/// @description Plays a single instance of the given sound effect.
/// @param {Asset.GMSound} ind Sound effect to play.
/// @param {Bool} [loop] Sets the sound to loop or not (optional, defaults to false)
/// @returns {Id.Sound}
function audio_play_sfx(_ind, _loop = false)
{
	audio_stop_sound(_ind);
	return audio_play_sound(_ind, PRIORITY_SOUND, _loop, global.volume_sound);
}

/// @description Plays the given music track as a jingle. Background music is muted until the jingle has finished playing.
/// @param {Asset.GMSound} ind Music track to play.
function audio_play_jingle(_ind)
{
	with (ctrlMusic)
	{
		if (array_length(jingle) > 0) audio_sound_gain(array_last(jingle), 0);
        audio_stop_sound(_ind);
        array_push(jingle, audio_play_sound(_ind, PRIORITY_JINGLE, false, global.volume_music * (mute * MUTE_FLAG_JINGLE == 0)));
        mute_music(MUTE_FLAG_MUSIC);
	}
}

function audio_play_drown()
{
    with (ctrlMusic)
    {
        drown = audio_play_sound(bgmMadGear, PRIORITY_DROWN, false, global.volume_music * (mute & MUTE_FLAG_DROWN == 0));
        mute_music(MUTE_FLAG_JINGLE | MUTE_FLAG_MUSIC);
    }
}

/// @description Adds the given music track to the playlist at the given priority. The track is played if it has the highest priority.
/// @param {Asset.GMSound} ind Music track to add.
/// @param {Real} priority Priority value to assign.
function audio_enqueue_bgm(_ind, _priority)
{
	with (ctrlMusic)
	{
		if (ds_priority_find_priority(playlist, _ind) == undefined)
		{
			ds_priority_add(playlist, _ind, _priority);
		}
		
		if (not audio_is_playing(_ind) and ds_priority_find_max(playlist) == _ind)
		{
			swap = true;
            fade_music(music);
		}
	}
}

/// @description Removes the given music track from the playlist. If it was playing, the track below is played next.
/// @param {Asset.GMSound} ind Music track to remove.
function audio_dequeue_bgm(_ind)
{
	with (ctrlMusic)
	{
		ds_priority_delete_value(playlist, _ind);
		if (audio_is_playing(_ind))
        {
            swap = true;
            fade_music(music);
        }
	}
}

/// @description Clears the playlist and currently playing music.
function audio_clear_bgm()
{
    with (ctrlMusic)
    {
        mute = 0;
        swap = true;
        ds_priority_clear(playlist);
        fade_music(music);
    }
}