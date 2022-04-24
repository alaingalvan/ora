instance_create(0,0,obj_sfx_tran1);

if (!instance_exists(obj_misc_bgmcontrol))
{
    instance_create(0,0,obj_misc_bgmcontrol);
}

if (instance_exists(obj_misc_bgmcontrol))
{
    obj_misc_bgmcontrol.ini = false;
}

instance_create(0,0,obj_mainmenu);

if (os_type == os_android)
{
    virtual_key_add(0, window_get_height() - 128 * (window_get_height() / 320), 128 * (window_get_width() / 480), 128 * (window_get_height() / 320), global.left);
    virtual_key_add(128 * (window_get_width() / 480), window_get_height() - 128 * (window_get_height() / 320), 128 * (window_get_width() / 480), 128 * (window_get_height() / 320), global.right);
    virtual_key_add(window_get_width() - 128 * (window_get_width() / 480), window_get_height() - 128 * (window_get_height() / 320), 128 * (window_get_width() / 480), 128 * (window_get_height() / 320), global.up);
}