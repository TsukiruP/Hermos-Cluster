/// @description Initialize
event_inherited();
hitboxes[0].set_size(-8, -8, 8, 8);
reaction = function(_pla)
{
    if (collision_player(0, _pla) and _pla.state != player_is_hurt and _pla.recovery_time < 90)
    {
        with (_pla) player_gain_rings(other.value);
        audio_play_sfx(super ? sfxRingSuper : sfxRing);
        particle_create(x, y, global.anim_ring_sparkle);
		instance_destroy();
    }
};

// Movement and collision
x_speed = 0;
y_speed = 0;

target = noone;
magnetized = false;
magnet_range = 64;
follow_speed = 0.1875;
turn_speed = 0.75;

lost = false;
lifespan = 256;
gravity_force = 18 / 256;

tilemaps = variable_clone(ctrlStage.tilemaps, 0);
tilemap_count = array_length(tilemaps);

// Validate semisolid tilemap; if it exists, the tilemap count is even
semisolid_tilemap = -1;
if (tilemap_count & 1 == 0)
{
	semisolid_tilemap = array_last(tilemaps);
	--tilemap_count;
}

// Delist the "TilesLayer1" layer tilemap, if it exists
if (tilemap_count >= 3)
{
    array_delete(tilemaps, 2, 1);
    --tilemap_count;
}

// Misc.
frame_speed = 8;
super = false;
value = 1;