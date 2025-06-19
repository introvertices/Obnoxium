// ANTE QUEST
draw_self()


//timer
draw_set_font(f_score)
draw_set_halign(fa_center)
draw_text_transformed_color(x+5,y-3,string(anteTimer),1,1,-58,c_white,c_white,c_grey,c_grey,1)

draw_set_font(f_key)
draw_text(room_width/2,room_height-40,"...And remember to keep clicking :)")


draw_set_halign(fa_left)
draw_set_color(c_white)