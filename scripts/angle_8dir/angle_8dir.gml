function angle_8dir(argument0) {
	//angle_8dir(angle)
	var angle;
	angle = argument0;
	angle = floor(angle);
	if (angle > 360)
	{
	    angle -= 360;
	}
	if (angle < 0)
	{
	    angle += 360;
	}

	if (angle >= 337.5 || angle < 22.5)
	{
	    angle = 0;
	}
	if (angle >= 67.5 && angle < 112.5)
	{
	    angle = 90;
	}
	if (angle >= 157.5 && angle < 202.5)
	{
	    angle = 180;
	}
	if (angle >= 247.5 && angle < 292.5)
	{
	    angle = 270;
	}
	if (angle >= 22.5 && angle < 67.5)
	{
	    angle = 45;
	}
	if (angle >= 112.5 && angle < 157.5)
	{
	    angle = 135;
	}
	if (angle >= 202.5 && angle < 247.5)
	{
	    angle = 225;
	}
	if (angle >= 292.5 && angle < 337.5)
	{
	    angle = 315;
	}

	return angle;



}
