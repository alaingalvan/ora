function gameinfo_save() {
  //gameinfo_save();
  //saves various settings that the player assigned.
  var gameinfo;
  gameinfo = adfile_open_write("ora_gameinfo.config");
  //Resolution
  adfile_write_real(gameinfo, global.resolution);
  //Fullscreen
  adfile_write_real(gameinfo, global.fullscreen);
  //Button Remaps
  adfile_write_real(gameinfo, global.up);
  adfile_write_real(gameinfo, global.down);
  adfile_write_real(gameinfo, global.left);
  adfile_write_real(gameinfo, global.right);
  adfile_write_real(gameinfo, global.zbutton);
  adfile_write_real(gameinfo, global.xbutton);
  //Post Processing
  //Post Processing effects help add to the game by adjusting colors and lighting.
  adfile_write_real(gameinfo, global.postprocess);
  //Anti-Aliasing //0,2,4,8
  //Anti-Aliasing makes edges in the game look smoother.
  adfile_write_real(gameinfo, global.antialias);
  //V-Sync
  //V-Sync can help if you're experiencing frames overlap vertically.
  adfile_write_real(gameinfo, global.vsync);
  //DOF Quality
  //Depth of Field creates a blur effect similar to the way your eye works.
  adfile_write_real(gameinfo, global.dof);
  //Motion Blur Quality
  //Motion blur blurs the game as the camera accelerates.
  adfile_write_real(gameinfo, global.motionblur);
  //BGM Levels
  //Background Music Audio Levels.
  adfile_write_real(gameinfo, global.bgmlevel);
  //SFX Levels
  //Sound Effects Audio Levels.
  adfile_write_real(gameinfo, global.sfxlevel);
  //Captions
  //Read out what characters are saying.
  adfile_write_real(gameinfo, global.captions);
  //Developer Commentary
  //Listen to what Alain Galvan, the creator of ORA, had to say about the project.
  adfile_write_real(gameinfo, global.commentary);
  //Difficulty
  //Adjust how easy or hard you'd like the game to be. 0=easy, 1=normal.
  adfile_write_real(gameinfo, global.difficulty);

  adfile_close(gameinfo);
  exit;
}
