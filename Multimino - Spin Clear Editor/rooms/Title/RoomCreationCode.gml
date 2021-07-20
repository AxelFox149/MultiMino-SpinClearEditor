globalvar level, lines, capture, Style, ColorPal, LevelCap, GMode, GOType;
globalvar LB, UB, TP, CDelay, Warning, PixelFade, BoardStart, BoardWidth;
globalvar Block, Corners, Buttons, CurrentButtons, Options, OSpin; 

PixelFade = 0;

BoardStart = 576
BoardWidth = 9

Buttons        = array_create(8)
CurrentButtons = array_create(8)
Options        = array_create(9)

global.pause    = false
global.gameover = false

audio_master_gain(0.25)

randomize()
level = 1
score = 0
lines = 0
capture = 0
OSpin   = true

LevelCap = 50
LB = 1
UB = 7
TP = 7

GMode  = 1
GOType = -1

Warning = false

__background_set( e__BG.VSpeed, 1, 0.5 )
__background_set( e__BG.HSpeed, 1, 0.5 )

//----------------------------------------
//Options

Options[0] = 1  //Matrix Shift
Options[1] = 1  //Block Style
Options[2] = 0  //Language
Options[3] = 0  //Controls
Options[4] = 1  //Clear Delay
Options[5] = 0  //Rotation System
Options[6] = 25 //Master Volume
Options[7] = 1  //Sound Effects
Options[8] = 1  //Music

//----------------------------------------
//Default Controls

Buttons[0] = 38  //Rotate Right
Buttons[1] = 40  //Soft Drop
Buttons[2] = 37  //Left
Buttons[3] = 39  //Right
Buttons[4] = 67  //Hold
Buttons[5] = 32  //Hard Drop
Buttons[6] = 88  //Rotate Left
Buttons[7] = 90  //Double Rotation

//----------------------------------------
//Current Controls

CurrentButtons[0] = 38  //Rotate Right
CurrentButtons[1] = 40  //Soft Drop
CurrentButtons[2] = 37  //Left
CurrentButtons[3] = 39  //Right
CurrentButtons[4] = 67  //Hold
CurrentButtons[5] = 32  //Hard Drop
CurrentButtons[6] = 88  //Rotate Left
CurrentButtons[7] = 90  //Double Rotation

//----------------------------------------

ConfigInit()

//----------------------------------------

ColorPal = array_create(30)

///Piece Colours

//Tetrominos

ColorPal[0] = $9D9D9D //Basura
ColorPal[1] = $FF00FF //T
ColorPal[2] = $0000FF //Z
ColorPal[3] = $00FF00 //S
ColorPal[4] = $0080FF //L
ColorPal[5] = $FF0000 //J
ColorPal[6] = $00FFFF //O
ColorPal[7] = $FFFF00 //I

//Pentominos

ColorPal[8]  = $FF4DFF //Y
ColorPal[9]  = $9A0F9A //R
ColorPal[10] = $4D4DFF //N
ColorPal[11] = $4DFF4D //N2
ColorPal[12] = $4DA6FF //L
ColorPal[13] = $FF4D4D //J
ColorPal[14] = $0BC6FF //Q
ColorPal[15] = $50F0FF //P
ColorPal[16] = $FF8A10 //I
ColorPal[17] = $F50C7E //T
ColorPal[18] = $FF4D00 //F
ColorPal[19] = $004DFF //7
ColorPal[20] = $6000FF //W
ColorPal[21] = $00FFD4 //S
ColorPal[22] = $0A0AB4 //Z
ColorPal[23] = $E2CD53 //U
ColorPal[24] = $A4E642 //V
ColorPal[25] = $600099 //X

//Mo/Do/Tro-minos

ColorPal[26] = $1F96FF //Point
ColorPal[27] = $FF944D //Tromino I
ColorPal[28] = $FFBE00 //Domino  I
ColorPal[29] = $3C82FF //Tromino V

ColorPal[30] = $9D9D9D //Basura
ColorPal[31] = $404040 //Editor
ColorPal[32] = $FFFFFF //Hexomino I

//----------------------------------

Block = array_create(29)

///Piece block location
   
//Tetrominos
Block[0] = "+0,+0 -1,+0 +1,+0 +0,-1" //T
Block[1] = "+0,+0 -1,-1 +1,+0 +0,-1" //Z
Block[2] = "+0,+0 -1,+0 +1,-1 +0,-1" //S
Block[3] = "+0,+0 -1,+0 +1,+0 +1,-1" //L
Block[4] = "+0,+0 -1,+0 +1,+0 -1,-1" //J

Block[5] = "-1,-1 +1,-1 -1,+1 +1,+1" //O
Block[6] = "-3,-1 -1,-1 +1,-1 +3,-1" //I

