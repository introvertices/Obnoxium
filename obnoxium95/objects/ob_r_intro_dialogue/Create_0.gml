image_speed = 0.4


// Disallow card flipping so dialogue can be shown.

global.allowControl = false

// skip thru yapping
renderAll = false
goToNextLine = false


// dialogue tree
if (!variable_instance_exists(id, "dialogueTree")) {
    dialogueTree = [""]; // Only set if not already set
    show_debug_message(dialogueTree)
}

if (!variable_instance_exists(id, "head")) {
    head = sp_littleTalkingHead; // Only set if not already set

}


typeSpeed = 1
currentIndex = 0
currentLine = dialogueTree[currentIndex]

currentChar = 1

alarm[0] = typeSpeed

currentString = ""


