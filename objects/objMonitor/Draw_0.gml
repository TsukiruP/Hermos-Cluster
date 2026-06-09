/// @description Draw
var frame = ctrlWindow.image_index;
draw_sprite(sprite_index, frame div 2, x, y);
if (frame mod 6 > 1) draw_sprite(sprMonitorIcons, icon, x, y - 5);