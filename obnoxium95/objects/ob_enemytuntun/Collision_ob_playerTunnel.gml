direction +=irandom_range(180,190)


//collision calcs

// Damage FROM player to ENEMY

//check self dodge
var rolldice_e = irandom_range(1,100)
if rolldice_e <= round(enemyCreate.dodge){
    // dodge attack
    instance_create_layer(x,y,"particles",par_miss)
    //array_push(ob_DEBUGGER.lastHits, "enemy dodged")
}
else if (rolldice_e >= 85){
    // crit strike to self
    dmgToSelf = enemyCreate.currenthp - ((global.playerAtk + global.attackMod) * 1.5)
    global.slotScore += 100
}
else {
    // if not dodged take a hit
    dmgToSelf = (global.playerAtk + global.attackMod) * choose(1,1.2)
    global.slotScore += 72.30
}


// damage FROM enemy to PLAYER


 
var rolldice_p = irandom_range(1,100)
if (rolldice_p <= global.playerDodge){
    //dodged by player
    instance_create_layer(ob_playerTunnel.x,ob_playerTunnel.y,"particles",par_miss)
    //array_push(ob_DEBUGGER.lastHits, "player dodged")
}
else {
    // damage the player, enemies cannot crit
    dmgToPlayer = enemyCreate.attack * choose(1,1.2)
    show_debug_message(dmgToPlayer)
}

// send dmg

if (takedmg == true){
    enemyCreate.currenthp -= round(dmgToSelf)
    //var concat = string(dmgToSelf) + " to self"
    //array_push(ob_DEBUGGER.lastHits, string(concat)) 

    takedmg = false
}

if (ob_playerTunnel.takedmg == true){
    
    //var concat = string(dmgToPlayer) + " to P "
    //array_push(ob_DEBUGGER.lastHits, string(concat)) 
    global.playerHP -= round(dmgToPlayer)
    ob_playerTunnel.takedmg = false
    ob_playerTunnel.alarm[1] = 1.3 * game_get_speed(gamespeed_fps)
}


// update manager stats
with (C_gameroomMgr){event_user(0)}

// Hp bar handling
if (show_hp == false) && (enemyCreate.currenthp > 0){

    hpPercent = floor(((enemyCreate.currenthp / enemyCreate.maxhp) * 100) / 2)
    
    show_hp = true
    
    alarm[0] = 0.75 * game_get_speed(gamespeed_fps)
    alarm[1] = 1.3 * game_get_speed(gamespeed_fps)
}