// Increase dungeon level


//update struct

if (global.kills >= 10){
    var levelmod = global.kills % 10
    global.dungeonWins = levelmod
    
    // increase difficulty
    global.dungeonMod += 0.1
    
    // spawn enemies
    /*with (ob_tuntunSpawner){event_user(0)}*/
}

stats.playerAtk = format_scientific(global.playerAtk)
stats.playerMaxHP = format_scientific(global.playerMaxHP)
stats.playerhp =  format_scientific(global.playerHP)
stats.playerSin = format_scientific(global.playerSin)
stats.dungeonLevel = global.dungeonWins
stats.kills = global.kills
stats.deaths = global.deaths