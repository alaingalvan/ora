//d3d_transform_set_identity()
//d3d_transform_add_rotation_z(direction)
//Top wall
d3d_draw_wall(x, y, z, x + xlength, y, z + zlength, sides, 1, 1);
//back facing wall
d3d_draw_floor(x, y, z, x + xlength, y + ylength, z, sides, 1, 1);
//Bottom wall
d3d_draw_wall(
  x,
  y + ylength,
  z,
  x + xlength,
  y + ylength,
  z + zlength,
  sides,
  1,
  1
);
//left wall
d3d_draw_floor(x, y, z, x, y + ylength, z + zlength, sides, 1, 1);
//right wall
d3d_draw_floor(
  x + xlength,
  y,
  z,
  x + xlength,
  y + ylength,
  z + zlength,
  sides,
  1,
  1
);
//facing wall
d3d_draw_floor(x, y, z + 64, x + xlength, y + ylength, z + 64, sides, 1, 1);
//d3d_transform_set_identity()
