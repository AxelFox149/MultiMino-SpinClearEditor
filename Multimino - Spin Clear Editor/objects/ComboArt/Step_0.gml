/// @description Matrix shift

if(instance_exists(Polyminoe) and Options[0]){
    with(Polyminoe)
    {
        if(Dir != 0 and (place_meeting(x + (64 * Dir),y, Wall) or place_meeting(x + (64 * Dir),y, Placed)))
        {
            with(other)
            {
                CurrentVel = AcceleScr(CurrentVel,MaxVel * Polyminoe.Dir, 2.5 - abs(CurrentVel * 3/MaxVel))
                __view_set( e__VW.XView, 0, 0 + CurrentVel )
            }
        }
        else
        {
            with(other)
            {
                CurrentVel = AcceleScr(CurrentVel, 0, 3 - abs(CurrentVel * 2.5/MaxVel))
                __view_set( e__VW.XView, 0, 0 + CurrentVel )
            }
        }
        
        if(Drop) other.VerVel = -15
        else if(PlaceTimer <= 0) other.VerVel = -10
    }
}
else
{
    CurrentVel = AcceleScr(CurrentVel, 0, 3 - abs(CurrentVel * 2.5/MaxVel))
    __view_set( e__VW.XView, 0, 0 + CurrentVel )
}


VerVel = AcceleScr(VerVel, 0, 2 - abs(VerVel * 1.5/ 20))
__view_set( e__VW.YView, 0, 0 + VerVel )

