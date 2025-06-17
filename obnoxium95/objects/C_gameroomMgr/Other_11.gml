// Slot machine win check

if (array_length(slotsStopped) >= 3){
    
    // stop spinning sound
    if (audio_is_playing(sfx_slotSpin)) {
        audio_stop_sound(sfx_slotSpin)
    }
    
    // consolation prizes
    
    if (slotsStopped[0] != slotsStopped[1]) || (slotsStopped[0] != slotsStopped[2]) || (slotsStopped[1] != slotsStopped[2]){
        global.slotScore += irandom_range(100,500) * (global.kills + 1 )
    }
    
    // sneaky win
    if (slotsStopped[0] != slotsStopped[1]) && (slotsStopped[0] == slotsStopped[2]){
        var luckCheck = irandom(100){
            if (luckCheck >= global.playerSin){
                ob_slot_lever.slot2.image_index = ob_slot_lever.slot1.image_index
                slotsStopped[0] = ob_slot_lever.slot1.image_index
                slotsStopped[1] = ob_slot_lever.slot2.image_index
                slotsStopped[2] = ob_slot_lever.slot2.image_index
            }
        }
    }
    
    // bad luck protection
    if (slotsStopped[0] != slotsStopped[1]) && (slotsStopped[0] != slotsStopped[2]) && (slotsStopped[1] != slotsStopped[2]){
        var luckRoll = irandom(5)
        if (luckRoll = 2){
            var prize = choose(0,2,4,6,8,10)
            ob_slot_lever.slot1.image_index = prize
            ob_slot_lever.slot2.image_index = prize
            ob_slot_lever.slot3.image_index = prize
            slotsStopped[0] = ob_slot_lever.slot1.image_index
            slotsStopped[1] = ob_slot_lever.slot2.image_index
            slotsStopped[2] = ob_slot_lever.slot2.image_index
        }
    }
    
    
    slotWins(slotsStopped[0],slotsStopped[1],slotsStopped[2])
    
    // Reset array
    slotsStopped = []
      
    ob_slot_lever.allow_click = true
    event_user(0)
    show_debug_message(global.slotScore)
}

