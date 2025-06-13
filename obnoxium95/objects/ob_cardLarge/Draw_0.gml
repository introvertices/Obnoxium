draw_sprite_ext(sp_cardLarge,-1,x,y,1,1,image_angle,c_white,burnalpha)


if (image_index >= 8){
    draw_sprite_ext(sp_cardLargeNumbers,cardnum,x,y,1,1,image_angle,c_white,burnalpha)
    draw_sprite_ext(sp_cardLargeSymbols,cardsymbol-1,x,y,1,1,image_angle,c_white,burnalpha)
}


