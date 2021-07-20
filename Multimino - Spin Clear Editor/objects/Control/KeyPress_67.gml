/// @description Intercambio

if(CH and !update and instance_exists(Polyminoe) and !(global.pause or global.gameover) and GMode != 7)
{
    if(Hold == Point)
    {
        Hold = Polyminoe.sprite_index
        PieceReset(false)
    }
    else
    {
        var Pivot
        Pivot = Hold
        Hold = Polyminoe.sprite_index
        Polyminoe.sprite_index = Pivot
        PieceReset(true)
    }
    
    CH = false
    audio_play_sound(HoldPiece,10,false)
}

