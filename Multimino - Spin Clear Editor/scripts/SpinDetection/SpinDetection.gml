function SpinDetection() {
	if(!ST or sprite_index == 0)
	{
	    audio_play_sound(BlockedSound,10,false)
	    return false
	}

	var i, XO, YO, PX, PY, index, SpinCount = 0, MiniCount = 0, rSt;

	index = sprite_index - 1


	if((index == 5 or index == 24) and OSpin)
	{
	    if(!place_free(x, y + 64)) SpinCount ++
	    if(!place_free(x, y - 64)) SpinCount ++
	    if(!place_free(x + 64, y)) SpinCount ++
	    if(!place_free(x - 64, y)) SpinCount ++
    
	    if(SpinCount == 4)
	    {
	        audio_play_sound(SpinRotate,10,false)
	        return true
	    }
	    audio_play_sound(Rotate,10,false)
	    return false
	}

	for(i = 0; i < 4; i++)
	{
	    XO = real(string_char_at(Corners[index], 1 + 6*i) + string_char_at(Corners[index], 2 + 6*i)) * 64
	    YO = real(string_char_at(Corners[index], 4 + 6*i) + string_char_at(Corners[index], 5 + 6*i)) * 64
    
	    if((sprite_index >=I and sprite_index <= P_P) or (sprite_index >= D_I))
	    {
	        XO *= 0.5
	        YO *= 0.5
	    }
		
		rSt = image_index
		
		if(sprite_index == P_Q) rSt = ((rSt * -1) + 4) mod 4
    
	    PX = cos(image_index * pi / 2) * XO - sin(image_index * pi / 2) * YO + x
	    PY = sin(image_index * pi / 2) * XO + cos(image_index * pi / 2) * YO + y
	    if(collision_point(PX,PY,all,true,true) != noone)
	    {
	            SpinCount ++
	            if(i < 2) MiniCount ++
	    }
	}


	if(SpinCount >= 3 and !place_free(x, y + 64))
	{
	    if(MiniCount == 1 and LT != 5) and (index != P_P and index != P_W and index != P_S) Control.Mini = true 
	    else Control.Mini = false
    
	    audio_play_sound(SpinRotate,10,false)
	    return true
	}
	else
	{
	    audio_play_sound(Rotate,10,false)
	    Control.PSpin = false
	    return false
	}



}
