function vec2_dot(argument0, argument1) {
	//vec2_dot(veca, vecb);
	var veca, vecb;
	veca = argument0;
	vecb = argument1;
	/*
	dot = 0.0;
	for(var i = 1; i > -1; i--)
	{
	    dot += veca[i] * vecb[i];
	}

	return dot;
	*/

	return dot_product(veca[0],veca[1],vecb[0],vecb[1]);



}
