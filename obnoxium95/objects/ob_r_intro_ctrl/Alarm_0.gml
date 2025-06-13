if (cardsFlipped >= 3){
    
    playerQuality = global.playerAtk + global.playerHP + global.playerSin
    
    //destroy all the cards
    ob_cardLarge.burn = true    // Set cards to burn
    
    if (playerQuality >= 100){
        array_push(jSpeechResults,"Excellent! A nice healthy poppet to throw into the... games.")
    }
    else if (playerQuality >= 30) && (playerQuality <= 99){
        array_push(jSpeechResults,"Hmm, nothing special but you can always improve on it!")
    }
    else {
        array_push(jSpeechResults,"Oof, not my best work there haha!")
    }
    
    concatStats = "You wound up with... " + string(global.playerHP) + " HP, " + string(global.playerAtk) + " Attack, and " + string(global.playerSin) + " Sin, whatever that means."
    
    array_push(jSpeechResults, concatStats)
    
    instance_create_layer(0,0,"dialogue",ob_r_intro_dialogue,{dialogueTree:jSpeechResults, head:sp_littleTalkingHead})
    
}

