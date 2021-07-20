/// @description Control de sprites

draw_set_font(Console_Title)
draw_set_halign(fa_center)
if(Sel == 0) draw_self()
if(Sel == 1)
{
    draw_sprite_ext(GradBox_spr,0,256,128,8,8,0,c_white,1)
    draw_text(room_width/2,149,string_hash_to_newline(MenuText[9,Options[2]]))
}
draw_set_halign(fa_left)

var i, Start, An, Color;
    
Start = (room_height - (136 * (MaxPos + 1)))/2
    
for(i = 0; i <= MaxPos; i++)
{
    if(i == Pos)
    {
        Vel[i] = AcceleScr(Vel[i], 96, 8.5 - abs(Vel[i] * 9/96))
        Frame += 0.125
        An = Frame mod 8
        Color = $ffffff
    }
    else
    {
        Vel[i] = AcceleScr(Vel[i], 0, 9 - abs(Vel[i] * 8.5/96))
        An = 0
        Color = $606060
    }
    
    draw_sprite_ext(OptionSpr, 0, Vel[i] + 32, Start + (136 * i) + 32,8,8,0,c_black,1)
    draw_sprite_ext(OptionSpr, 0, Vel[i], Start + (136 * i),8,8,0,Color,1)
    draw_text_colour(Vel[i] + 24, Start + (136 * i) + 18, string_hash_to_newline(Texto[Sel + (3 * Options[2]), i]),Color,Color,Color,Color,1)
    
    if(Sel == 2)
    {
        draw_sprite_ext(ValWin_spr, 0, Vel[i] + 504, Start + (136 * i) + 32, 8, 8, 0, c_black, 1)
        draw_sprite_ext(ValWin_spr, 0, Vel[i] + 472, Start + (136 * i), 8, 8, 0, Color, 1)
        
        if(i == 1) draw_sprite_ext(Point, Options[1], Vel[i] + 544, Start + (136 * i) + 28, 2, 2, 0, Color, 1)
        else{
            draw_set_halign(fa_center)
            if(i != 6) draw_text_colour(Vel[i] + 584, Start + (136 * i) + 32, string_hash_to_newline(MenuText[i, Options[i]]),Color,Color,Color,Color,1)
            else draw_text_colour(Vel[i] + 584, Start + (136 * i) + 32, string_hash_to_newline(Options[i]),Color,Color,Color,Color,1)
            draw_set_halign(fa_left)
        }
        
        if(Wait and i != 3 and i == Pos) draw_sprite_ext(Scroll_spr, 0, Vel[i] + 688, Start + (136 * i), 8, 8, 0, Color, 1)
    }
    
    if(Sel == 1)
    {
        draw_sprite_ext(Flag_spr + i, An, 512 + Vel[i], Start + (136 * i) + 24, 8, 8, 0, c_black, 1)
        draw_sprite_ext(Flag_spr + i, An, 480 + Vel[i], Start + (136 * i) - 8, 8, 8, 0, Color, 1)
    }
}

if(Second and Sel == 1)
{
    ArFrame = ArFrame + 0.1
    if(Wait)             ArFrame = 4
    else if(ArFrame > 3) ArFrame = 0
    
    
    
    for(i = 0; i <= 3; i++)
    {
        if(GMode != 0 and i < 2) continue    
    
        if(i == 0 or i == 1) An = 8 * Value[i]
        if(i == 2)           An = 7 * Value[i]
        if(i == 3)           An = 0
        
        FLoc[i] = AcceleScr(FLoc[i], An, 1)
        
        if(i == SecPos) draw_sprite(SArrow,ArFrame,804, 550 + (128 * i))
        
        draw_sprite_ext(LineRoll_spr + i,FLoc[i],900, 550 + (128 * i), 8, 8, 0, c_white,1)
    }
    if(GMode == 0)
    {
        draw_set_valign(fa_center)
        if(!Options[2]){
            draw_text(1084, 560, string_hash_to_newline("Lines"))
            draw_text(1084, 688, string_hash_to_newline("Level Cap"))
        }
        else
        {
            draw_text(1084, 560, string_hash_to_newline("Líneas"))
            draw_text(1084, 688, string_hash_to_newline("Nivel Tope"))
        }
        draw_set_valign(fa_top)
    }
}

if(Third)
{
    var KeyChar;
    
    for(i = 0; i < 9; i++)
    {
        if(i < 8)
        {
            if     (CurrentButtons[i] == 162) KeyChar = "Left ctrl"
            else if(CurrentButtons[i] == 163) KeyChar = "Right ctrl"
            else if(CurrentButtons[i] == 164) KeyChar = "Alt"
            else if(CurrentButtons[i] == 165) KeyChar = "Alt gr"
            else if(CurrentButtons[i] == 16)  KeyChar = "Shift"
            else if(CurrentButtons[i] == 32)  KeyChar = "Space"
            else if(CurrentButtons[i] == 38)  KeyChar = "Up    Arrow"
            else if(CurrentButtons[i] == 40)  KeyChar = "Down  Arrow"
            else if(CurrentButtons[i] == 37)  KeyChar = "Left  Arrow"
            else if(CurrentButtons[i] == 39)  KeyChar = "Right Arrow"
            else KeyChar = chr(CurrentButtons[i])
        }
        else KeyChar = " "
        
        draw_text(850,  304 + (96 * i), string_hash_to_newline(Keys[Options[2], i]))
        draw_text(1350, 304 + (96 * i), string_hash_to_newline(KeyChar))
        if(i == SecPos) draw_sprite(SArrow,0 + (4 * KeyWait),780, 328 + (96 * i))
    }
}

///Texto
draw_set_font(Console)
draw_text(room_width - 128,room_height - 64,string_hash_to_newline("v 1.0"))
draw_set_halign(fa_center)
if(!Second)
{
    //if(Sel < 2)  
    draw_text_ext(room_width/2, 1280, string_hash_to_newline(Desc[Sel + (4 * Options[2]),Pos]), 55, 1600)
    //if(Sel == 2) draw_text_ext((3 * room_width)/4 - 120, 1250, Desc[Sel + (4 * Options[2]),Pos], 52, 1000)
}
else if (Sel == 1)
{
    draw_text_ext(room_width/2, 1280, string_hash_to_newline(Desc[3 + (4 * Options[2]),SecPos]), 55, 1600)
}

///BlackScreen

if(PixelFade != 0)
{
    draw_sprite_tiled(Gradient_spr,frame,0,0)
    
    frame += 0.35 * PixelFade
    
    if(frame >= 8 and PixelFade == 1) room_goto(Tablero)
    if(frame <= 0 and PixelFade == -1) PixelFade = 0
}

