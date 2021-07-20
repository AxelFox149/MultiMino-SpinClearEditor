function SRSOffset() {
	var Case, N, P = image_index;

	ST = true
	LT = 0
	if(Spin == 1) StateUpdate(1)
	if(Spin == -1)StateUpdate(-1)

	N = image_index

	if(sprite_index == O and !OSpin) exit

	if     (P == 0 and N == 1) Case = 0
	else if(P == 1 and N == 0) Case = 1
	else if(P == 1 and N == 2) Case = 2
	else if(P == 2 and N == 1) Case = 3
	else if(P == 2 and N == 3) Case = 4
	else if(P == 3 and N == 2) Case = 5
	else if(P == 3 and N == 0) Case = 6
	else if(P == 0 and N == 3) Case = 7

	if(sprite_index < O)
	{
	    //Offset table for T,Z,S,L,J
	            //  1     2     3     4     5
	    //0>>1
	    SRS[0] = "+0,+0 -1,+0 -1,-1 +0,+2 -1,+2"
	    //1>>0
	    SRS[1] = "+0,+0 +1,+0 +1,+1 +0,-2 +1,-2"
	    //1>>2
	    SRS[2] = "+0,+0 +1,+0 +1,+1 +0,-2 +1,-2"
	    //2>>1
	    SRS[3] = "+0,+0 -1,+0 -1,-1 +0,+2 -1,+2"
	    //2>>3
	    SRS[4] = "+0,+0 +1,+0 +1,-1 +0,+2 +1,+2"
	    //3>>2
	    SRS[5] = "+0,+0 -1,+0 -1,+1 +0,-2 -1,-2"
	    //3>>0
	    SRS[6] = "+0,+0 -1,+0 -1,+1 +0,-2 -1,-2"
	    //0>>3
	    SRS[7] = "+0,+0 +1,+0 +1,-1 +0,+2 +1,+2"
	}
	else if(sprite_index == O)
	{
	    //Special offset table for O
	            //  1     2     3     4     5
	    //0>>1
	    SRS[0] = "+1,+0 +1,+1 +1,-1 +1,+2 +0,+0"
	    //1>>0
	    SRS[1] = "-1,+0 -1,-1 -1,+1 -1,-2 +0,+0"
	    //1>>2
	    SRS[2] = "+0,+1 +1,+1 -1,+1 +2,+1 +0,+0"
	    //2>>1
	    SRS[3] = "+0,-1 -1,-1 +1,-1 -2,-1 +0,+0"
	    //2>>3
	    SRS[4] = "-1,+0 -1,+1 -1,-1 -1,+2 +0,+0"
	    //3>>2
	    SRS[5] = "+1,+0 +1,-1 +1,+1 +1,-2 +0,+0"
	    //3>>0
	    SRS[6] = "+0,-1 +1,-1 -1,-1 +1,-2 +0,+0"
	    //0>>3
	    SRS[7] = "+0,+1 -1,+1 +1,+1 -1,+2 +0,+0"
	}
	else
	{
	    //Offset table for I
	            //  1     2     3     4     5
	    //0>>1
	    SRS[0] = "+0,+0 -2,+0 +1,+0 -2,+1 +1,-2"
	    //1>>0
	    SRS[1] = "+0,+0 +2,+0 -1,+0 +2,-1 -1,+2"
	    //1>>2
	    SRS[2] = "+0,+0 -1,+0 +2,+0 -1,-2 +2,+1"
	    //2>>1
	    SRS[3] = "+0,+0 +1,+0 -2,+2 +1,+2 -2,-1"
	    //2>>3
	    SRS[4] = "+0,+0 +2,+0 -1,+0 +2,-1 -1,+2"
	    //3>>2
	    SRS[5] = "+0,+0 -2,+0 +1,+0 -2,+1 +1,-2"
	    //3>>0
	    SRS[6] = "+0,+0 +1,+0 -2,+0 +1,+2 -2,-1"
	    //0>>3
	    SRS[7] = "+0,+0 -1,+0 +2,+0 -1,-2 +2,+1"
	}

	var i, XO, YO;

	for(i = 0; i < 5; i++)
	{
	    XO = real(string_char_at(SRS[Case], 1 + 6*i) + string_char_at(SRS[Case], 2 + 6*i)) * 64
	    YO = real(string_char_at(SRS[Case], 4 + 6*i) + string_char_at(SRS[Case], 5 + 6*i)) * 64
    
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
