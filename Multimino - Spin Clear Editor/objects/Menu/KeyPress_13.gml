/// @description Selector
if(PixelFade == 0){
if(!Second){
    switch(Sel)
    {
        case 0:
            switch(Pos)
            {
                case 0:
                    Sel = 1;
                    break;
                
                case 1:
                    Sel = 2;
                    break;
                
                case 2:
                    game_end()
                    break;
            }
            Pos = 0
            break;
            
        case 1:
            GMode = Pos
            Second = true
            SecPos = 0
            
            if(Pos == 4 or Pos == 6)
            {
                LB        = 1
                UB        = 7
                TP        = 7
                GMode    += 3
                Second    = false
                PixelFade = 1
            }
            break;
        
        case 2:
            Second = true
            Wait = true
            SecPos = 0
            break;
    }
}
else if(Sel == 1)
{
    if(SecPos == 3)
    {
        switch(Value[2])
        {
            case 0:
                LB = 1;
                UB = 7;
                TP = 7;
                break;
            
            case 1:
                LB = 8;
                UB = 25;
                TP = 18;
                break;
            
            case 2:
                LB = 1;
                UB = 29;
                TP = 29;
                break;
        }
        
        if(GMode == 0) GMode = Value[0]
        else GMode += 3
        
        if(Value[1] == 0) LevelCap = 1
        if(Value[1] == 1) LevelCap = 15
        if(Value[1] == 2) LevelCap = 20
        if(Value[1] == 3) LevelCap = 30
        
        PixelFade = 1
    }
    else Wait = true
}

if(Third)
{
    if(SecPos != 8) KeyWait = !KeyWait
    else array_copy(CurrentButtons, 0, Buttons, 0, 9)
}

if(Sel == 2 and Pos == 3 and !Third)
{
    Third  = true
    SecPos = 0
}
}

