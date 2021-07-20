function DRSOffset() {
	var Case, N, P = image_index;

	ST = true
	StateUpdate(2)

	N = image_index

	if(sprite_index == M_O or sprite_index == P_I or sprite_index == P_S or sprite_index == P_Z) exit

	if((sprite_index == O or sprite_index == P_X) and !OSpin) exit

	if(sprite_index < O or (sprite_index > P_P and sprite_index < P_X) or sprite_index > P_X)
	{
	    //Offset table for T,Z,S,L,J Tetrominoes and I,T,F,7,W,S,Z,U,V Pentominoes
	            //  1     2     3     4     5     6
	    //0>>2
	    DRS[0] = "+0,+0 +1,+0 +2,+0 -1,+0 -2,+0 +0,-1"
	    //1>>3
	    DRS[1] = "+0,+0 +0,+1 +0,+2 +0,-1 +0,-2 +1,+0"
	    //2>>0
	    DRS[2] = "+0,+0 -1,+0 -2,+0 +1,+0 +2,+0 +0,+1"
	    //3>>1
	    DRS[3] = "+0,+0 +0,+1 +0,+2 +0,-1 +0,-2 -1,+0"
	}
	else if(sprite_index == O)
	{
	    //Special Offset table for O Tetromino
	            //  1     2     3     4     5     6
	    //0>>2
	    DRS[0] = "+1,+1 +1,+2 +1,+0 +2,+2 +0,+0 +0,+0"
	    //1>>3
	    DRS[1] = "-1,+1 -1,+2 -1,+0 -2,+2 +0,+0 +0,+0"
	    //2>>0
	    DRS[2] = "-1,-1 -1,+0 -1,-2 -2,-2 +0,+0 +0,+0"
	    //3>>1
	    DRS[3] = "+1,-1 +1,+0 +1,-2 +2,-2 +0,+0 +0,+0"
	}
	else if(sprite_index == I)
	{
	    //Offset table for I Tetromino
	            //  1     2     3     4     5     6
	    //0>>2
	    DRS[0] = "+0,+0 -1,+0 -2,+0 +1,+0 +2,+0 +0,+1"
	    //1>>3
	    DRS[1] = "+0,+0 +0,+1 +0,+2 +0,-1 +0,-2 -1,+0"
	    //2>>0
	    DRS[2] = "+0,+0 +1,+0 +2,+0 -1,+0 -2,+0 +0,-1"
	    //3>>1
	    DRS[3] = "+0,+0 +0,+1 +0,+2 +0,-1 +0,-2 +1,+0"
	}
	else if(sprite_index > I and sprite_index < P_Q)
	{
	    //Offset table for Y,R,N,N2,L,J Pentominoes
	            //  1     2     3     4     5     6
	    //0>>2
	    DRS[0] = "+0,+1 -1,+1 -2,+1 +1,+1 +2,+1 +0,+0"
	    //1>>3
	    DRS[1] = "-1,+0 -1,+1 -1,+2 -1,-1 -1,-2 +0,+0"
	    //2>>0
	    DRS[2] = "+0,-1 +1,-1 +2,-1 -1,-1 -2,-1 +0,+0"
	    //3>>1
	    DRS[3] = "+1,+0 +1,+1 +1,+2 +1,-1 +1,-2 +0,+0"
	}
	else if(sprite_index < P_I)
	{
	    //Offset table for Q,P Pentominoes
	            //  1     2     3     4     5     6
	    //0>>2
	    DRS[0] = "+0,+0 +0,+1 -1,+1 +1,+1 +2,+1 +1,+0"
	    //1>>3
	    DRS[1] = "+0,+0 -1,+0 -1,-1 -1,+2 -1,+3 +0,+1"
	    //2>>0
	    DRS[2] = "+0,+0 +0,-1 +1,-1 -1,-1 -2,-1 -1,+0"
	    //3>>1
	    DRS[3] = "+0,+0 +1,+0 +1,+1 +1,-2 +1,-3 +0,-1"
	}
	else if(sprite_index == P_X)
	{
	    //Special Offset table for X Pentominoe
	            //  1     2     3     4     5     6
	    //0>>2
	    DRS[0] = "+1,+1 +1,+2 +2,+1 +2,+2 +0,+0 +0,+0"
	    //1>>3
	    DRS[1] = "-1,+1 -1,+2 -2,+1 -2,+2 +0,+0 +0,+0"
	    //2>>0
	    DRS[2] = "-1,-1 -2,-1 -1,-2 -2,-2 +0,+0 +0,+0"
	    //3>>1
	    DRS[3] = "+1,-1 +2,-1 +1,-2 +2,-2 +0,+0 +0,+0"
	}

	if(P == 0 and N == 2) Case = 0
	else if(P == 1 and N == 3) Case = 1
	else if(P == 2 and N == 0) Case = 2
	else if(P == 3 and N == 1) Case = 3


	var i, XO, YO;

	for(i = 0; i < 6; i++)
	{
	    XO = real(string_char_at(DRS[Case], 1 + 6*i) + string_char_at(DRS[Case], 2 + 6*i)) * 64
	    YO = real(string_char_at(DRS[Case], 4 + 6*i) + string_char_at(DRS[Case], 5 + 6*i)) * 64
    
	    if(place_empty(x + XO, y + YO))
	    {
	        x += XO
	        y += YO
	        LT = -1
	        exit
	    }
	}

	StateUpdate(-2)

	ST = false
	exit



}
