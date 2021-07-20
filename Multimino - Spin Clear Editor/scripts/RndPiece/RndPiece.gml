function RndPiece() {
	var X, A

	if(ds_stack_empty(Stack))
	{
	    A = array_create(TP)
	    repeat(TP)
	    {
	        X = irandom(TP - 1)
	        while(A[X])
	        {
	            X = irandom(TP - 1)
	        }                             
	        A[X] = true
            
	        ds_stack_push(Stack, X + LB)
	    }
	}
	return ds_stack_pop(Stack)



}
