function gamesave_save() {
	//gamesave_save();
	//saves various settings that the player assigned. 
	var gamesave;
	gamesave=adfile_open_write("ora_gamesave.sav");
	
	//Room
	adfile_write_string(gamesave,room_get_name(room));
	
	// Position
	adfile_write_real(gamesave,global.xx);
	adfile_write_real(gamesave,global.yy);
	
	//Close
	adfile_close(gamesave);
	exit;



}
