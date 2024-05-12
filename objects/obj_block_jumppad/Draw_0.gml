//Top wall
d3d_draw_wall(
  x,
  y + 32,
  z,
  x + xlength,
  y + 32,
  z + zlength,
  global.tex_misc_padtop,
  image_xscale,
  1
);
//facing wall
d3d_draw_floor(
  x,
  y + 32,
  z,
  x + xlength,
  y + 32 + ylength,
  z,
  global.tex_misc_padfront,
  image_xscale,
  1
);
//Bottom wall
//d3d_draw_wall(x,y+32+ylength,z,x+xlength,y+32+ylength,z+zlength,padbottom,1,2);
//left wall
//d3d_draw_floor(x,y+32,z,x,y+ylength,z+zlength,-1,2,1);
//right wall
//d3d_draw_floor(x+xlength,y+32,z,x+xlength,y+32+ylength,z+zlength,-1,2,1);

//d3d_draw_floor(x,y,z,x+xlength,y+ylength,z,pad,1,image_xscale);
