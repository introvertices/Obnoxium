if (allowComplete == true) && (anteTimer > 0){
    
    
    anteTimer -=1
    
    
    //check quest status
    switch quest[2]{
        
        case "score":{
            // does the slot score match or exceed the target?
            if (global.slotScore >= trackStat){
                //increase ante
                currentAnte +=1
                
                // reset quest state
                quest=[0,"",""]
                captureStat = 0
                trackStat = 0
                
                // flag completion
                allowComplete = false
                
                // fetch next quest
                alarm[0] = 5
                break
            }
        }
        
        case "cookies":{
            // did the player match or exceed the number of cookies to click?
            if (global.cookieClicked >= trackStat){
                //increase ante
                currentAnte +=1
                
                // reset quest state
                quest=[0,"",""]
                captureStat = 0
                trackStat = 0
                
                // flag completion
                allowComplete = false
                
                // fetch next quest
                alarm[0] = 5
                break
            }
        }
        
        case "sin":{
            // did the player match or exceed the sin requirement?
            if (global.playerSin >= trackStat){
                //increase ante
                currentAnte +=1
                
                // reset quest state
                quest=[0,"",""]
                captureStat = 0
                trackStat = 0
                
                // flag completion
                allowComplete = false
                
                // fetch next quest
                alarm[0] = 5
                break
            }
            
        }
        
        case "plumpy":{
            // did the player win a plumpy time on the slots?
            var enemyNum = instance_number(ob_enemytuntun)
            if ( enemyNum >= trackStat){
                //increase ante
                currentAnte +=1
                
                // reset quest state
                quest=[0,"",""]
                captureStat = 0
                trackStat = 0
                
                // flag completion
                allowComplete = false
                
                // fetch next quest
                alarm[0] = 5
                break
            }
            
        }
        
        case "snail":{
            // did the required snail win the race?
            if (winningSnail == quest[0]){
                //increase ante
                currentAnte +=1
                
                // reset quest state
                quest=[0,"",""]
                captureStat = 0
                trackStat = 0
                
                // flag completion
                allowComplete = false
                
                // fetch next quest
                alarm[0] = 5
                break
            }
            
        }
    }

    alarm[1] = 1 * game_get_speed(gamespeed_fps)

}





// Fail state

if (anteTimer <= 0){
    
    instance_destroy()
    
    //ob_slot_lever.allow_click = false
    //
    //image_index = 1
    //allowComplete = false
    ////instance_create_layer(0,0,"ol",par_slotWin,{loadimg:0})
    //
    //
    //currentAnte = 1
    //global.slotScore /= 2
    //
    //alarm[0] = 4 * game_get_speed(gamespeed_fps)
}