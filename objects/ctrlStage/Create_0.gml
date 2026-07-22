/// @description Initialize
image_speed = 0;
stage_players = [];
pause_allow = true;

// Depths
display_depth = layer_get_depth("Display");
particles_depth = layer_get_depth("Particles");
player_depth = layer_get_depth("Player");
stage_depth = layer_get_depth("Stage");

// Timing
stage_time = 0;
time_limit = time_to_frames(10, 0);
time_over = false;
time_enabled = false;

// Setup tilemaps; delist invalid ones
tilemaps =
[
    layer_tilemap_get_id("TilesMain"),
    layer_tilemap_get_id("TilesLayer0"),
    layer_tilemap_get_id("TilesLayer1"),
    layer_tilemap_get_id("TilesSemisolid")
];

if (tilemaps[3] == -1) array_pop(tilemaps);
if (tilemaps[1] == -1) array_delete(tilemaps, 1, 2); 

// Create UI elements
instance_create_layer(0, 0, "Display", objHUD);