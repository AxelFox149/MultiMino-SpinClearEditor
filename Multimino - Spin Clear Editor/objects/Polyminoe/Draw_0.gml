/// @description Ghost
var i, DRK;
for(i = 0; i <= 25; i ++)
{
    //break
    if(place_meeting(x,y + (i * 64),Wall) or place_meeting(x,y + (i * 64),Placed))
    {
        DrawPiece(sprite_index, x, y + ((i - 1) * 64), image_index, 2, 2, 0.5, 50)
        break
    }
}
DRK = 65 - ((PlaceTimer * 65) / ResetTime)
DrawPiece(sprite_index, x, y, image_index, 2, 2, 1, DRK)

