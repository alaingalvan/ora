/// @description  Defines a primitive vertex for a textured model in 3D along with its corresponding normal, color blending and alpha.
/// @param ind The index of the model to add the primitive to.
/// @param x The x coordinate of the vertex.
/// @param y The y coordinate of the vertex.
/// @param z The z coordinate of the vertex.
/// @param xn The x component of the normal vector.
/// @param yn The y component of the normal vector.
/// @param zn The z component of the normal vector.
/// @param xtex Starting x coordinate within the texture (0 - 1).
/// @param ytex Starting y coordinate within the texture (0 - 1).
/// @param col The color to blend with the vertex (c_white or -1 is no blend).
/// @param alpha The alpha of the vertex (0 - 1).
function d3d_model_vertex_normal_texture_color(
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
  __d3d_model_add_vertex(
    argument0,
    argument1,
    argument2,
    argument3,
    argument4,
    argument5,
    argument6,
    argument9 + ((argument10 * 255) << 24),
    argument7,
    argument8
  );
}
