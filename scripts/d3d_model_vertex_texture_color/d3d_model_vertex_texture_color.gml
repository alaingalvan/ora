/// @description  Add vertex (x,y,z) to the model with texture and color values.
/// @param ind The index of the model to add the primitive to.
/// @param x The x coordinate of the vertex.
/// @param y The y coordinate of the vertex. 
/// @param z The z coordinate of the vertex.
/// @param xtex Starting x coordinate within the texture (0 - 1). 
/// @param ytex Starting y coordinate within the texture (0 - 1).
/// @param col The color to blend with the vertex (c_white or -1 is no blend).
/// @param alpha The alpha of the vertex (0 - 1).
function d3d_model_vertex_texture_color(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	__d3d_model_add_vertex( argument0, argument1, argument2, argument3, 0, 0, 0, argument6 + ((argument7*255)<<24), argument4, argument5 );



}
