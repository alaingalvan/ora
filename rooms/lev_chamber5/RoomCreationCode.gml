instance_create(0,0,obj_sfx_tran1);
cam_create(obj_orb.x, obj_orb.y, obj_orb.z, 800.0, 270.0, 90.0);
if (instance_exists(obj_misc_bgmcontrol))
{
obj_misc_bgmcontrol.ini = false;
}