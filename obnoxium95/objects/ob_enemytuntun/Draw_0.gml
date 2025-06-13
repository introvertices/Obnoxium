draw_sprite(sp_enemy,image_index,x,y)

//draw_text_ext_color(x+sprite_width+5,y+sprite_height+3,string(enemyCreate),15,150,c_white,c_white,c_white,c_white,1)

// health bar
if (show_hp){
    
    draw_rectangle_color((x+centerPoint)-25,y-10,(x+centerPoint)+25,y-5,c_black,c_black,c_black,c_black,false)
    draw_rectangle_color((x+centerPoint)-25,y-10,((x+centerPoint)-25)+ hpPercent,y-5,c_red,c_red,c_red,c_red,false)
    
    draw_rectangle_color((x+centerPoint)-25,y-11,(x+centerPoint)+25,y-4,c_white,c_white,c_white,c_white,true)
}