draw_self()

if (image_speed ==0){
    
    
    draw_set_font(f_key)
    draw_text_ext(x-60,y-70,string(parsed.name),15,120)
    draw_text(x-60,y-25,"Atk:" +string(parsed.attack))
    draw_text_ext(x-60,y,string(parsed.ability),15,120)
    draw_text_ext(x-60,y+60,string(parsed.cry_for_help),15,120)
    
}
