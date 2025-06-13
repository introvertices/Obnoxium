tile = 32


spawnRanges = [
[tile*13, view_wport - tile, tile, tile * 3],
[tile, view_wport - tile, tile * 19, tile * 21],
[tile, tile * 3, tile * 3, tile * 18],
[view_wport - tile, view_wport - (tile * 4), tile * 3, tile * 18]]


for (i = 0; i < array_length(spawnRanges); i++){
    spawnRocks(spawnRanges[i],ob_rockCrumbly)
    spawnEnemy(spawnRanges[i],ob_enemytuntun)
    spawnEnemy(spawnRanges[i],ob_enemytuntun)
}


alarm[0] = 35 * game_get_speed(gamespeed_fps)