function convert_prepare(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {
	// ConvertPrepare(xfrom,yfrom,zfrom,xto,yto,zto,xup,yup,zup,angle,aspect);

	var mm;
	dX = argument3 - argument0;
	dY = argument4 - argument1;
	dZ = argument5 - argument2;
	mm = sqrt(dX*dX + dY*dY + dZ*dZ);
	dX /= mm;
	dY /= mm;
	dZ /= mm;
	uX = argument6;
	uY = argument7;
	uZ = argument8;
	mm = uX*dX + uY*dY + uZ*dZ;
	uX -= mm*dX;
	uY -= mm*dY;
	uZ -= mm*dZ;
	mm = sqrt(uX*uX + uY*uY + uZ*uZ);
	uX /= mm;
	uY /= mm;
	uZ /= mm;
	tFOV = tan(argument9*pi/360);
	uX *= tFOV;
	uY *= tFOV;
	uZ *= tFOV;
	vX = uY*dZ - dY*uZ;
	vY = uZ*dX - dZ*uX;
	vZ = uX*dY - dX*uY;
	vX *= argument10;
	vY *= argument10;
	vZ *= argument10;



}
