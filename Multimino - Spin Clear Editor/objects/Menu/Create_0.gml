with (other) {
///Declaracion de variables

frame  = 0

Sel    = 0

Pos    = 0
MaxPos = 3

SecPos = 0
SecMax = 0
Second = false
Third  = false

KeyWait = false

Value = array_create(4)
FLoc  = array_create(4)

Value[0] = 1
Value[1] = 0
Value[2] = 0
Value[3] = 0

Wait      = false
ArFrame   = 0

/*
LineDef(Value[0])

    0 = Endless
    1 = 150
    2 = 200
    3 = 300
    
Cap(Value[1])
    
    0 = 1
    1 = 15
    2 = 20
    3 = 30

PieceMode(Value[2])

    0 = Tetris
    1 = Pentris
    2 = Multris

*/

Frame = 0

Vel = array_create(9)

draw_set_colour(c_white)

Texto[0,0] = "Play"
Texto[0,1] = "Options"
Texto[0,2] = "Exit"

Texto[1,0] = "Marathon"
Texto[1,1] = "Sprint"
Texto[1,2] = "Ultra"
Texto[1,3] = "Survival"
Texto[1,4] = "Spin Clear"
Texto[1,5] = "Master"
Texto[1,6] = "Combo"

Texto[2,0] = "Mat. Shift"
Texto[2,1] = "Mino Style"
Texto[2,2] = "Language"
Texto[2,3] = "Controls"
Texto[2,4] = "Line Delay"
Texto[2,5] = "Rot. Sys."
Texto[2,6] = "Master Vol"
Texto[2,7] = "SFX"
Texto[2,8] = "Music"

Texto[3,0] = "Jugar"
Texto[3,1] = "Opciones"
Texto[3,2] = "Salir"

Texto[4,0] = "Maratón"
Texto[4,1] = "Carrera"
Texto[4,2] = "Ultra"
Texto[4,3] = "Sobrevive"
Texto[4,4] = "Spin Clear"
Texto[4,5] = "Maestro"
Texto[4,6] = "Combo"

Texto[5,0] = "Mov. de Mat."
Texto[5,1] = "Est. de Mino"
Texto[5,2] = "Idioma"
Texto[5,3] = "Controles"
Texto[5,4] = "T. de Linea"
Texto[5,5] = "Sist. de Rot."
Texto[5,6] = "Vol. Maestro"
Texto[5,7] = "SFX"
Texto[5,8] = "Música"

//--------------------------------

MenuText[0,0] = "OFF"
MenuText[0,1] = "ON"

MenuText[1,0] = ""

MenuText[2,0] = "ENG"
MenuText[2,1] = "ESP"

MenuText[3,0] = "DEF"
MenuText[3,1] = "CUS"

MenuText[4,0] = "LNG"
MenuText[4,1] = "SRT"

MenuText[5,0] = "SRS"
MenuText[5,1] = "SRS"

MenuText[6,0] = ""
MenuText[6,1] = ""

MenuText[7,0] = "OFF"
MenuText[7,1] = "ON"

MenuText[8,0] = "OFF"
MenuText[8,1] = "ON"

MenuText[9,0] = "Choose a game mode"
MenuText[9,1] = "Elije un modo de juego"

//----------------

Keys[0,0] = "Rot. Right"
Keys[0,1] = "Soft Drop"
Keys[0,2] = "Move Left"
Keys[0,3] = "Move Right"
Keys[0,4] = "Hold"
Keys[0,5] = "Hard Drop"
Keys[0,6] = "Rot. Left"
Keys[0,7] = "Rot. 180º"
Keys[0,8] = "Reset"

Keys[1,0] = "Girar Der."
Keys[1,1] = "Caida Rapida"
Keys[1,2] = "Mover Izq."
Keys[1,3] = "Mover Der."
Keys[1,4] = "Reserva"
Keys[1,5] = "Caida Inst."
Keys[1,6] = "Girar Izq."
Keys[1,7] = "Girar 180º"
Keys[1,8] = "Reestablecer"

//---------------------------------------------
//Descripciones

Desc[0,0] = "Play between 6 game modes."
Desc[0,1] = "You can change language, block skin, controls, etc."
Desc[0,2] = "Exit the game."

Desc[1,0] = "Clear a total of 300, 200 or 150 lines."
Desc[1,1] = "Clear 40 Lines as fast as you can!"
Desc[1,2] = "Make as many points as you can within 3 minutes."
Desc[1,3] = "Keep yourself alive of the garbage that appears in the board."
Desc[1,4] = "Make as many All Clears as you can only using Spins and trises!"
Desc[1,5] = "Made for super players."
Desc[1,6] = "Make the longest combo!"

Desc[2,0] = "You can turn off the movement of the board if it bothers you."
Desc[2,1] = "This is the appearance of the pieces in the game."
Desc[2,2] = "This only affects text, not graphics."
Desc[2,3] = "You can change the controls if you don´t like the ones by default."
Desc[2,4] = "This will affect the time that a line takes to desappear."
Desc[2,5] = "A rotation system defines how a piece kicks in a collision."
Desc[2,6] = "Global volume of the game."
Desc[2,7] = "You can turn off the sound effects."
Desc[2,8] = "You can turn off the music."

Desc[3,0] = "Your line limit, if you choose INF it's an Endless Marathon"
Desc[3,1] = "The maximum level you can reach. This ONLY affects Endless Mode"
Desc[3,2] = "Choose the pieces that appears in the queue. Tetris uses the 7 tetrominoes, Pentris uses the 18 pentominoes and Multris make use of 29 pieces"
Desc[3,3] = "Start the game!"

Desc[4,0] = "Juega entre un total de 6 modos de juego."
Desc[4,1] = "Puedes cambiar el idioma, controles, estilo de bloque, etc."
Desc[4,2] = "Salir del juego."

Desc[5,0] = "Limpia 150, 200, 300 líneas o juega sin limite."
Desc[5,1] = "Limpia 40 líneas tan rápido como puedas."
Desc[5,2] = "Obtén tantos puntos puedas en un limite de 3 minutos."
Desc[5,3] = "¡Mantente vivo de la basura que irá apareciendo en el tablero!"
Desc[5,4] = "¡Obtén tantos All Clear como puedas usando solamente Spins y Trises!"
Desc[5,5] = "Hecho para super jugadores."
Desc[5,6] = "Obten el combo más alto!"

Desc[6,0] = "Puedes desactivar el movimiento del tablero si te molesta."
Desc[6,1] = "Esta es la apariencia que tendrán los bloques durante la partida."
Desc[6,2] = "Únicamente afecta al texto y no los gráficos"
Desc[6,3] = "Puedes modificar los controles si no te gustan los que hay por defecto."
Desc[6,4] = "Esto afecta el tiempo que una linea tarda en desaparecer.  (SRT = Corto, LNG = Largo)."
Desc[6,5] = "Un sistema de rotación define como una pieza es empujada en una colisión."
Desc[6,6] = "Volumen global del juego."
Desc[6,7] = "Puedes apagar los efectos de sonido."
Desc[6,8] = "Puedes apagar la música."

Desc[7,0] = "La meta de líneas, si seleccionas INF es un Maratón Sin Fin."
Desc[7,1] = "El nivel máximo que podrás alcanzar. Esto SOLO afecta al Maratón Sin Fin."
Desc[7,2] = "Elije las piezas de la fila. Tetris usa los 7 tetrominos, Pentris los 18 pentominos y Multris hace uso de 29 piezas."
Desc[7,3] = "¡Inicia la partida!"

/* */
}
/*  */
