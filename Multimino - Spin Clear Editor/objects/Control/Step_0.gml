/// @description Creacion de lineas
if(update and stage == 0)
{
    var i, j, line
    
    for(i = 0; i <= 39; i++)
    {
        line = true
        for(j = 0; j <= BoardWidth; j++)
        {
            XOff = BoardStart + (64 * j)
            YOff =      -1152 + (64 * i)
            if(place_meeting(XOff, YOff,Polyminoe))
            {
                board[i,j] = Polyminoe.sprite_index
                instance_create(XOff, YOff, Placed)
            }
            if(board[i,j] = 0) line = false
        }
        if(line)
        {
            LC[n] = i
            n++
        }
    }
    if(n != 0)
    { 
        ComboCount += 1
        
        if(PSpin)       audio_play_sound(SpinClear,10,false)
        else if(n >= 4) audio_play_sound(Tetris,10,false)
        else            audio_play_sound(LineClear,10,false)
        
        if((BTB != 1) and (n >= 4 or PSpin)) Bonus = true
        else Bonus = false

        if(n < 4 and !PSpin) BTB = 1
        else                 BTB = 1.5
        
        for(i = 0; i < n; i++) instance_deactivate_region(576,(LC[i]* 64) - 1152,638,62,true,true)
        
        if(instance_exists(Placed)) AC = false
        else AC = true
        
        instance_activate_object(Polyminoe)
		instance_activate_object(Wall)
        
        if(GMode == 6)
        {
            var LineReturn;
            
            LineReturn  = GameMode.GarbageSend[!Mini and PSpin, n] + real(Bonus)
            LineReturn += GameMode.ComboSend[abs(ComboCount)]
            GameMode.InGarb = max(0, GameMode.InGarb - LineReturn)
        }
    }
    else    ComboCount = -1
    
    if(Super) Mini = false
    stage ++
    
    with(ComboArt)
    {
        Counter    = other.ComboCount
        ComboFrame = 0
    }
    
    if(n >= 4 or PSpin or AC)
    {
        with(ComboArt)
        {
            n     = other.n
            PSpin = other.PSpin
            Mini  = other.Mini
            Super = other.Super
            BTB   = other.Bonus
            LP    = Polyminoe.sprite_index
            
            
            LettFrame = (LP - 1) * 12
            SpinFrame = 0
            BTFrame   = 0
            TrisFrame = 0
            
            if(other.AC)
            {
                AC        = true
                ACFrame   = 0
                ACCounter = 0
            }
            
            ComboDraw = true
            alarm[0] = 90
        }
    }
    else if(GMode == 7) Polyminoe.sprite_index = 0
    
    instance_deactivate_object(Polyminoe)
}

///IRS

if(update)
{
    var RLeft = keyboard_check_pressed(ord("X"));
    var RRight= keyboard_check_pressed(vk_up);
    var Charge= keyboard_check(vk_right) xor keyboard_check(vk_left)
    
    if(RLeft) NState --
    if(RRight)NState ++
    
    if(NState < 0) NState += 4
    if(NState > 3) NState -= 4
    
    if(Charge){if(alarm_get(0) < 0) alarm[0] = 12}
    else {alarm[0] = -1; DASLoad = false}
}

///Reset
if(stage == 2)
{
    var i, temp;
    
    ClearBoard()
    SetScore()
    lines += n
    
    temp = floor(lines / 10) + 1
    if(GMode == 8) temp += 15
    
    if(level < temp) level = temp
    if(level > LevelCap) level = LevelCap
    
    PSpin = false
    Mini  = false   
    Super = false
    AC    = false
    
    update = false
    stage  = 3
    frame  = -0.15
    CH     = true

    alarm[1] = 5
    
    
    if(!Warning and collision_line(576, 352, 1216, 352, Placed, false, true))
    {
        Warning = true
        audio_play_sound(WarningSound,10,false)
    }
    else if( Warning and !collision_line(576, 480, 1216, 480, Placed, false, true)) Warning = false
}

///Warning state

if(Warning and CShift != $0000FF)
{
    CShift -= $111100
    TilesColour(CShift)
}
if(!Warning and CShift != $FFFFFF)
{
    CShift += $111100
    TilesColour(CShift)
}


