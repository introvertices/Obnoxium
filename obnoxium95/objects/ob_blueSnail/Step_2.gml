snailSpeed = irandom_range(1,2)

x += choose(0,1,snailSpeed,snailSpeed*1.25)

//check location
if (x >= 1150){
    ob_anteTimer.winningSnail = "Blue"
    with(ob_redSnail){
        instance_destroy()
    }
    instance_destroy()
}