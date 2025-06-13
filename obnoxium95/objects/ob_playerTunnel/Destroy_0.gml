for (var i = 0; i < irandom_range(3,9); i++){
    instance_create_layer(x,y,"particles",par_gore)
}


// update stats
global.deaths+=1
global.playerHP = global.playerMaxHP

if (global.playerSin >0){global.playerSin -= 0.02}

    
// update manager stats
with (C_gameroomMgr){event_user(0)}


// respawn
instance_create_layer(spawnX,spawnY,"Instances",ob_playerTunnel)