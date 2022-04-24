function convert_3d(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	// Convert_3d(targetx,targety,targetz,xfrom,from,zfrom,view)
	// Convert relic's 3d coordinates to a 2d coordinate on the screen (focus point)
	var pX, pY, pZ, mm;
	pX = argument0 - argument3;
	pY = argument1 - argument4;
	pZ = argument2 - argument5;
	mm = pX*dX + pY*dY + pZ*dZ;
     
	if mm > 0
	begin
	    pX /= mm;
	    pY /= mm;
	    pZ /= mm;
	end;
	else 
	begin
	    x_2d = -100000;
	    y_2d = -100000;
	    return 0;
	end;

	mm = (pX*vX + pY*vY + pZ*vZ) / sqr((__view_get( e__VW.WView, argument6 )/__view_get( e__VW.HView, argument6 ))*tan(55*pi/360));
	x_2d = (mm+1)/2*__view_get( e__VW.WView, argument6 );
	mm = (pX*uX + pY*uY + pZ*uZ) / sqr(tan(55*pi/360));
	y_2d = (1-mm)/2*__view_get( e__VW.HView, argument6 );
	return 1;




}
