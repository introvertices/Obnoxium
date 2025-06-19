C_gameroomMgr.anteFailed +=1

instance_create_layer(0,0,"ol",par_anteFail)

if (C_gameroomMgr.anteFailed < 3){
    instance_create_layer(x,y,"ui",ob_anteTimer)
}
else{room_goto(r_void1)}
