/// @description Movimiento horizontal y rotacion
if!(global.pause or global.gameover) and sprite_index != 0
{
var Izq, Der, RotR, RotL, Derh, Izqh, DRot

Derh =  keyboard_check(CurrentButtons[3])
Izqh = -keyboard_check(CurrentButtons[2])

Der =  keyboard_check_pressed(CurrentButtons[3])
Izq = -keyboard_check_pressed(CurrentButtons[2])

RotR=  keyboard_check_pressed(CurrentButtons[0])
RotL= -keyboard_check_pressed(CurrentButtons[6])
DRot=  keyboard_check_pressed(CurrentButtons[7])

Move = Izq + Der
Dir  = Izqh+ Derh

if (Dir != 0)
{
    if(alarm_get(1) < 0) alarm_set(1, 12)
    if(DAS) MoveTimer = (MoveTimer + 1) mod 3
}
else
{
    MoveTimer = 1
    DAS = false
    alarm[1] = -1
}
if(MoveTimer == 2) CM = true
else               CM = false
    
if((Move != 0 or CM) and !Control.update)
{
    x +=(64 * Dir)
    if(place_meeting(x, y, Wall) or place_meeting(x, y, Placed)) x -=(64 * Dir)
    else
    {
        if(ML != 0 and PlaceTimer != ResetTime)
        {
            PlaceTimer = ResetTime
            ML --
        }
        
        Control.PSpin = false
    }
}
Spin = RotR + RotL

if(Spin != 0 or DRot)
{
    if(DRot)                    DRSOffset()
    else if(sprite_index <= I)  SRSOffset()
    else if(sprite_index <= P_X)PERSOffset()
    else                        MDTRSOffset()
    
    if(SpinDetection())
    {
        Control.PSpin = true
        
        if(DRot)
        {
            Control.Super = true
            Control.Mini  = false
        }
        else Control.Super = false
    }
    
    if(ML != 0 and ST and PlaceTimer != ResetTime)
    {
        PlaceTimer = ResetTime
        ML --
    }
}
}

///Gravedad y drop
if !(global.pause or global.gameover) and sprite_index != 0
{

Down = keyboard_check(CurrentButtons[1])
Drop = keyboard_check_pressed(CurrentButtons[5])


if(level >= 20)
{
    Tic = 0
    ResetTime = 30 - ((level - 20) * 1.5)
    
    if(GMode == 8 and level >= 35) ResetTime = 13 
    else if(ResetTime < 15)        ResetTime = 15
}
else Tic = power(0.8 - ((level - 1) * 0.007), level - 1) * 60

if(keyboard_check_pressed(CurrentButtons[1])) alarm[0] = 5

if(Down) Tic = min(1, Tic)

if((alarm_get(0) < 0) and (floor(Tic) > 0)) alarm_set(0, floor(Tic))
else if(floor(Tic) < 1)
{
    var i;
    
    if(level >= 20) Tic = 20
    else Tic = power(Tic, -1)
    
    for(i = 0; i <= Tic; i++)
    {
        y += 64

        if(place_meeting(x,y,Wall) or place_meeting(x,y,Placed))
        {
            y -= 64
            break
        }
        else Control.PSpin = false
    }
}

if(Drop)
{
    var LeftBound, RightBound, i,j;
    
    for(i = 0; i<= 9; i++)
    {
        if(collision_rectangle(576 + i*64,bbox_top,640 + i*64,bbox_bottom,Polyminoe,true,false) != noone) 
        {
            LeftBound = (576 + i*64) + 48
            break
        }
    }
    for(i = 0; i<= 9; i++)
    {
        if(collision_rectangle(1216 - i*64,bbox_top,1152 - i*64,bbox_bottom,Polyminoe,true,false) != noone) 
        {
            RightBound = (1216 - i*64) - 48
            break
        }
    }
    
    while(true)
    {
        part_emitter_region(HardDrop,DropEmm,LeftBound,RightBound,y,y-32,ps_shape_rectangle,ps_distr_linear)
        y += 64
        if(place_meeting(x,y,Wall) or place_meeting(x,y,Placed))
        {
            y -= 64
            Control.update = true
            audio_play_sound(Droped,10,false)
            break
        }
        else part_emitter_burst(HardDrop,DropEmm,p_Spark,-2)
        score += 2 * level
    }
}

if(!place_free(x,y + 64)) PlaceTimer --

    if(PlaceTimer <= 0)
    {
        Control.update = true
        audio_play_sound(Droped,10,false)
    }
}

