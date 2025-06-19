//collision calcs

dmgToSelf = enemyCreate.currenthp - ((global.playerAtk + global.attackMod) * 1.5)
global.slotScore += 70


// update manager stats
with (C_gameroomMgr){event_user(0)}

// Hp bar handling
if (show_hp == false) && (enemyCreate.currenthp > 0){

    hpPercent = floor(((enemyCreate.currenthp / enemyCreate.maxhp) * 100) / 2)
    
    show_hp = true
    
    alarm[0] = 0.75 * game_get_speed(gamespeed_fps)
    alarm[1] = 1.3 * game_get_speed(gamespeed_fps)
}