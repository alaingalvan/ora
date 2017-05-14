//gamesave_save();
//saves various settings that the player assigned. 
var gamesave;
gamesave=adfile_open_write("ora_gamesave.sav")
//Room
adfile_write_real(gamesave,room);
//XX
adfile_write_real(gamesave,global.xx);
//YY
adfile_write_real(gamesave,global.yy);
//Close
adfile_close(gamesave);
exit;
