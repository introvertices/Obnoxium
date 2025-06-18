quest = anteEater()
anteTimer = 30
ob_slot_lever.allow_click = true

allowComplete = true

// if it's the snail quest spawn the snails
if (quest[2] == "snail"){
    instance_create_layer(128,96,"miscobs",ob_blueSnail)
    instance_create_layer(128,574,"miscobs",ob_redSnail)
}