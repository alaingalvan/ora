function config_save() {
  ini_open("Config.ini");
  //Keyboard / Mouse
  ini_write_real("Keyboard / Mouse", "Up", global.up);
  ini_write_real("Keyboard / Mouse", "Left", global.left);
  ini_write_real("Keyboard / Mouse", "Down", global.down);
  ini_write_real("Keyboard / Mouse", "Right", global.right);
  ini_write_real("Keyboard / Mouse", "Jump", global.jump);

  if (gamepad_is_supported()) {
    ini_write_real("Gamepad 0", "Deadzone", global.gamepad_deadzone[0]);
    ini_write_real("Gamepad 0", "Jump Button", global.gamepad_jump[0]);
  }
  //Graphics
  ini_write_real("Graphics", "Resolution Width", global.res_x);
  ini_write_real("Graphics", "Resolution Height", global.res_y);
  ini_write_real("Graphics", "Aspect Ratio", global.aspect_ratio);
  ini_write_real("Graphics", "Fullscreen", global.fullscreen);
  ini_write_real("Graphics", "Anti-aliasing", global.antialiasing);
  ini_write_real("Graphics", "Vsync", global.vsync);
  ini_write_real("Graphics", "Gamma", global.gamma);

  //Sound
  ini_write_real("Sound", "Master Volume", global.master_volume);
  ini_write_real("Sound", "BGM Volume", global.bgm_volume);
  ini_write_real("Sound", "SFX Volume", global.sfx_volume);

  //Gameplay
  ini_write_real("Gameplay", "Commentary", global.commentary);
  ini_write_real("Gameplay", "Difficulty", global.difficulty);
  ini_write_string("Gameplay", "LastSave", global.lastsave);
  ini_close();
}
