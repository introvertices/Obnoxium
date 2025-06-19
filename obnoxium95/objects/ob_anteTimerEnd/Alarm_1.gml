
    
    if (anteTimer >= 1){
        anteTimer -=1
        alarm[1] = 1 * game_get_speed(gamespeed_fps)
    }
    
    
    
// Fail state

if (anteTimer == 0){
    
    anteTimer = 0
    allowClick = false
}