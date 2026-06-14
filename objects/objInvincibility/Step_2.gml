/// @description Movement
array_shift(x_table);
array_shift(y_table);
array_push(x_table, x);
array_push(y_table, y);

x = owner.x div 1;
y = owner.y div 1;

var size = array_length(circle_ox);
repeat (size)
{
	var offset = --size * 2;
	circle_ox[size] = x_table[offset];
	circle_oy[size] = y_table[offset];
}

inner_angle -= 11.25;
outer_angle -= 22.5;