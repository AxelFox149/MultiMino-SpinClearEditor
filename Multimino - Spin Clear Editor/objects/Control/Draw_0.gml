/// @description Animacion de limpieza

if(stage == 1)
{
    if (n == 0) stage ++
    
    if(frame <= 6 and frame >= 0)
    {
        var i
        
        for(i = 0; i < n; i++)
        {
            switch(Options[4])
            {
                case 0:
                    if(frame >= 4.5) instance_deactivate_region(BoardStart,(LC[i]* 64) - 1152,64 * BoardWidth,62,true,true)
                    draw_sprite_part(ClearLines,floor(frame),0,0,64 * (BoardWidth + 1), 64,BoardStart,(LC[i]* 64) - 1152)
                    break
                
                case 1:
                    if(frame >= 1) instance_deactivate_region(BoardStart,(LC[i]* 64) - 1152,64 * BoardWidth,62,true,true)
                    draw_sprite_part(ShortLC,floor(frame),0,0,64 * (BoardWidth + 1), 64,BoardStart,(LC[i]* 64) - 1152)
            }
        }
    }
    if(!global.pause){
        if(Options[4] == 0)frame += 0.09
        else frame += 0.25
    }
    if(frame >= 7) stage ++
}

///Fila, estadisticas

if(GMode != 11 or !GameMode.IsEdit){
    if !(global.pause or global.gameover)
    {
        if!(Dec){
            Time[2] ++
            
            if(Time[2] >= 60) Time[1] ++
            if(Time[1] >= 60) Time[0] ++
        }
        else
        {
            if(stage != 1) Time[2] --
            
            if(Time[2] < 0) Time[1] --
            if(Time[1] < 0) Time[0] --
        }
        
        Time[0] = (Time[0] + 60) mod 60
        Time[1] = (Time[1] + 60) mod 60
        Time[2] = (Time[2] + 60) mod 60
    }
    
    var i;
    DrawPiece(Queue[0], 1536 + ComboArt.CurrentVel, 195 + ComboArt.VerVel, NState, 1.5, 1.5, 1, 0)
    
    for(i = 1; i < 5; i++) DrawPiece(Queue[i], 1536 + ComboArt.CurrentVel, 220 + (i * 156) + ComboArt.VerVel, 0, 1.5, 1.5, 1, 0)
    
    if(Hold != Point) DrawPiece(Hold, 256 + ComboArt.CurrentVel, 195 + ComboArt.VerVel, 0, 1.5, 1.5, 1, 0)
    
    draw_set_halign(fa_center)
    draw_text(1536,32,string_hash_to_newline(EText[0,Options[2]]))
    draw_text(256,32, string_hash_to_newline(EText[1,Options[2]]))
    draw_set_halign(fa_left)
    
    draw_text(1408,942,string_hash_to_newline(EText[2,Options[2]]))
    draw_text(1408,1002, string_hash_to_newline(score))
    
    
    switch(GMode)
    {
        case 7:
            draw_text(1408,1086,string_hash_to_newline("All Clears: "))
            draw_text(1408,1146, string_hash_to_newline(Clears))
            break
        
        case 8:
            draw_text(1408,1086,string_hash_to_newline(EText[3,Options[2]]))
            draw_text(1408,1146, string_hash_to_newline("M" + string(level - 15)))
            break
            
        default:
            draw_text(1408,1086,string_hash_to_newline(EText[3,Options[2]]))
            draw_text(1408,1146, string_hash_to_newline(level))
            break
    }
    
    draw_text(1408,1230, string_hash_to_newline(EText[4,Options[2]]))
    draw_text(1408,1290, string_hash_to_newline(lines))
    
    var TM = array_create(4);
    
    for(i = 2; i >= 0; i--)
    {
        if(Time[i] < 10) TM[i] = "0" + string(Time[i])
        else TM[i] = string(Time[i])
    }
    TM[3] = string(TM[0] + ":" + TM[1] + "." + TM[2])
    
    draw_text(1408,1374,string_hash_to_newline(EText[5,Options[2]]))
    
    if(Dec and (Time[0] == 0 and Time[1] <= 10)) draw_text_colour(1408,1422,string_hash_to_newline(TM[3]),c_red,c_red,c_red,c_red,1)
    else draw_text(1408,1434,string_hash_to_newline(TM[3]))
}

