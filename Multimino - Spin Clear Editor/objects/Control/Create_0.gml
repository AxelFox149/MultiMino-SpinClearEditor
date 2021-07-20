/// @description Inicializacion

if(GMode == 9)
{
    BoardStart = 768
    BoardWidth = 3
}
else
{
    BoardStart = 576
    BoardWidth = 9
}

var i,j

for(i = 0; i <= 39; i++)
{
    for(j = 0; j <= BoardWidth; j++)
    {
        board[i,j] = 0
    }
}

ComboDraw  = false
Hold       = Point
CH         = true
update     = false
stage      = 0
n          = 0
BTB        = 1
PSpin      = false
Mini       = false
Super      = false
frame      = -0.15
Bonus      = false
ComboCount = -1
AC         = false
Time       = array_create(3)
Zero       = array_create(3)

if(GMode == 5) Time[0] = 3
if(GMode == 7) Time[0] = 2
if(GMode == 9)
{
    Time[0] = 1
    instance_create(832,1280,Placed)
    instance_create(768,1280,Placed)
    instance_create(768,1344,Placed)
}

if(Time[0] != 0) Dec = true
else             Dec = false

Stack   = ds_stack_create()
Queue   = array_create(5)
NState  = 0
DASLoad = false

CShift = $FFFFFF

if(instance_exists(Placed)) ReadBoard(true);

if(GMode != 7 and GMode != 11)
{
    Polyminoe.sprite_index = RndPiece()
    
    with(Polyminoe) if((sprite_index >= O and sprite_index < P_I) or (sprite_index >= D_I)) move_snap(64,64)
    
    for(i = 0; i <= 4; i++) Queue[i] = RndPiece()
}
else
{
    instance_deactivate_object(Polyminoe)
    Clears = 0
}

draw_set_font(Console)
draw_set_colour(c_white)


//--------------------------------

EText[0,0] = "Next"
EText[0,1] = "Siguiente"

EText[1,0] = "Hold"
EText[1,1] = "Reserva"

EText[2,0] = "Score:"
EText[2,1] = "Puntaje:"

EText[3,0] = "Level:"
EText[3,1] = "Nivel:"

EText[4,0] = "Lines:"
EText[4,1] = "Líneas:"

EText[5,0] = "Time:"
EText[5,1] = "Tiempo:"

