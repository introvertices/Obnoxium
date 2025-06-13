if (flipped == false) && (global.allowControl == true){
    image_speed = 1
    flipped = true
    ob_r_intro_ctrl.cardsFlipped +=1
    ob_r_intro_ctrl.alarm[0] = 10
    
    // Send stats to the player roguelike globals
    switch (card_name){
        case "type":{global.playerHP += (cardnum * cardsymbol); break;}
    
        case "atk":{global.playerAtk += (cardnum + cardsymbol); break;}
    
        case "sin":{global.playerSin += (cardnum * cardsymbol); break;}
    }
    
    global.playerMaxHP = global.playerHP
}

