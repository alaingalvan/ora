function draw_surface_blur_ext(
  argument0,
  argument1,
  argument2,
  argument3,
  argument4,
  argument5,
  argument6,
  argument7,
  argument8
) {
  //draw_surface_blur_ext(id,x,y,xscale,yscale,rot,color,alpha,blurradius)
  var blurr, blura;
  blurr = argument8;
  blura = argument7 / blurr;
  for (ii = 0; ii < argument8; ii += 1) {
    //for(i=0;i<360;i+=360/blurr)
    for (i = 0; i < 360; i += 360 / 5) {
      draw_surface_ext(
        argument0,
        argument1 + lengthdir_x(ii, i),
        argument2 - lengthdir_y(ii, i),
        argument3,
        argument4,
        argument5,
        argument6,
        blura
      );
    }
  }
}
