if (allow_click = true){
    
    // play sfx
    audio_play_sound(choose(sfx[0],sfx[1]),1,false)
    audio_play_sound(sfx_slotSpin,2,true)
    
    
    image_speed = 1
    allow_click = false
    
    // set off slots
    slot1.alarm[0] = 5
    slot2.alarm[0] = 10
    slot3.alarm[0] = 15
    
}