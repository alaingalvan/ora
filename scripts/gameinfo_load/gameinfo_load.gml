function gameinfo_load() {
	//gi_load();
	//loads the game info. 
	var gi;
	if file_exists("ora_gameinfo.config")
	{
	var gi;
	gi=adfile_open_read("ora_gameinfo.config")
	//Resolution
	global.resolution=adfile_read_real(gi);
	//Resolution
	global.fullscreen=adfile_read_real(gi);
	//Button Remaps
	global.up=adfile_read_real(gi);
	global.down=adfile_read_real(gi);
	global.left=adfile_read_real(gi);
	global.right=adfile_read_real(gi);
	global.zbutton=adfile_read_real(gi);
	global.xbutton=adfile_read_real(gi);
	//Post Processing
	global.postprocess=adfile_read_real(gi);
	//Anti-Aliasing
	global.antialias=adfile_read_real(gi);
	//V-Sync
	global.vsync=adfile_read_real(gi);
	//DOF Quality
	global.dof=adfile_read_real(gi);
	//DOF Quality
	global.motionblur=adfile_read_real(gi);
	//BGM Levels
	global.bgmlevel=adfile_read_real(gi);
	//SFX Levels
	global.sfxlevel=adfile_read_real(gi);
	//Captions
	global.captions=adfile_read_real(gi);
	//Commentary
	global.commentary=adfile_read_real(gi);
	//Commentary
	global.difficulty=adfile_read_real(gi);
	adfile_close(gi);
	}



}
