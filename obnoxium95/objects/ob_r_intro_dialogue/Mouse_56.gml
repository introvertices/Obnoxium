// skip or fill whole textbox depending on state

// only triggers when player has no control of game field
if (global.allowControl == false){
    
    
    // We're not currently rendering all of the text
    if (renderAll == false){
        
        
        
        // check if our current character is within bounds of the rendering
        if (currentChar < string_length(currentLine)){
            currentString = currentLine    // Set the string to the entire line of text
            renderAll = true
            alarm[0] = typeSpeed
            
            
        }
        
        
        // If the current character is the same length (or more) than the string length then reset everything and move to the next index
        else {
            currentString = ""
            currentIndex += 1
            currentChar = 1
            alarm[0] = typeSpeed
        }

    }

    else if (renderAll == true){
        currentString = ""
        currentIndex += 1
        currentChar = 1
        renderAll = false
        alarm[0] = typeSpeed
        
        
    }
    
    // Special case for card burn
    if (instance_exists(ob_cardLarge)){
        if (ob_cardLarge.burn == true){
            ob_cardLarge.alarm[0] = 5
            ob_cardLarge.burn = false    
        }
    }    

}