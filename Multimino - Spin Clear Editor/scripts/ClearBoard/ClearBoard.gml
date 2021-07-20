function ClearBoard() {
	if(n == 0 and GMode != 11) exit

	var i,j,k

	if(n != 0){
	for(i = 0; i < n; i ++)
	{
	    for(j = LC[i]; j > 0; j--)
	    {
	        for(k = 0; k <= BoardWidth; k ++)
	        {
	            board[j, k] = board[j - 1, k]
	        }
	    }
    
	    for(j = 0; j <= 9; j ++)
	    {
	        board[0, j] = 0
	    }
	}

	audio_play_sound(Droped,10,false)
	}

	instance_destroy(Placed)
	for(i = 0; i <= 39; i++)
	{
	    for(j = 0; j <= BoardWidth; j++)
	    {
	        XOff = BoardStart + (64 * j)
	        YOff =      -1152 + (64 * i)
	        if(board[i, j] != 0) instance_create(XOff, YOff, Placed)
	    }
	}



}
