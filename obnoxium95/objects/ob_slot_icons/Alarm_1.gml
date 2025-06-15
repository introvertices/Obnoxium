// stop spin
if (slotSpinning == true){
    slotSpinning = false
    image_speed = 0
    stopSlots = false
    
    // convert image index to int
    image_index = floor(image_index)
    
    // shift image if it's an odd number
    if (image_index % 2 == 1){
        image_index += 1
    }
    
    // Make sure we don't exceed the sprite's frame count
    var max_frame = sprite_get_number(sp_slot_icons) - 1
    if (image_index > max_frame) {
        image_index = max_frame - (max_frame % 2)  // Go to the highest even frame
    }

    
    
    // Send signal to game manager
    array_insert(C_gameroomMgr.slotsStopped, 0, image_index)
    
    //show_debug_message(string(id) + " " + string(image_index))
    
    show_debug_message(C_gameroomMgr.slotsStopped)
    
    with(C_gameroomMgr){event_user(1)}
}