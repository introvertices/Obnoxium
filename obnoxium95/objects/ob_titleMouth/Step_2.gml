if (ob_titleBox.isGrabbed == true){
    xscale = 1 + (mouse_x/1000)
    yscale = 1 - (mouse_x/5000)
}

if (xscale > 1.8) {
    global.gooner = true
}