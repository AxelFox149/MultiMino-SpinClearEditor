function CreateQueue() {
	var X, i = 0, A = array_create(MaxBoard + 1)

	repeat(MaxBoard)
	{
	    X = irandom_range(0, MaxBoard)
	    while(A[X])
	    {
	        X = irandom_range(0, MaxBoard)
	    }
	    A[X]      = true               
	    Boards[i] = X
	    i ++
    
	    if((i mod 5) == 0) {Boards[i] = -1; i ++}
	}



}
