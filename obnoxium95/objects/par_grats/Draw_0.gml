draw_rectangle_color(x,y,x+300,y+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false)
draw_rectangle_color(x,y+25,x+300,y+75,make_color_rgb(33,33,33),make_color_rgb(33,33,33),make_color_rgb(33,33,33),make_color_rgb(33,33,33),false)

draw_set_color(c_white)
draw_set_font(f_key)

draw_text(x,y+2,"Steam Category Requirement Met!")
draw_text_ext(x+2,y+30, string(caption),15,290)