if (clearBuffer == true){
    draw_rectangle_color(0,0,room_width, room_height,c_black,c_black,c_black,c_black,false)
    clearBuffer = false
}
draw_sprite_ext(choose(sp_antebom,sp_cardLargeSymbols,sp_bozoWinOL,sp_closebutton,sp_par_miss),-1,ob_cookieClickVoid.x + 165, ob_cookieClickVoid.y,1,4,1,choose(c_black,c_fuchsia),1)


gpu_set_blendmode_ext(bm_inv_src_color,bm_inv_dest_color)
draw_sprite_ext(sp_cookie,0,x,y,image_xscale,image_yscale,irandom_range(0,3),c_white,1)
gpu_set_blendmode(bm_normal)

draw_set_font(f_score)
draw_rectangle_color(x-3,y+150,x+250,y+190,c_black,c_black,c_black,c_black,false)
draw_text_color(x,y+148,string(formatCount),c_black,c_black,c_blue,c_blue,0.5)
draw_text_color(500,150,string(dialogue),c_black,c_black,c_blue,c_blue,0.5)

draw_set_font(f_score)
draw_text_color(x,y+150,string(formatCount),c_white,c_white,c_white,c_white,1)
draw_text_color(498,152,string(dialogue),c_white,c_white,c_white,c_white,1)

