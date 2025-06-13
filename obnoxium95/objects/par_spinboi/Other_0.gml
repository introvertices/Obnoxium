switch (get_room){
    
    case "r_1_intro":{
        global.roomTarget = r_2_game
        

        break
    }
}

// fade
var fader = instance_create_layer(0,0,"Instances",ob_fader, {
    fadeStatus: 0})
        

instance_destroy()