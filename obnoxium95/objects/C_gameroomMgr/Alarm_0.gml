// crumbometer
if (isCrumbed == 1){
    crumbMod = 1 + round(global.cookieClicked / 2)
    instance_create_layer(irandom_range(64,600),irandom_range(64,room_height-200),"ol",ob_bozoWin,{
        bombdmg: crumbMod * irandom_range(2,10)})
}