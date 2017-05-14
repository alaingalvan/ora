//This script executes whenever an accept command has been set to true.
var sel;
sel = string_lower(argument0)
if (cur_menu == "")
{
    if (sel == "continue")
    {
        instance_create(0, 0, obj_sfx_transload);
        //game_load_recent()
    }
    if (sel == "new")
    {
        instance_create(0, 0, obj_sfx_tran0);
        //game_load_recent()
    }
    if (sel == "load")
    {
        instance_create(0, 0, obj_sfx_tran0);
        //game_load_recent()
    }
    if (sel == "options")
    {
        next_menu = "Options";
        trans_menu = true;
    }
    if (sel == "exit")
    {
        instance_create(0, 0, obj_sfx_transexit);
    }

}
if (string_lower(cur_menu) == "options")
{
    if (sel == "gameplay")
    {
        next_menu = "Gameplay";
        trans_menu = true;
    }
    if (sel == "graphics")
    {
        next_menu = "Graphics";
        trans_menu = true;
    }
    if (sel == "sound")
    {
        next_menu = "Sound";
        trans_menu = true;
    }
    if (sel == "controls")
    {
        next_menu = "Controls";
        trans_menu = true;
    }
    if (sel == "back")
    {
        next_menu = "";
        trans_menu = true;
        config_save();
        config_apply();
    }
}

if (string_lower(cur_menu) == "gameplay")
{
    if (sel == "back")
    {
        next_menu = "options";
        trans_menu = true;
    }
}
if (string_lower(cur_menu) == "graphics")
{
    if (sel == "advanced graphics")
    {
        next_menu = "Advanced Graphics";
        trans_menu = true;
    }
    if (sel == "back")
    {
        next_menu = "options";
        trans_menu = true;
    }
}
if (string_lower(cur_menu) == "advanced graphics")
{
    if (sel == "back")
    {
        next_menu = "Graphics";
        trans_menu = true;
    }
}
if (string_lower(cur_menu) == "sound")
{
    if (sel == "back")
    {
        next_menu = "Options";
        trans_menu = true;
    }
}
if (string_lower(cur_menu) == "controls")
{
    if (sel == "key/mouse bindings")
    {
        next_menu = "Key/Mouse Bindings";
        trans_menu = true;
    }
    if (sel == "gamepad bindings")
    {
        next_menu = "Gamepad Bindings";
        trans_menu = true;
    }    
    if (sel == "back")
    {
        next_menu = "Options";
        trans_menu = true;
    }
}
if (string_lower(cur_menu) == "key/mouse bindings")
{   
    if (sel == "back")
    {
        next_menu = "Controls";
        trans_menu = true;
    }
}
if (string_lower(cur_menu) == "gamepad bindings")
{
    if (sel == "back")
    {
        next_menu = "Controls";
        trans_menu = true;
    }
}
