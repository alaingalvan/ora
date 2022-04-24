function cam_create(xto, yto, zto, dist, xangle, yangle) {	with (instance_create(xto,yto,obj_camera)) {
	    z = zto;
	    distance = dist;
	    distance_band = dist;
	    angle_x = xangle;
	    angle_x_band = xangle;
	    angle_y = yangle;
	    angle_y_band = yangle;
	}
}
