// Tun stats

draw_set_font(f_ui)
draw_set_color(c_ltgrey)
draw_text_color(tile*8,yHeight,string(stats.playerhp) + "/" + string(stats.playerMaxHP),c_ltgrey,c_ltgrey,c_aqua,c_aqua,1)
draw_text_color(tile*16,yHeight,string(stats.playerAtk),c_ltgrey,c_ltgrey,c_aqua,c_aqua,1)
draw_text_color(tile*24,yHeight,string(stats.playerSin),c_ltgrey,c_ltgrey,c_aqua,c_aqua,1)
draw_text_color(tile*31,yHeight,string(stats.dungeonLevel),c_ltgrey,c_ltgrey,c_aqua,c_aqua,1)

draw_set_color(c_white)