/// @description Start Music
var room_scene = global.scenes[$ room_get_name(room)] ?? global.scenes.rmDefault;
if (room_scene.music != undefined) audio_enqueue_bgm(room_scene.music, PRIORITY_MUSIC);