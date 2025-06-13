// check Where we're at in the dialogue


// Within the range of the dialogueTree's indexes
if (currentIndex < array_length(dialogueTree)){
    currentLine = dialogueTree[currentIndex]
    
    if (currentChar <= string_length(currentLine)) && (renderAll == false){
        currentString += string_char_at(currentLine,currentChar)
        currentChar += 1
        alarm[0] = typeSpeed
        
    }
    else if (renderAll == true){
        currentString = currentLine
        
    }
    
}

// Out of Bounds
else if (currentIndex >= array_length(dialogueTree)){
    global.allowControl = true
    alarm[11] = 1
    
}
