/// @description Pausa

if(!global.gameover)
{
    global.pause = !global.pause
    
    if(global.pause)
    {
        audio_pause_all()
        with(ComboArt) AlarmHold = alarm_get(0)
    }
    else audio_resume_all()
}

