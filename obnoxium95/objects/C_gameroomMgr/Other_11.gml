// Slot machine win check

if (array_length(slotsStopped) >= 3){
    
    // consolation prizes
    
    if (slotsStopped[0] != slotsStopped[1]) || (slotsStopped[0] != slotsStopped[2]) || (slotsStopped[1] != slotsStopped[2]){
        global.slotScore += irandom_range(100,500) * (global.kills + 1 )
    }
    
    
    slotWins(slotsStopped[0],slotsStopped[1],slotsStopped[2])
    
    // Reset array
    slotsStopped = []
      
    ob_slot_lever.allow_click = true
    show_debug_message(global.slotScore)
}

