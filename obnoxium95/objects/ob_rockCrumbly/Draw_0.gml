draw_self()


// health bar
if (show_hp){
    draw_rectangle_color(x,y+5,x+sprite_width,y+10,c_black,c_black,c_black,c_black,false)
    draw_rectangle_color(x,y+5,x+hp,y+10,c_red,c_red,c_red,c_red,false)
    draw_rectangle_color(x,y+4,x+sprite_width,y+11,c_white,c_white,c_white,c_white,true)
}


