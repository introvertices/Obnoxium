if (allowComplete == true) && (anteTimer > 0){
    
    
    anteTimer -=1
    
    
    //check quest status
    switch quest[2]{
        
        case "score":{
            // does the slot score match or exceed the target?
            if (global.slotScore >= quest[0]){
                //increase ante
                currentAnte +=1
                
                // reset quest state
                quest=[0,"",""]
                
                // flag completion
                allowComplete = false
                
                // fetch next quest
                alarm[0] = 5
                break
            }
        }
        
        case "cookies":{
            // did the player match or exceed the number of cookies to click?
            if (global.slotScore >= quest[0]){
                //increase ante
                currentAnte +=1
                
                // reset quest state
                quest=[0,"",""]
                
                // flag completion
                allowComplete = false
                
                // fetch next quest
                alarm[0] = 5
                break
            }
        }
        
        case "sin":{
            // did the player match or exceed the sin requirement?
            if (global.slotScore >= quest[0]){
                //increase ante
                currentAnte +=1
                
                // reset quest state
                quest=[0,"",""]
                
                // flag completion
                allowComplete = false
                
                // fetch next quest
                alarm[0] = 5
                break
            }
            
        }
        
        case "plumpy":{
            // did the player win a plumpy time on the slots?
            if (global.slotScore >= quest[0]){
                //increase ante
                currentAnte +=1
                
                // reset quest state
                quest=[0,"",""]
                
                // flag completion
                allowComplete = false
                
                // fetch next quest
                alarm[0] = 5
                break
            }
            
        }
        
        case "snail":{
            // did the required snail win the race?
            if (global.slotScore >= quest[0]){
                //increase ante
                currentAnte +=1
                
                // reset quest state
                quest=[0,"",""]
                
                // flag completion
                allowComplete = false
                
                // fetch next quest
                alarm[0] = 5
                break
            }
            
        }
    }
}


alarm[1] = 1 * game_get_speed(gamespeed_fps)