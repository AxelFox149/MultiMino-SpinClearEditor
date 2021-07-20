function ConfigInit() {
	if(file_exists("Options.sav"))
	{
	    ConfigRead()
	    exit
	}

	ini_open("Options.sav")
	var i

	for(i = 0; i < 9; i ++)
	{
	    ini_write_real("Prefs","Opt" + string(i), Options[i])
    
	    if(i != 8) ini_write_real("Control","Btn" + string(i), Buttons[i])
	}
	ini_close()



}
