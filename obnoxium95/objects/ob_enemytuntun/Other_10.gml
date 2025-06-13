if (realDeath == false){
    global.kills+=1
    global.playerAtk += 0.02
    global.playerSin += 0.02
    global.dungeonWins += 0.1
        
    // update manager stats
    with (C_gameroomMgr){event_user(0)}
        
    // debug
    show_debug_message(global.kills)
    realDeath = true
    
}