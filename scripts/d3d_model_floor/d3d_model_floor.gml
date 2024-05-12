/// @description Adds a floor shape to the model.
/// @param ind The model index to add the floor to.
/// @param x1 The initial x coordinate of the floor.
/// @param y1 The initial y coordinate of the floor.
/// @param z1 The initial z coordinate of the floor.
/// @param x2 The opposite x coordinate of the floor.
/// @param y2 The opposite y coordinate of the floor.
/// @param z2 The opposite z coordinate of the floor.
/// @param hrepeat Amount of horizontal repetitions for the texture.
/// @param vrepeat Amount of vertical repetitions for the texture.
/// @returns
function d3d_model_floor(
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
  var __ind = argument0;
  var __x1 = argument1;
  var __y1 = argument2;
  var __z1 = argument3;
  var __x2 = argument4;
  var __y2 = argument5;
  var __z2 = argument6;
  var __hrepeat = argument7;
  var __vrepeat = argument8;

  var __xdiff = __x2 - __x1;
  var __zdiff = __z2 - __z1;

  var __lsquared = __xdiff * __xdiff + __zdiff * __zdiff;
  if (__lsquared == 0) return 0;

  var __l = sqrt(__lsquared);

  var __nx = -__zdiff / __l;
  var __nz = __xdiff / __l;

  d3d_model_primitive_begin(__ind, pr_trianglefan);

  d3d_model_vertex_normal_texture(__ind, __x1, __y1, __z1, __nx, 0, __nz, 0, 0);
  d3d_model_vertex_normal_texture(
    __ind,
    __x1,
    __y2,
    __z1,
    __nx,
    0,
    __nz,
    0,
    __vrepeat
  );
  d3d_model_vertex_normal_texture(
    __ind,
    __x2,
    __y2,
    __z2,
    __nx,
    0,
    __nz,
    __hrepeat,
    __vrepeat
  );
  d3d_model_vertex_normal_texture(
    __ind,
    __x2,
    __y1,
    __z2,
    __nx,
    0,
    __nz,
    __hrepeat,
    0
  );

  d3d_model_primitive_end(__ind);
}
