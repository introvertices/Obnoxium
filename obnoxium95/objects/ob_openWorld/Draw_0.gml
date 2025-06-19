draw_set_font(f_score)
draw_text(150,30,"CAN I INTEREST U IN SOME OPEN WORLDS GAMEPLAY??")


draw_set_font(f_bozo)
draw_set_color(c_dkgray)

for (var i = 0; i < array_length(worlds); i++){
    

    draw_text(irandom(room_width),irandom(room_height),string(worlds[i]))
}


draw_set_color(c_white)