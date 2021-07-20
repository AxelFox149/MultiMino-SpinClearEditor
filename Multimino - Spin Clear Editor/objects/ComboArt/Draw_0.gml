/// @description Bonificaciones
if(ComboDraw)
{
    if(BTB and n!= 0)
    {
        draw_sprite_ext(BackToBack,BTFrame,256,892,Scale,Scale,0,c_white,1)
        if(BTFrame >= 17) BTFrame = 10
        if!(global.pause) BTFrame += 0.5
    }
    if(n == 4 and !PSpin) draw_sprite_ext(ATetris, TrisFrame,256,1000,Scale,Scale,0,c_white,1)
    if(n == 5 and !PSpin) draw_sprite_ext(APentris,TrisFrame,256,1000,Scale,Scale,0,c_white,1)
    
    if(Mini)       draw_sprite_ext(MiniAn ,SpinFrame,256,974,Scale,Scale,0,c_white,1)
    else if(Super) draw_sprite_ext(SuperAn,SpinFrame,256,974,Scale,Scale,0,c_white,1)
    
    if(PSpin){
                       draw_sprite_ext(SpriteAn,SpinFrame,256,1024, Scale, Scale,0,c_white,1)
                       draw_sprite_ext(Letters ,LettFrame,148,1024, Scale, Scale,0,c_white,1)
        if(n == 4)     draw_sprite_ext(ATetris ,SpinFrame,256,1115, Scale, Scale,0,c_white,1)
        else if(n > 0) draw_sprite_ext(SDT,     n - 1,    256,1110, Scale, Scale,0,c_white,1)
    }
    
    if!(global.pause)
    {
        if(SpinFrame <= 16)            SpinFrame += 0.5
        if(LettFrame <= (12 * LP) - 1) LettFrame += 0.5
        
        if(TrisFrame <= 18)            TrisFrame += 0.5
        else                           TrisFrame  = 16
    }
    else alarm_set(0, AlarmHold)
}

if(GMode == 7) draw_sprite_ext(CantHold,0,256 + CurrentVel,195,2,2,0,c_white,1)

///Display de Combo

if(Counter > 0)
{
    draw_sprite_ext(ComboAn,ComboFrame,256,824,Scale,Scale,0,c_white,1)
    draw_set_font(ComboNum)
    draw_text(326, 824, string_hash_to_newline(Counter))
    draw_set_font(Console)
    if(ComboFrame < 3.5) ComboFrame += 0.5
}

///Pausa y Modo de juego

if(global.pause)
{
    draw_sprite_ext(PauseAn,PauseFrame,256,448,4 * 1.25,4 * 1.25,0,c_white,1)
    
    PauseFrame += 0.2
    
    if(PauseFrame > 15) PauseFrame = 0
}

draw_sprite_ext(ModeSprite,GMode,256,695,6,6,0,c_white,1)

///Missed Spin

if(Miss){
    draw_sprite_ext(Missed,floor(MissFrame),896, 320, 8, 8, 0, c_white, 1)
    
    if!(global.pause)
    {
        if(DespVel < 8 or DespVel > 52) MissFrame += 0.5
        DespVel ++
    }
    
    if(MissFrame > 7)
    {
        Miss = false
        MissFrame = 0
        DespVel = 0
    }
}

///Perfect Clear

if(AC)
{
    draw_sprite_ext(AllClear,ACFrame,896,320,8 * (1 + SizeCount),8 * (1 + SizeCount),0,c_white,1)
    
    if!(global.pause)
    {
        if(ACCounter < 8 or ACCounter > 82) ACFrame += 0.5
        ACCounter ++
        if(ACCounter mod 6 == 0)SizeCount += 0.013
    }
    
    if(ACCounter > 90)
    {
        AC = false
        ACCounter = 0
        ACFrame   = 0
        SizeCount = 0
    }
}

