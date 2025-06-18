// ANTE QUEST
draw_self()


draw_set_font(f_ui)
draw_text_color(203,533,"ANTE " + string(currentAnte) +"/10: " +string(quest[1]),c_white,c_white,c_orange,c_orange,1)


//timer
draw_set_font(f_score)
//draw_text_color(x,y,string(anteTimer),c_red,c_red,c_orange,c_orange,1)

draw_text_transformed_color(x,y,string(anteTimer),1,1,-45,c_white,c_white,c_grey,c_grey,1)