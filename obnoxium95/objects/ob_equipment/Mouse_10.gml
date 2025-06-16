if (border > 0) && (icon > 0){

    array_push(mouseoverData, "Lv." +string(item.level) + " " + string(item.name))
    array_push(mouseoverData, "Atk: +" +string(attack))
    array_push(mouseoverData, "Spd: +" +string(speedmod))
    
    C_gameroomMgr.mouseoverData = mouseoverData
    C_gameroomMgr.mouseover = true
}