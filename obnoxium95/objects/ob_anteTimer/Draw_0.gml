// ANTE QUEST
draw_self()


draw_set_font(f_ui)
draw_text_color(203,533,"ANTE " + string(currentAnte) +" : " +string(quest[1]),c_white,c_white,c_orange,c_orange,1)


//timer
draw_set_font(f_score)
//draw_text_color(x,y,string(anteTimer),c_red,c_red,c_orange,c_orange,1)
draw_set_halign(fa_center)
draw_text_transformed_color(x+5,y-3,string(anteTimer),1,1,-58,c_white,c_white,c_grey,c_grey,1)
draw_set_halign(fa_left)