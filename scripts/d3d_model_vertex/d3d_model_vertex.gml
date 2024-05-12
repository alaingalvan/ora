/// @description  Add vertex (x,y,z) to the model.
/// @param ind The index of the model to add the primitive to.
/// @param x The x coordinate of the vertex.
/// @param y The y coordinate of the vertex.
/// @param z The z coordinate of the vertex.
function d3d_model_vertex(argument0, argument1, argument2, argument3) {
  __d3d_model_add_vertex(
    argument0,
    argument1,
    argument2,
    argument3,
    0,
    0,
    0,
    $00010000,
    0,
    0
  );
}
