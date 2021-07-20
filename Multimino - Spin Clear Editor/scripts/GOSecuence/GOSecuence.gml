function GOSecuence() {
	global.gameover = true
	alarm[0] = 60

	Warning = false
	object_set_depth(self, -15)

	with(Placed)
	{
	        Flash = true
	        alpha = 0.6
	        CColor = ColorPal[30]
	        image_blend = CColor
	}

	if(instance_exists(Polyminoe)){
	    LX = Polyminoe.x
	    LY = Polyminoe.y
	    LS = Polyminoe.sprite_index
	    LP = Polyminoe.image_index
    
	    instance_deactivate_object(Polyminoe)
	}



}
