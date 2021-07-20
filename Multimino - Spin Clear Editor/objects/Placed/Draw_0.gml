/// @description Flash

if(!Vanish) draw_self()

if(Flash)
{
    draw_set_colour(c_white)
    draw_set_alpha(alpha)
    draw_rectangle(x,y,x+64,y+64,false)
    draw_set_alpha(1)
    
    alpha -= 0.04
    
    if(alpha < 0)
    {   
        Flash = false
        if(Vanish) instance_destroy()
    }
}


