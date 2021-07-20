function DrawPiece(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
	var SPR  = argument0 - 1;
	var XPOS = argument1 - 32;
	var YPOS = argument2 - 32;
	var ANG  = argument3;
	var XSCAL  = argument4;
	var YSCAL  = argument5;
	var ALP    = argument6;
	var DRKFAC = argument7;

	if(SPR == -1) exit
	else if(SPR == P_J) ANG *= -1

	var XO, YO, PX, PY, i, l, col;

	if(SPR < 7)                     l = 4
	else if(SPR > 6 and SPR < 25)   l = 5
	else if(SPR == 25)              l = 1
	else if(SPR == 26 or SPR == 28) l = 3
	else if(SPR == 27)              l = 2

	col = ColorPal[SPR + 1]

	if(global.gameover) col = ColorPal[30]

	if(DRKFAC != 0)
	{
	    var h,s,v;
    
	    h = colour_get_hue(col)
	    s = colour_get_saturation(col)
	    v = colour_get_value(col)
    
	    v -= v * (DRKFAC/100)
    
	    col = make_colour_hsv(h,s,v)
	}

	for(i = 0; i < l; i++)
	{
	    XO = real(string_char_at(Block[SPR], 1 + 6*i) + string_char_at(Block[SPR], 2 + 6*i)) * 32 * XSCAL
	    YO = real(string_char_at(Block[SPR], 4 + 6*i) + string_char_at(Block[SPR], 5 + 6*i)) * 32 * YSCAL
    
	    if((SPR >= J and SPR <= P_Q) or (SPR >= T_I))
	    {
	        XO *= 0.5
	        YO *= 0.5
	    }

	    PX = cos(ANG * pi / 2) * XO - sin(ANG * pi / 2) * YO + XPOS
	    PY = sin(ANG * pi / 2) * XO + cos(ANG * pi / 2) * YO + YPOS
    
	    draw_sprite_ext(Point,Options[1],PX,PY,XSCAL,YSCAL,0,col,ALP)
	}



}
