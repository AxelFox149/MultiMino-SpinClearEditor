function ConfigRead() {
	ini_open("Options.sav")
	var i;

	for(i = 0; i < 9; i++)
	{
	    Options[i] = ini_read_real("Prefs","Opt" + string(i), 0)
    
	    if(i != 8) CurretnButtons[i] = ini_read_real("Control","Btn" + string(i), 35)
	}
	ini_close()



}
