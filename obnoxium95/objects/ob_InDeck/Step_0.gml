if(x <= ob_deckbuild.xMove){
    x+=5
    if (y >= 150){
        y+= ob_notInDeck.yMove
    }
    
}

else{image_speed = 0; image_index = sprite_get_number(sprite_index)-1; }