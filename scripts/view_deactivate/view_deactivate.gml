function view_deactivate() {
	if view_enabled=true
	{
	//declares objects which you want to be deactivated here

	instance_deactivate_object(obj_water_par)
	instance_deactivate_object(obj_block_par)
	instance_deactivate_object(obj_block_checkpoint)
	instance_deactivate_object(obj_block_backwall)
	instance_deactivate_object(obj_block_void)
	instance_deactivate_object(obj_block_jumppad)
	instance_deactivate_object(obj_block_dashr)
	instance_deactivate_object(obj_block_dashu)
	instance_deactivate_object(obj_block_light)
	instance_deactivate_object(obj_foe_par)
	//Just in case
	//instance_activate_object(obj_block_par)

	//reactivates all instances
	var x1,y1,w,h;
	convert_2d(0,0,global.cam_xfrom,global.cam_yfrom,global.cam_zfrom,0)
	x1 = x_3d - 256
	y1 = y_3d - 256
	convert_2d(__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ),global.cam_xfrom,global.cam_yfrom,global.cam_zfrom,0)
	w = x_3d - x1 + (256*2)
	h = y_3d - y1 + (256*2)
	//d3d_set_hidden(true);
	instance_activate_region(x1, y1, w, h, true);

	}



}
