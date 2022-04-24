function aspect_preset_set(argument0) {
	//aspect_preset_set(set);
	//Input an int, and returns a new aspect ratio. 

	switch (argument0)
	{
	case 0:
	    global.aspect_ratio = (4 / 3);
	break;
	case 1:
	    global.aspect_ratio = (16 / 9);
	break;
	case 2:
	    global.aspect_ratio = (16 / 10);
	break;
	}



}
