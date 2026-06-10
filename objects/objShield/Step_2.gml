/// @description Move
x = owner.x div 1;
y = owner.y div 1;

if (owner.animation != "roll")
{
	var ang = owner.direction;
	x -= dsin(ang) * 4;
	y -= dcos(ang) * 4;
}