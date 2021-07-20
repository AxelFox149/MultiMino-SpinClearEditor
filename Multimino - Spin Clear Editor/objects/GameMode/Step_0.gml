/// @description GameMode

if!(global.gameover or global.pause){

if(Top)
{
    GOType = 0
    GOSecuence()
}
switch(GMode)
{
    case 0:
        //Endless
        break;
    
    case 4:
        //Sprint
        if(lines >= 40)
        {
            GOType = 1
            GOSecuence()
        }
        break;
        
    case 6:
        //Survival
        var RND
        if(Timer <= 0) Timer = irandom_range(360,480)
        else if(!Control.update) Timer --
        
        if(Control.stage == 3) and InGarb != 0
        {
            Control.stage = 4

            RND = irandom(9)
            var i, j;
            for(j = 0; j < 10; j++)
            {
                if(instance_exists(Placed)) with(Placed) y -= 64
                
                for(i = 0; i <= 9; i++)
                {
                    if(i == RND) continue;
                    
                    with(instance_create(576 + i * 64, 1344,Placed))
                    {
                        CColor = 30
                        image_blend = ColorPal[CColor]
                    }
                }

                InGarb --
                if (InGarb == 0 or i == 9)
                {
                    ReadBoard(false)
                    break
                }
            }
        }
        
        if(Timer == 0)
        {
            if(lines <= 50)                  RND = irandom_range(1,2)
            if(lines <= 100 and lines > 50)  RND = irandom_range(1,3)
            if(lines <= 150 and lines > 100) RND = irandom_range(1,4)
            if(lines <= 200 and lines > 150) RND = irandom_range(2,4)
            if(lines > 200)                  RND = irandom_range(3,5)
            InGarb += RND;
            
        }
        break;
        
    case 5:
    case 7:
    case 9:
        //Time Based
        with(Control)
        {
            if(array_equals(Time,Zero) and !update) 
            {
                with(other) {GOType = 2; GOSecuence()}
            }
        }
        break;
    
    case 8:
        //Master
        if(lines >= 200)
        {
            GOType = 1
            GOSecuence()
        }
        break;
    
    case 11:
        break;
            
    default:
        //Marathon
        if(lines >= LevelCap * 10)
        {
            GOType = 1
            GOSecuence()
        }
        break;
        
}
}

///Spin Clear Game Mode

if!(global.gameover or global.pause) and GMode == 7{
    if!(Wait)
    {
            var i, str;
            with(Placed) y -= 64
            
            for(i = 0; i <= 9; i++)
            {
                str = SMat[Fila]
                
                if(string_char_at(str, (i * 2) + 1) == "0") continue
                
                with(instance_create(576 + i * 64, 1344,Placed))
                {
                    CColor = 30
                    image_blend = ColorPal[CColor]
                }
            }
        Fila ++
        
        if(Fila > 9)
        {
            Wait = true
            ReadBoard(false);
            instance_activate_object(Polyminoe)
            
            with(Control)
            {
                var i;
                
                repeat(5) ds_stack_push(Stack, 0)
                
                for(i = (string_length(other.SQueue)/3) - 1; i >= 0; i--)
                {
                    var num;
                    
                    num = real(string_char_at(other.SQueue, (i * 3) + 1) + string_char_at(other.SQueue, (i * 3) + 2))
                    
                    ds_stack_push(Stack, num)
                }
            
                Polyminoe.sprite_index = RndPiece()
                Polyminoe.image_index  = 0
        
                with(Polyminoe) if((sprite_index >= O and sprite_index < P_I) or (sprite_index >= D_I)) move_snap(64,64)
        
                for(i = 0; i <= 4; i++) Queue[i] = RndPiece()
            }
        }
    }
    else
    {
        if (instance_exists(Polyminoe) and Polyminoe.sprite_index == 0)
        {
            ComboArt.Counter   = -1
            Control.ComboCount = -1
            if(instance_exists(Placed))
            {
                with(Placed)
                {
                    if(!Vanish)
                    {
                        Vanish = true
                        Flash  = true
                        alpha  = 1
                        
                        with(ComboArt){
                            Miss = true
                            MissFrame = 0
                            DespVel = 0
                        }
                    }
                }
            }
            else
            {
                instance_deactivate_object(Polyminoe)
                Fila = 0
                Wait = false
                with(Control)
                {
                    ds_stack_clear(Stack)
                    if(!ComboArt.Miss)
                    {
                        Time[1] += 5
                        if(Time[1] >= 60) Time[0] ++
                        Clears ++
                    }
                }
            
                RndT = Boards[index]
                index = (index + 1) mod TotSize
                if(index == 0)CreateQueue()
                
                if(RndT == -1) RNDBoard()
                else
                {
                    ini_open("SpinClear_Def.ini")
                    var i, key;
                    for(i = 0; i <= 9; i++)
                    {
                        key = "SMat[" + string(RndT) + " , " + string(i) + "]"
                        SMat[i] = ini_read_string("SpinMatrix",key,"1 1 1 1 1 1 1 1 1 1")
                    }
                    key = "SQueue[" + string(RndT) + "]"
                    SQueue = ini_read_string("SpinQueue",key,"01 ")
                    ini_close()
                }
            }
        }
    }
}

