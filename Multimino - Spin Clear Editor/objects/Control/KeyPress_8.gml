if(global.pause)
{
    with(GameMode)
    {
        Fade = 1
        depth = -15
    }
    instance_deactivate_object(Polyminoe)
    instance_deactivate_object(self)
    audio_stop_all()
}

