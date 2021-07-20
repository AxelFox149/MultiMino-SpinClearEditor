/// @description Movimiento por el menu

var Up   = keyboard_check_pressed(vk_up);
var Down = keyboard_check_pressed(vk_down);

if(PixelFade != 0)
{
    Up   = 0
    Down = 0
}

switch(Sel)
{
    case 0:
        MaxPos = 2
        break;
    
    case 1:
        MaxPos = 6
        MaxSec = 3
        break;
    
    case 2:
        MaxPos = 6
        MaxSec = 9
        break;
}

if(!Second)
{
    if(Up and Pos != 0)
    {
        Frame = 0
        Pos --
    }
    if(Down and Pos != MaxPos)
    {
        Frame = 0
        Pos ++
    }
}
else if(!Third)
{
    if(!Wait)
    {
        if(Up   and SecPos != 0) SecPos --
        if(Down and SecPos != MaxSec) SecPos ++
        
        
        if(GMode != 0 and SecPos < 2) SecPos = 2
    }
    else if(Sel == 1)
    {
        if(Up   and Value[SecPos] != 0)Value[SecPos] --
        switch(SecPos)
        {
            case 2:
                if(Down and Value[2] != 2)Value[2] ++
                break
                
            case 3:
                break
                
            default:
                if(Down and Value[SecPos] != 3)Value[SecPos] ++
                break
        }
    }
    else
    {
        if(Up)  Options[Pos] --
        if(Down)Options[Pos] ++
        
        switch(Pos)
        {
            case 1:
                Options[1] = (Options[1] + sprite_get_number(Point)) mod sprite_get_number(Point)
                break;
                
            case 6:
                if(Up)  Options[Pos] += 6
                if(Down)Options[Pos] -= 6
                
                if(Options[6] > 100) Options[6] = 100
                if(Options[6] < 0  ) Options[6] = 0
                
                audio_master_gain(Options[6]/100)
                break;
            
            default:
                Options[Pos] = (Options[Pos] + 2) mod 2
                break;
        }
    }
}

if(Third)
{
    if!(KeyWait)
    {
        if(Up   and SecPos != 0) SecPos --
        if(Down and SecPos != 8) SecPos ++
    }
    else if (keyboard_check_pressed(vk_anykey) and !(keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_escape)))
    {
        CurrentButtons[SecPos] = keyboard_lastkey
        KeyWait = false
    }

    if(array_equals(CurrentButtons, Buttons)) Options[3] = 0
    else Options[3] = 1
}

