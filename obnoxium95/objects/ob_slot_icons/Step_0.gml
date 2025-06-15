if (slotSpinning == true) && (image_speed > 0){
    image_speed -= speedMod
    
}

if (image_speed <= 0) && (slotSpinning == true) && (stopSlots == false){
    alarm[1] = 5
    stopSlots = true
    
    
}