// Tun stats

draw_set_font(f_ui)
draw_set_color(c_ltgrey)
draw_text_color(tile*8,yHeight,string(stats.playerhp) + "/" + string(stats.playerMaxHP),c_ltgrey,c_ltgrey,c_aqua,c_aqua,1)
draw_text_color(tile*16,yHeight,string(stats.playerAtk),c_ltgrey,c_ltgrey,c_aqua,c_aqua,1)
draw_text_color(tile*24,yHeight,string(stats.playerSin),c_ltgrey,c_ltgrey,c_aqua,c_aqua,1)
draw_text_color(tile*31,yHeight,string(stats.dungeonLevel),c_ltgrey,c_ltgrey,c_aqua,c_aqua,1)

draw_set_color(c_white)

// Scoreboard
draw_set_font(f_score)
draw_text_color(280,228,string(formatScore),merge_colour(colourScore[0],colourScore[1],pingPong),merge_colour(colourScore[1],colourScore[2],pingPong),merge_colour(colourScore[2],colourScore[3],pingPong),merge_colour(colourScore[3],colourScore[0],pingPong),1)

//  key and mouseover
draw_sprite_ext(sp_slotKey,isCrumbed,544,352,1,1,0,c_white,1)


if (mouseover = true) && (array_length(mouseoverData)>0){
    draw_set_color(c_white)
    draw_set_font(f_key)
    draw_text_ext(550,444,string(mouseoverData[0]) + "\n" +string(mouseoverData[1]) + "\n" +string(mouseoverData[2]),13,136)

}
