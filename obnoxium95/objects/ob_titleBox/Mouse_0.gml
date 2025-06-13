if (isGrabbed == true){
    
    diff_x = mouse_x - offset_x
    diff_y = mouse_y - offset_y
    
    x += diff_x
    y += diff_y
    
    offset_x = mouse_x
    offset_y = mouse_y
    
}
