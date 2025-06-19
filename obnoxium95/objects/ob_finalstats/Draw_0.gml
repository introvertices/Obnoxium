draw_set_font(f_bozo)
draw_set_color(c_white)




if (global.gooner = true){
    draw_text(xpad,ypad,"We all saw you peek")
}

draw_text(xpad,ypad*2,"You died " +string(global.deaths) +" times")
draw_text(xpad,ypad*3,"Your dungeon reached Level " + string(global.dungeonWins))
draw_text(xpad,ypad*4,"Your final slot score was " + string(global.slotScore))
draw_text(xpad,ypad*5,"You won " + string(global.antes) +" antes")
draw_text(xpad,ypad*6,"You should've clicked the cookie " + string(global.cookieClicksToGo) +" more times...")