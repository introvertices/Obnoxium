if (ob_deckbuild.deckSizeHidden < 5){


    instance_create_layer(x,y,"Instances",ob_InDeck)
    allowClick = false
    
    alarm[0] = 1 * game_get_speed(gamespeed_fps)
    
    if (yMove == 0){
        yMove = -3
    }
    else if (yMove == -3){
        yMove = 0
    }
    
}