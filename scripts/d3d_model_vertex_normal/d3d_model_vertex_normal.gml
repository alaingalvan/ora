/// @description  Defines a vertex for a primitive in 3D along with its corresponding normal.
/// @param ind The index of the model to add the primitive to.
/// @param x The x coordinate of the vertex.
/// @param y The y coordinate of the vertex. 
/// @param z The z coordinate of the vertex.
/// @param xn The x component of the normal vector.
/// @param yn The y component of the normal vector.
/// @param zn The z component of the normal vector.
function d3d_model_vertex_normal(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	__d3d_model_add_vertex( argument0, argument1, argument2, argument3, argument4, argument5, argument6, $00010000, 0, 0 );



}
