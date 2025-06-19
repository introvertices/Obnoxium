quest = anteEater()
anteTimer = 30
ob_slot_lever.allow_click = true

instance_create_layer(x,y,"ui",par_newAnte)



// if it's the snail quest spawn the snails
if (quest[2] == "snail") {
    if (instance_exists(ob_redSnail)){
        with (ob_redSnail){
            instance_destroy()
        }
    }
    if (instance_exists(ob_blueSnail)){
        with (ob_blueSnail){
            instance_destroy()
        }
    }
    
    instance_create_layer(128,96,"miscobs",ob_blueSnail)
    instance_create_layer(128,638,"miscobs",ob_redSnail)
    
}

allowComplete = true