//mainmenu_goto(String menuname)
//Sets the List list to the new menu options. 
var menu, check;
menu = string_lower(argument0);
check = false;

//Goto Previous
if (menu == "back")
{
    menu = "";
    trans_menu = true;
}

//Mainmenu
if (menu == "" || menu == "mainmenu")
{
    ds_list_clear(list);
    ds_list_add(list, "Continue");
    ds_list_add(list, "New");
    ds_list_add(list, "Options");
    ds_list_add(list, "Exit");
    menu_type_next = 0;
}
//Options
if (menu == "options")
{
    ds_list_clear(list);
    ds_list_add(list, "Gameplay");
    ds_list_add(list, "Graphics");
    ds_list_add(list, "Sound");
    //ds_list_add(list, "Controls");
    ds_list_add(list, "Back");
    menu_type_next = 0;
}
if (menu == "gameplay")
{
    ds_list_clear(list);
    ds_list_add(list, "Difficulty");
    ds_list_add(list, "Commentary");
    ds_list_add(list, "Back");
    menu_type_next = 1;
}
if (menu == "graphics")
{
    ds_list_clear(list);
    ds_list_add(list, "Resolution");
    ds_list_add(list, "Aspect Ratio");
    ds_list_add(list, "Fullscreen");
    ds_list_add(list, "Advanced Graphics");
    ds_list_add(list, "Back");
    menu_type_next = 1;
}
if (menu == "advanced graphics")
{
    ds_list_clear(list);
    ds_list_add(list, "Anti-Aliasing");
    //ds_list_add(list, "Framelimit");
    ds_list_add(list, "Back");
    menu_type_next = 1;
}
if (menu == "controls")
{
    ds_list_clear(list)
    ds_list_add(list, "Key/Mouse Bindings");
    ds_list_add(list, "Gamepad Bindings");
    ds_list_add(list, "Back");
    menu_type_next = 1;
}
if (menu == "key/mouse bindings")
{
    ds_list_clear(list);
    ds_list_add(list, "Move Up");
    ds_list_add(list, "Move Left");
    ds_list_add(list, "Move Down");
    ds_list_add(list, "Move Right");
    ds_list_add(list, "Jump / Reflect");
    ds_list_add(list, "Back")
    menu_type_next = 1;
}
if (menu == "gamepad bindings")
{
    ds_list_clear(list)
    ds_list_add(list, "Move");
    ds_list_add(list, "Jump / Reflect");
    ds_list_add(list, "Back");
    menu_type_next = 1;
}
if (menu == "sound")
{
    ds_list_clear(list)
    ds_list_add(list, "Master Volume");
    ds_list_add(list, "BGM Volume");
    ds_list_add(list, "Effects Volume");
    ds_list_add(list, "Back");
    menu_type_next = 1;
}
