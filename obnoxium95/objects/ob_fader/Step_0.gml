

if (fadeStatus == 0){
    image_alpha += diff
}
else if (fadeStatus == 1){
    image_alpha -= diff
}

if (image_alpha > 1){
    room_goto(global.roomTarget)
}
else if (image_alpha < 0){
    instance_destroy()
}