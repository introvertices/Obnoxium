draw_set_color(c_orange)
draw_set_font(f_game)

draw_set_halign(fa_center)
draw_text(room_width/2,room_height-100,"It is now safe to \n build your deck.")
draw_set_halign(fa_left)


draw_set_color(c_white)
draw_text(5,room_height-30,"Deck Size: " +string(deckSize))