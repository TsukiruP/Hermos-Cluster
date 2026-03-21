/// @description Misc.

/// @method player_gain_rings
/// @description Increases the player's ring count by the given amount.
/// @param {Real} num Amount of rings to give.
player_gain_rings = function (num)
{
	global.rings = min(global.rings + num, 999);
	audio_play_sfx(sfxRing);
	
	// Gain lives
	if (global.rings > global.rings_for_life)
	{
		num = global.rings div 100;
		player_gain_lives(num - global.rings_for_life div 100);
		global.rings_for_life = num * 100 + 99;
	}
};

/// @method player_gain_lives
/// @description Increases the player's life count by the given amount.
/// @param {Real} num Amount of lives to give.
player_gain_lives = function (num)
{
	lives = min(lives + num, 99);
	audio_play_jingle(bgmLife);
};