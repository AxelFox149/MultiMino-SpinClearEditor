function ReadBoard(argument0) {
	var i, j, inst, XOff, YOff;

	//FromStart = argument0

	for(i = 0; i <= 39; i++)
	{
	    for(j = 0; j <= BoardWidth; j++)
	    {
	        XOff = BoardStart + (64 * j)
	        YOff =      -1152 + (64 * i)
        
	        inst = instance_place(XOff, YOff, Placed)
        
	        if(inst != noone)
	        {
	            if(argument0) with(inst)
	                {
	                    Control.board[i,j] = 30
	                    CColor = 30
	                }
	            else with(inst) Control.board[i,j] = CColor
	        }
	        else Control.board[i,j] = 0
	    }
	}



}
