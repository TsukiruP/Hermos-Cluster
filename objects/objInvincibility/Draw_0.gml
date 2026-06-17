/// @description Draw
var radius = 16;
var sine = dsin(inner_angle) * radius;
var cosine = dcos(inner_angle) * radius;

// First circle
var subimg = frame_table1[image_index mod array_length(frame_table1)];
if (image_index & 1 == 1)
{
	draw_sprite(sprInvincibilityStar, subimg, x + cosine, y - sine);
	draw_sprite(sprInvincibilityStar, subimg + 5, x - cosine, y + sine);
}
else
{
	draw_sprite(sprInvincibilityStar, subimg, x + sine, y + cosine);
	draw_sprite(sprInvincibilityStar, subimg + 5, x - sine, y - cosine);
}

sine = dsin(outer_angle) * radius;
cosine = dcos(outer_angle) * radius;

// Second circle
subimg = frame_table2[image_index mod array_length(frame_table2)];
draw_sprite(sprInvincibilityStar, subimg, x_table[0] + cosine, y_table[0] - sine);
draw_sprite(sprInvincibilityStar, subimg + 7, x_table[0] - cosine, y_table[0] + sine);

// Third circle
subimg = frame_table3[image_index mod array_length(frame_table3)];
draw_sprite(sprInvincibilityStar, subimg, x_table[2] - sine, y_table[2] - cosine);
draw_sprite(sprInvincibilityStar, subimg + 6, x_table[2] + sine, y_table[2] + cosine);

// Fourth circle
subimg = frame_table4[image_index mod array_length(frame_table4)];
draw_sprite(sprInvincibilityStar, subimg, x_table[4] + cosine, y_table[4] - sine);
draw_sprite(sprInvincibilityStar, subimg + 5, x_table[4] - cosine, y_table[4] + sine);