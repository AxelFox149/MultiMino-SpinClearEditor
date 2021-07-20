function ConfigWrite() {
	ini_open("Options.sav")
	var i;

	for(i = 0; i < 9; i++)
	{
	    ini_write_real("Prefs","Opt" + string(i), Options[i])
    
	    if(i != 8) ini_write_real("Control","Btn" + string(i), CurrentButtons[i])
	}
	ini_close()



}
