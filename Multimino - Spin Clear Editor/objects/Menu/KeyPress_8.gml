/// @description Cancel
if(PixelFade == 0){
if(!Second)
{
    if(Sel != 0 and Sel != 2) Sel --
    else Sel = 0

    Pos = 0
}
if(Third) Third = false
if(Wait and Sel == 2)
{
    Wait = false
    ConfigWrite()
}
if(Second and !Wait)  Second = false
if(Wait)                Wait = false

if(KeyWait) KeyWait = false
}

