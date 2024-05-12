/// @description  Add vertex (x,y,z) to the model with colour values.
/// @param ind The index of the model to add the primitive to.
/// @param x The x coordinate of the vertex.
/// @param y The y coordinate of the vertex.
/// @param z The z coordinate of the vertex.
/// @param col The color to blend with vertex.
/// @param alpha The alpha value of the vertex.
function d3d_model_vertex_color(
  argument0,
  argument1,
  argument2,
  argument3,
  argument4,
  argument5
) {
  __d3d_model_add_vertex(
    argument0,
    argument1,
    argument2,
    argument3,
    0,
    0,
    0,
    argument4 + ((argument5 * 255) << 24),
    0,
    0
  );
}
