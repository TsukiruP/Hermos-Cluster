/// @description Start BGM
var room_music = room_get_scene(room).music;
if (room_music != undefined) audio_enqueue_bgm(room_music, PRIORITY_MUSIC);