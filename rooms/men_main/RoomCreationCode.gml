instance_create(0, 0, obj_sfx_tran1);

if (!instance_exists(obj_misc_bgmcontrol)) {
  instance_create(0, 0, obj_misc_bgmcontrol);
}

if (instance_exists(obj_misc_bgmcontrol)) {
  obj_misc_bgmcontrol.ini = false;
}

instance_create(0, 0, obj_mainmenu);
