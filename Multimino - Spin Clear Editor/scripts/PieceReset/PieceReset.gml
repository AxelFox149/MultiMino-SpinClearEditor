function PieceReset(argument0) {
	var TopOnly = argument0;

	if(!TopOnly)
	{
	    with(Polyminoe){
	        if(sprite_index != 0)
	        {
	            sprite_index = other.Queue[0]
	        }
	        if(!DAS) DAS = other.DASLoad
	    }
	    for(i = 0; i < 4; i++) Queue[i]  = Queue[i + 1]
	    Queue[4] = RndPiece()
	}
	with(Polyminoe)
	{
	    x = 864
	    y = 96

	    alarm[0]    = -1
	    image_index = other.NState
	    MoveTimer   = 1
	    ML          = 15
	    PlaceTimer  = ResetTime
    
	    Drop = false
    
	    BC = 255 - PlaceTimer * 4
	    if((sprite_index >= O and sprite_index < P_I) or (sprite_index >= D_I)) move_snap(64,64)
    
	    if (place_meeting(x,y,Placed)) y -= 64
	    if (place_meeting(x,y,Placed)) with(GameMode) Top = true
    
	}





}
