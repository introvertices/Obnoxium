


// talking head
if (head == sp_littleTalkingHead){
    draw_sprite(head,-1,room_width,room_height-150)
}
else {
    draw_sprite_ext(head,-1,(room_width/2)-15,room_height/2,1.2,1.2,0,c_black,0.6)
    draw_sprite(head,-1,room_width/2,room_height/2)
}



// box
draw_rectangle_color(0,room_height - 150,room_width,room_height,c_navy,c_navy,c_black,c_black,false)
draw_rectangle_color(2,room_height - 150,room_width-2,room_height-2,c_white,c_white,c_white,c_white,true)


// text
draw_set_font(f_game)
draw_text_ext(20,room_height - 140,string(currentString),30,room_width-50)

// mouse icon
draw_sprite(sp_ui_mouseclick,-1,room_width - 5, room_height - 5)