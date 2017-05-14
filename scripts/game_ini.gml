///game_ini()
window_set_caption("Ora");
config_load();
gamepad_ini();

//Misc
global.postprocessing = false;
global.blurvar = 20;
global.cutscene = false;
global.debug = true;
global.loadgame = false;
global.noclip = true;
global.startup = true;
global.mouse_x_previous = 0;
global.mouse_y_previous = 0;
global.mb_middle_event_x = mouse_x;
global.mb_middle_event_y = mouse_y;
global.mouse_sensitivity_x = 1.0;
global.mouse_sensitivity_y = 1.0;

//Models/Textures
model_load();
