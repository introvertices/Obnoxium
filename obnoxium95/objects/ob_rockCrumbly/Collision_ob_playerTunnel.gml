

if (show_hp == false){
    if (hp > 0){
        hp -= 2
    }
    show_hp = true
    alarm[0] = 0.75 * game_get_speed(gamespeed_fps)
}

