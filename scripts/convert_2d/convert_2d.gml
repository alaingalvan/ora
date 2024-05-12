function convert_2d(
  argument0,
  argument1,
  argument2,
  argument3,
  argument4,
  argument5
) {
  // Convert_2d(x,y,xfrom,yfrom,zfrom,view)
  // The script returns the 3d x and y coordinates at z = 0

  screenx = (2 * argument0) / __view_get(e__VW.WView, argument5) - 1;
  screeny = 1 - (2 * argument1) / __view_get(e__VW.HView, argument5);
  mX = dX + uX * screeny + vX * screenx;
  mY = dY + uY * screeny + vY * screenx;
  mZ = dZ + uZ * screeny + vZ * screenx;

  if (mZ != 0) {
    x_3d = argument2 - (argument4 * mX) / mZ;
    y_3d = argument3 - (argument4 * mY) / mZ;
  } else {
    x_3d = argument2 - argument4 * mX;
    y_3d = argument3 - argument4 * mY;
  }
}
