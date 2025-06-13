if (head == sp_littleTalkingHead){
    instance_create_layer(room_width,room_height-150,"particles",par_spinboi)
}


for (var i= 0; i < 35; i++){
    instance_create_layer(irandom_range(0,room_width),irandom_range(room_height,room_height+15),"particles",par_smoke)
}

instance_destroy()