//Pentominos
Block[7]  = "-3,+1 -1,+1 +1,+1 +3,+1 +1,-1" //Y
Block[8]  = "-3,+1 -1,+1 +1,+1 +3,+1 -1,-1" //R
Block[9]  = "-3,-1 -1,+1 +1,+1 +3,+1 -1,-1" //N
Block[10] = "-3,+1 -1,+1 +1,+1 +3,-1 +1,-1" //N2
Block[11] = "-3,+1 -1,+1 +1,+1 +3,+1 +3,-1" //L
Block[12] = "-3,+1 -1,+1 +1,+1 +3,+1 -3,-1" //J
Block[13] = "-1,-1 +1,-1 -1,+1 +1,+1 -3,+1" //Q
Block[14] = "-1,-1 +1,-1 -1,+1 +1,+1 +3,+1" //P

Block[15] = "+0,+0 -1,+0 -2,+0 +1,+0 +2,+0" //I
Block[16] = "+0,+0 +1,+1 -1,+1 +0,+1 +0,-1" //T
Block[17] = "+0,+0 +1,+0 -1,+1 +0,+1 +0,-1" //F
Block[18] = "+0,+0 +1,+1 -1,+0 +0,+1 +0,-1" //7
Block[19] = "+0,+0 +1,+1 -1,+0 +0,+1 -1,-1" //W
Block[20] = "+0,+0 +1,-1 -1,+1 +0,+1 +0,-1" //S
Block[21] = "+0,+0 +1,+1 -1,-1 +0,+1 +0,-1" //Z
Block[22] = "+0,+0 -1,+0 +1,+0 -1,-1 +1,-1" //U
Block[23] = "+0,+1 +1,+1 -1,+1 -1,+0 -1,-1" //V
Block[24] = "+0,+0 -1,+0 +1,+0 +0,-1 +0,+1" //X

//Mo/Do/Tro-Minos

Block[25] = "+0,+0"             //Point
Block[26] = "+0,+0 -1,+0 +1,+0" //Tromino I
Block[27] = "-1,-1 +1,-1"       //Domino  I
Block[28] = "-1,-1 -1,+1 +1,+1" //Tromino V

//-------------------------------------------------

Corners = array_create(29)

///Piece corner locations
   
//Tetrominos
        //         Top       Bottom
Corners[0] = "-1,-1 +1,-1 -1,+1 +1,+1" //T
Corners[1] = "-2,-1 +1,-1 -1,+0 +1,+1" //Z
Corners[2] = "+2,-1 -1,-1 +1,+0 -1,+1" //S
Corners[3] = "-1,-1 +0,-1 -1,+1 +1,+1" //L
Corners[4] = "+0,-1 +1,-1 -1,+1 +1,+1" //J
Corners[5] = "+0,+0 +0,+0 +0,+0 +0,+0" //O

Corners[6] = "-3,+1 +3,+1 -3,-3 +3,-3" //I

//Pentominos
        //          Top       Bottom
Corners[7]  = "-3,-1 +3,-1 -3,+3 +3,+3" //Y
Corners[8]  = "-3,-1 +3,-1 -3,+3 +3,+3" //R
Corners[9]  = "-5,-1 +3,-1 -3,+1 +3,+3" //N
Corners[10] = "+5,-1 -3,-1 +3,+1 -3,+3" //N2
Corners[11] = "+1,-1 -3,-1 -3,+3 +3,+3" //L
Corners[12] = "-1,-1 +3,-1 -3,+3 +3,+3" //J
Corners[13] = "+1,-3 -3,-1 +1,+3 -3,+3" //Q
Corners[14] = "-1,-3 +3,-1 -1,+3 +3,+3" //P

Corners[15] = "-2,-1 +2,-1 -2,+1 +2,+1" //I
Corners[16] = "-1,-1 +1,-1 -1,+2 +1,+2" //T
Corners[17] = "-1,-1 +1,-1 -1,+2 +1,+1" //F
Corners[18] = "-1,-1 +1,-1 -1,+1 +1,+2" //7
Corners[19] = "+0,-1 +1,+0 -1,+1 +1,+2" //W
Corners[20] = "-1,-1 +1,+0 -1,+0 +1,+1" //S
Corners[21] = "+1,-1 -1,+0 +1,+0 -1,+1" //Z
Corners[22] = "-1,-2 +1,-2 -1,+1 +1,+1" //U
Corners[23] = "+0,-1 +1,+0 -1,+2 +1,+2" //V
Corners[24] = "+0,+0 +0,+0 +0,+0 +0,+0" //X

//Mo/Do/Tro-Minos

Corners[25] = "+0,+0 +0,+0 +0,+0 +0,+0" //Point
Corners[26] = "-1,-1 +1,-1 -1,+1 +1,+1" //Tromino I
Corners[27] = "-1,-3 +1,-3 -1,+1 +1,+1" //Domino  I
Corners[28] = "-3,-1 +1,-1 -1,+3 +1,+3" //Tromino V