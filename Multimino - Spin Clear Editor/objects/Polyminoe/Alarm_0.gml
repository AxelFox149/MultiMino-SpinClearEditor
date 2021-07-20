if(!global.pause){
    y += 64
    if(place_meeting(x,y,Wall) or place_meeting(x,y,Placed))y -= 64
    else
    {
        if(Down) score += 1 * level
        
        Control.PSpin = false
    }
}

