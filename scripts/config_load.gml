ini_open("Config.ini");

//Keyboard / Mouse
global.up = ini_read_real("Keyboard / Mouse", "Up", vk_up);
global.left = ini_read_real("Keyboard / Mouse", "Left", vk_left);
global.down = ini_read_real("Keyboard / Mouse", "Down", vk_down);
global.right = ini_read_real("Keyboard / Mouse", "Right", vk_right);
global.jump = ini_read_real("Keyboard / Mouse", "Jump", vk_space);

//Gamepad
if (gamepad_is_supported())
{
    global.gamepad_deadzone[0] = ini_read_real("Gamepad 0", "Deadzone", 0.10);
    global.gamepad_jump[0] = ini_read_real("Gamepad 0", "Jump Button", gp_face1);
}
//Graphics
global.res_x = ini_read_real("Graphics", "Resolution Width", display_get_width());
global.res_y = ini_read_real("Graphics", "Resolution Height", display_get_height());
global.aspect_ratio = ini_read_real("Graphics", "Aspect Ratio", (global.res_y / global.res_x));
global.fullscreen = ini_read_real("Graphics", "Fullscreen", true);
global.antialiasing = ini_read_real("Graphics", "Anti-aliasing", 0);
global.vsync = ini_read_real("Graphics", "Vsync", false);
global.gamma = ini_read_real("Graphics", "Gamma", 1.0);
global.framelimit = ini_read_real("Graphics", "Frame Limit", 30);

//Sound
global.master_volume = ini_read_real("Sound", "Master Volume", 100);
global.bgm_volume = ini_read_real("Sound", "BGM Volume", 50);
global.sfx_volume = ini_read_real("Sound", "SFX Volume", 20);

//Gameplay
global.captions = ini_read_real("Gameplay", "Captions", 1); //0 = none, 1 = closed captions, 2 = everything captions
global.commentary = ini_read_real("Gameplay", "Commentary", false);
global.difficulty = ini_read_real("Gameplay", "Difficulty", 1); //0 = Easy (Less damage, more reaction time) | 1 = Normal (Intended gameplay _volume) | 2 = Hard (Easier to spot, more vigourous enemies.)
global.lastsave = ini_read_string("Gameplay", "LastSave", ""); //Last Savefile

ini_close();

config_save();

config_apply();
