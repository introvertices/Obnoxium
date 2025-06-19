var roll = irandom(2)

if(roll == 0){
    global.playerSin += bombdmg 
}
else if (roll == 1){
    global.slotScore -= bombdmg
}
else if (roll == 2){
    global.cookieTotal +=bombdmg
}

instance_destroy()
    