///Editor Mode

if(GMode == 11 and instance_exists(Control))
{
    if(IsEdit)
    {
            CurX = max(floor(mouse_x / 64) * 64, 576);
            CurY = min(floor(mouse_y / 64) * 64,1344);
            
            var Izq = keyboard_check_pressed(vk_left)
            var Der = keyboard_check_pressed(vk_right)
            var Arr = keyboard_check_pressed(vk_up)
            var Aba = keyboard_check_pressed(vk_down)
            
            if(CurX > 1152) CurX = 1152
            if(CurY <  448) CurY =  448
    
            switch(mouse_button)
            {
                case mb_left:
                    if(place_free(CurX, CurY))
                    {
                        instance_create(CurX,CurY,Placed)
                        Box[(CurY - 448) / 64,(CurX - 576)/ 64] = 1
                    }
                    break
                    
                case mb_right:
                    var ToDes = instance_place(CurX, CurY, Placed);
                    
                    if(ToDes != noone)
                    {
                        instance_destroy(ToDes)
                        Box[(CurY - 448) / 64,(CurX - 576)/ 64] = 0
                    }
                    break
            }
            
            if(keyboard_check(vk_control))
            {
                if(keyboard_check_pressed(ord("S")) and instance_exists(Placed))
                {
                    if(file_exists("SavedBoard.sav")) file_delete("SavedBoard.sav")
                    
                    ini_open("SavedBoard.sav")
                    var i,j,s,p, WriteTo;
                    
                    if(SpinBoard != -1) WriteTo = SpinBoard
                    else                WriteTo = MaxBoard + 1
                    
                    s = ""
                    p = ""
                    for(i = 0; i < 9; i++)
                    {
                        if(PieceArr[i] < 10) p = "0" + string(PieceArr[i]) + " "
                        else                 p =       string(PieceArr[i]) + " "
                        
                        if(p == "00 ") break
                        
                        s = s + p
                    }
                    ini_write_string("SpinQueue", "SQueue[" + string(WriteTo) + "]",s)
                    
                    for(i = 14; i >= 5; i--)
                    {
                        s = ""
                        for(j = 0; j <= 9; j++)
                        {
                            s = s + string(Box[i, j])
                            
                            if(j != 9) s = s + " "
                        }
                        ini_write_string("SpinMatrix","SMat[" + string(WriteTo) + " , " + string(i - 5) + "]",s)
                    }
                    ini_close()
                    
                    SaveFlag = true
                    alarm_set(2, 90)
                }
                
                if(Arr or Aba or Der or Izq)
                {
                    if(instance_exists(Placed))
                    {
                        if(Arr) with(Placed)
                        {
                            y -= 64
                            if(y < 384) y+= 960
                        }
                        if(Aba) with(Placed)
                        {
                            y += 64
                            if(y > 1344) y-= 960
                        }
                        if(Der) with(Placed)
                        {
                            x += 64
                            if(x > 1152) x-= 640
                        }
                        if(Izq) with(Placed)
                        {
                            x -= 64
                            if(x < 576) x += 640
                        }
                        
                        for(i = 5; i <= 14; i++)
                        {
                            for(j = 0; j <= 9; j++)
                            {
                                CX = 576 + (j * 64)
                                CY = 448 + (i * 64)
                                if(place_free(CX,CY)) Box[i,j] = 0
                                else                  Box[i,j] = 1
                            }
                        }
                    }
                }
            }
            else
            {
                if(Izq) PieceArr[Pointer] = (PieceArr[Pointer] + 29) mod 30
                if(Der) PieceArr[Pointer] = (PieceArr[Pointer] + 31) mod 30
                if(Arr) Pointer = max(0, Pointer - 1)
                if(Aba) Pointer = min(8, Pointer + 1)
            }
            
            if(keyboard_check_pressed(ord("D")) or keyboard_check_pressed(ord("A")))
            {
                
                if(keyboard_key == ord("D")) SpinBoard = min(SpinBoard + 1, MaxBoard)
                if(keyboard_key == ord("A")) SpinBoard = max(SpinBoard - 1, -1)
                
                var i;
                
                for(i = 0; i <= 8; i++) PieceArr[i] = 0
                 
                instance_destroy(Placed)
                if(SpinBoard != -1)
                {
                    ini_open("SpinClear_Def.ini")
                    var j, str, num;
                    for(j = 0; j <= 9; j++)
                    {
                        str = ini_read_string("SpinMatrix","SMat[" + string(SpinBoard) +  " , " + string(j) + "]", "1 1 1 1 1 1 1 1 1 1")
                        for(i = 0; i <= 9; i++)
                        {
                            if(string_char_at(str, (i * 2) + 1) == "0") continue
                            
                            instance_create(576 + i * 64, 768 + (64 * j),Placed)
                        }
                    }
                    str = ini_read_string("SpinQueue","SQueue[" + string(SpinBoard) + "]", "01 ")
                    for(i = (string_length(str)/3) - 1; i >= 0; i--)
                    {
                        num = real(string_char_at(str, (i * 3) + 1) + string_char_at(str, (i * 3) + 2))
                        
                        PieceArr[i] = num
                    }
                    ini_close()
                }
                for(i = 0; i <= 14; i++)
                {
                    for(j = 0; j <= 9; j++)
                    {
                        CX = 576 + (j * 64)
                        CY = 448 + (i * 64)
                        if(place_free(CX,CY)) Box[i,j] = 0
                        else                  Box[i,j] = 1
                    }
                }
            }
            
            if(keyboard_check_pressed(vk_enter))
            {
                instance_activate_object(Polyminoe)
                with(Control)
                {
                    ReadBoard(true)
                    var i;
                    repeat(6) ds_stack_push(Stack, 0)
                    for(i = 0; i <= 8; i++) ds_stack_push(Stack,other.PieceArr[8 - i])
                    Polyminoe.sprite_index = RndPiece()
                    for(i = 0; i <= 4; i++) Queue[i] = RndPiece()      
                    Hold = 0
                    CH   = true
                    Time[0] = 0
                    Time[1] = 0
                    Time[2] = 0
                }
                with(Polyminoe)
                {
                    x = 864
                    y = 96
                    image_index = 0
                    alarm[0]    = -1
                    MoveTimer   = 1
                    ML          = 15
                    PlaceTimer  = ResetTime
                    
                    Drop = false
                    
                    BC = 255 - PlaceTimer * 4
                    if((sprite_index >= O and sprite_index < P_I) or (sprite_index >= D_I)) move_snap(64,64)
                }
                lines = 0
                IsEdit = false
            }
        }
        else
        {
            if(keyboard_check_pressed(vk_backspace))
            {
                if(!instance_exists(Polyminoe)) instance_activate_object(Polyminoe)
                Polyminoe.sprite_index = 0
                instance_deactivate_object(Polyminoe)
                instance_destroy(Placed)
                ComboArt.Counter = -1
                with(Control)
                {
                    ComboCount = -1
                    stage      =  2
                    n          =  0
                    ds_stack_clear(Stack)
                    var i, j;
                    for(i = 0; i <= 4; i++) Queue[i] = 0
                    
                    for(i = 0; i < 40; i++)
                    {
                        for(j = 0; j < 10; j++)
                        {
                            if(i > 24) board[i,j] = other.Box[(i - 25),j] * 30
                            else       board[i,j] = 0
                        }
                    }
                }
                /*
                var i, j, CX, CY;
                for(i = 0; i < 15; i++)
                {
                    for(j = 0; j < 10; j++)
                    {
                        CX = 576 + (j * 64)
                        CY = 448 + (i * 64)
                        if(Box[i,j]) instance_create(CX, CY, Placed)
                    }
                }*/
                IsEdit = true
            }
        }
}

/* */
/*  */
