/// @description Dibuja los sprites de GameOver

if(global.gameover){
    if(alarm_get(0) < 0)
    {
        draw_sprite_ext(SwitchType, GOType, room_width/2, room_height/2,8,8,0,c_white,1)
        if(alarm_get(1) < 0) alarm[1] = 60
    }
    DrawPiece(LS, LX, LY, LP, 2, 2, 1, 0)
}



///Garbage bar

if(GMode == 6 and !global.gameover and depth == -5)
{
    //draw_rectangle_colour(528,1408,550,BarSize,c_yellow,c_yellow,c_red,c_red,false)
    
    //136
    
    draw_sprite_ext(Meter_spr,0,528,128,8,8,0,c_white,1)
    draw_rectangle_colour(528,128,552,1408 - (InGarb*64),c_black,c_black,c_black,c_black,false)
    /*draw_sprite_part_ext(Meter_spr,0,0,BarSize,3,160 - BarSize,528,BarPos,8,8,c_white,1)
    
    if(BarSize < 160 - (InGarb*8)) BarSize +=2
    if(BarSize > 160 - (InGarb*8)) BarSize -=2
    
    if(BarPos  < 1408 - (InGarb*64)) BarPos += 16
    if(BarPos  > 1408 - (InGarb*64)) BarPos -= 16
    */
}

/* */
///Desvanecimiento

if(Fade != 0)
{
    draw_sprite_tiled(Gradient_spr,Alpha,0,0)
    
    if(Alpha >= 8 and Fade == 1)
    {
        VarReset()
        room_goto(Title)
    }
    else if(Alpha <= 0 and Fade == -1)
    {
        Fade = 0
        if(GMode != 11) instance_activate_object(Polyminoe)
        instance_activate_object(Control)
        instance_activate_object(ComboArt)
        depth = -5
        global.pause = false
    }
    Alpha += 0.35 * Fade
}

/* */
///Sprites en editor

if(GMode == 11 and instance_exists(Control))
{
    draw_line(576,768,1216,768)
    draw_set_halign(fa_center)
    if(IsEdit)
    {
        draw_sprite_ext(Point, Options[1], CurX, CurY, 2, 2, 0, ColorPal[31], .5)
        draw_text(256,320, string_hash_to_newline("EDIT MODE"))
        
        if(OSpin) draw_text(256, 256, string_hash_to_newline("O-Spin: true"))
        else      draw_text(256, 256, string_hash_to_newline("O-Spin: false"))
        
        draw_sprite_ext(SArrow,0,1728,179 + (156 * Pointer),-1,1,0,c_white,1)
        var i,j;
        for(i = 0; i < 9; i++) DrawPiece(PieceArr[i], 1536, 185 + (i * 156), 0, 1.5, 1.5, 1, 0)
    }
    else draw_text(256,320, string_hash_to_newline("TEST MODE"))
    
    if(SpinBoard != -1) draw_text(256, 384, string_hash_to_newline("Spin Board: " + string(SpinBoard)))
    draw_set_halign(fa_left)
    
    if(SaveFlag) draw_text(640, 64, string_hash_to_newline("SPIN BOARD SAVED"))
}

/* */
///Debug stuff

if(GMode == 7)
{
    var i, YCor;
    for(i = 0; i < array_length_1d(Boards); i++)
    {
        YCor = 32 + (38 * i)
        if(Boards[i] = -1)  draw_set_colour(c_red)
        if(i == (index - 1))draw_set_colour(c_green)
        
        if(YCor < 1472) draw_text(32,  YCor, string_hash_to_newline(Boards[i]))
        else            draw_text(384, YCor - 1440, string_hash_to_newline(Boards[i]))
        draw_set_colour(c_white)
    }
    
    
}

/* */
/*  */
