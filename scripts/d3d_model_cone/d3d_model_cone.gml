/// @description Adds a cone shape to the model.
/// @param ind The model index to add the cone to.
/// @param x1 The initial x coordinate of the cone.
/// @param y1 The initial y coordinate of the cone.
/// @param z1 The initial z coordinate of the cone.
/// @param x2 The opposite x coordinate of the cone.
/// @param y2 The opposite y coordinate of the cone.
/// @param z2 The opposite z coordinate of the cone.
/// @param hrepeat Amount of horizontal repetitions for the texture.
/// @param vrepeat Amount of vertical repetitions for the texture.
/// @param closed Sets whether to close (true) the bottom of the cone or not (false).
/// @param steps How many steps are used to make the cone "round" (typically 24)
/// @returns
function d3d_model_cone(
  argument0,
  argument1,
  argument2,
  argument3,
  argument4,
  argument5,
  argument6,
  argument7,
  argument8,
  argument9,
  argument10
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
  var __closed = argument9;
  var __steps = argument10;

  if (__steps < 3) {
    __steps = 3;
  }

  if (__steps > 128) {
    __steps = 128;
  }

  // Create sin and cos tables
  var __cc;
  var __ss;

  __cc[__steps] = 0;
  __ss[__steps] = 0;

  var __i;
  for (__i = 0; __i <= __steps; __i++) {
    var __rad = (__i * 2.0 * pi) / __steps;
    __cc[__i] = cos(__rad);
    __ss[__i] = sin(__rad);
  }

  var __mx = (__x2 + __x1) / 2;
  var __my = (__y2 + __y1) / 2;
  var __rx = (__x2 - __x1) / 2;
  var __ry = (__y2 - __y1) / 2;

  d3d_model_primitive_begin(__ind, pr_trianglestrip);

  for (__i = 0; __i <= __steps; __i++) {
    d3d_model_vertex_normal_texture(
      __ind,
      __mx,
      __my,
      __z2,
      0,
      0,
      1,
      (__hrepeat * __i) / __steps,
      __vrepeat
    );
    d3d_model_vertex_normal_texture(
      __ind,
      __mx + __cc[__i] * __rx,
      __my + __ss[__i] * __ry,
      __z1,
      __cc[__i],
      __ss[__i],
      0,
      (__hrepeat * __i) / __steps,
      0
    );
  }

  d3d_model_primitive_end(__ind);

  if (__closed == true) {
    d3d_model_primitive_begin(__ind, pr_trianglefan);
    d3d_model_vertex_normal_texture(__ind, __mx, __my, __z1, 0, 0, -1, 0, 0);
    for (__i = __steps; __i >= 0; __i--) {
      d3d_model_vertex_normal_texture(
        __ind,
        __mx + __cc[__i] * __rx,
        __my + __ss[__i] * __ry,
        __z1,
        0,
        0,
        -1,
        0,
        0
      );
    }
    d3d_model_primitive_end(__ind);
  }
}
