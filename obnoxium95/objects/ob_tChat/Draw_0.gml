draw_rectangle_color(x, y, x + 450, y +300,c_black,c_black,c_black,c_black,false)
draw_rectangle_color(x, y, x + 450, y +300,c_red,c_black,c_red,c_red,true)

draw_set_font(f_key)
draw_set_color(c_white)

draw_text(x,y-66,"Connected to Twitch Chat API")

for (var i=0; i < array_length(currentChat); i++){
    draw_text(x -45, y + (i * 10), string(currentChat[i]))
}



