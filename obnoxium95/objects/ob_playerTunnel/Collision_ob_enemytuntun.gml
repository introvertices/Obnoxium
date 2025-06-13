direction +=180

// Hp bar handling
if (show_hp == false) && (global.playerHP > 0){

    //hpPercent = floor(((global.playerHP / global.playerMaxHP) * 100) /2)
    
    show_hp = true
    takedmg = false
    
    //alarm[0] = 0.75 * game_get_speed(gamespeed_fps)
    alarm[1] = 1.3 * game_get_speed(gamespeed_fps)
}