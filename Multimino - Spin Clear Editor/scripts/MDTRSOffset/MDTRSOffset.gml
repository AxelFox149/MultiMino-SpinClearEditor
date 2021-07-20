function MDTRSOffset() {
	var Case, N, P = image_index;
	ST = true
	LT = 0
	if(Spin == 1) StateUpdate(1)
	if(Spin == -1)StateUpdate(-1)

	N = image_index

	if(sprite_index == M_O) exit

	if     (P == 0 and N == 1) Case = 0
	else if(P == 1 and N == 0) Case = 1
	else if(P == 1 and N == 2) Case = 2
	else if(P == 2 and N == 1) Case = 3
	else if(P == 2 and N == 3) Case = 4
	else if(P == 3 and N == 2) Case = 5
	else if(P == 3 and N == 0) Case = 6
	else if(P == 0 and N == 3) Case = 7

	if(sprite_index == T_I)
	{
	    //Offset table for I Tromino
	            //  1     2     3     4     5
	    //0>>1
	    MTDRS[0] = "+0,+0 +1,+0 -1,+0 -1,+1 +1,-1"
	    //1>>0
	    MTDRS[1] = "+0,+0 -1,+0 +1,+0 -1,+1 +1,-1"
	    //1>>0
	    MTDRS[2] = "+0,+0 +1,+0 -1,+0 +1,+1 -1,-1"
	    //0>>1
	    MTDRS[3] = "+0,+0 -1,+0 +1,+0 +1,+1 -1,-1"
	    //0>>1
	    MTDRS[4] = "+0,+0 +1,+0 -1,+0 -1,+1 +1,-1"
	    //1>>0
	    MTDRS[5] = "+0,+0 -1,+0 +1,+0 -1,+1 +1,-1"
	    //1>>0
	    MTDRS[6] = "+0,+0 +1,+0 -1,+0 +1,+1 -1,-1"
	    //0>>1
	    MTDRS[7] = "+0,+0 -1,+0 +1,+0 +1,+1 -1,-1"
	}
	else if(sprite_index == D_I)
	{
	    //Offset table for I Domino
	            //  1     2     3     4     5
	    //0>>1
	    MTDRS[0] = "+0,+0 -1,+0 +0,-1 +0,+0 +0,+0"
	    //1>>0
	    MTDRS[1] = "+0,+0 +1,+0 +0,+1 +0,+0 +0,+0"
	    //1>>2
	    MTDRS[2] = "+0,+0 +1,+0 +0,-1 +0,+0 +0,+0"
	    //2>>1
	    MTDRS[3] = "+0,+0 -1,+0 +0,+1 +0,+0 +0,+0"
	    //2>>3
	    MTDRS[4] = "+0,+0 +1,+0 +0,+1 +0,+0 +0,+0"
	    //3>>2
	    MTDRS[5] = "+0,+0 -1,+0 +0,-1 +0,+0 +0,+0"
	    //3>>0
	    MTDRS[6] = "+0,+0 -1,+0 +0,+1 +0,+0 +0,+0"
	    //0>>3
	    MTDRS[7] = "+0,+0 +1,+0 +0,-1 +0,+0 +0,+0"
	}
	else
	{
	//Offset table for V Tromino
	            //  1     2     3     4     5
	    //0>>1
	    MTDRS[0] = "+0,+0 -1,+0 +1,+0 +0,-1 +2,+0"
	    //1>>0
	    MTDRS[1] = "+0,+0 -1,+0 -1,+0 +0,+1 -2,+0"
	    //1>>2
	    MTDRS[2] = "+0,+0 +0,+1 +0,-1 +1,+0 +0,+2"
	    //2>>1
	    MTDRS[3] = "+0,+0 +0,-1 +0,+1 -1,+0 +0,-2"
	    //2>>3
	    MTDRS[4] = "+0,+0 -1,+0 +1,+0 +0,+1 -2,+0"
	    //3>>2
	    MTDRS[5] = "+0,+0 +1,+0 -1,+0 +0,-1 +2,+0"
	    //3>>0
	    MTDRS[6] = "+0,+0 +0,+1 +0,-1 -1,+0 +0,-2"
	    //0>>3
	    MTDRS[7] = "+0,+0 +0,-1 +0,+1 +1,+0 +0,+2"
	}

	var i, XO, YO;

	for(i = 0; i < 5; i++)
	{
	    XO = real(string_char_at(MTDRS[Case], 1 + 6*i) + string_char_at(MTDRS[Case], 2 + 6*i)) * 64
	    YO = real(string_char_at(MTDRS[Case], 4 + 6*i) + string_char_at(MTDRS[Case], 5 + 6*i)) * 64
    
	    if(place_empty(x + XO, y + YO))
	    {
	        x += XO
	        y += YO

	        LT = i + 1
	        exit
	    }
	}

	if(Spin == 1) StateUpdate(-1)
	if(Spin == -1)StateUpdate(1)

	ST = false
	exit



}
