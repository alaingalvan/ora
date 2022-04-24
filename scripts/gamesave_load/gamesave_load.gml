function gamesave_load() {
	//gamesave_load();
	//loads the level the player was in. 
	if (file_exists("ora_gamesave.sav"))
	{
	    var gs;
	    gs = adfile_open_read("ora_gamesave.sav")
	    //Resolution
	    room_goto(adfile_read_real(gs));
	    //XX
	    global.xx = adfile_read_real(gs);
	    //YY
	    global.yy = adfile_read_real(gs);
    
	    global.loadgame = true;
	    adfile_close(gs);
	}
	else
	{
	    room_goto_next();
	}



}
