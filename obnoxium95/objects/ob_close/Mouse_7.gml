currRoom = room_get_name(room)


switch (currRoom){
    
    case "r_void1":{room_goto(r_snail); audio_stop_all(); break}
    
    case "r_snail":{instance_create_layer(0,0,"UILayer_1",par_hearty);room_goto(r_deckbuild);instance_destroy();break}
    
}