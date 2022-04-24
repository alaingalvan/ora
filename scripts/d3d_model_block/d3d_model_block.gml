/// @description Adds a block shape to the model.
/// @param ind The model index to add the block to.
/// @param x1 The initial x coordinate of the block. 
/// @param y1 The initial y coordinate of the block.
/// @param z1 The initial z coordinate of the block.
/// @param x2 The opposite x coordinate of the block.
/// @param y2 The opposite y coordinate of the block.
/// @param z2 The opposite z coordinate of the block.
/// @param hrepeat Amount of horizontal repetitions for the texture.
/// @param vrepeat Amount of vertical repetitions for the texture.
/// @returns 
function d3d_model_block(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {

	var __ind = argument0
	var __x1 = argument1;
	var __y1 = argument2;
	var __z1 = argument3;
	var __x2 = argument4;
	var __y2 = argument5;
	var __z2 = argument6;
	var __hrepeat = argument7;
	var __vrepeat = argument8;
	

	d3d_model_primitive_begin(__ind, pr_trianglelist);


	d3d_model_vertex_normal_texture(__ind, __x1, __y1, __z1, 0, 0, -1, 0, 0);
	d3d_model_vertex_normal_texture(__ind, __x1, __y2, __z1, 0, 0, -1, 0, __vrepeat);
	d3d_model_vertex_normal_texture(__ind, __x2, __y2, __z1, 0, 0, -1, __hrepeat, __vrepeat);

	d3d_model_vertex_normal_texture(__ind, __x2, __y2, __z1, 0, 0, -1, __hrepeat, __vrepeat);
	d3d_model_vertex_normal_texture(__ind, __x2, __y1, __z1, 0, 0, -1, __hrepeat, 0);
	d3d_model_vertex_normal_texture(__ind, __x1, __y1, __z1, 0, 0, -1, 0, 0);


	d3d_model_vertex_normal_texture(__ind, __x1, __y1, __z2, 0, 0, 1, 0, 0);
	d3d_model_vertex_normal_texture(__ind, __x2, __y1, __z2, 0, 0, 1, __hrepeat, 0);
	d3d_model_vertex_normal_texture(__ind, __x2, __y2, __z2, 0, 0, 1, __hrepeat, __vrepeat);

	d3d_model_vertex_normal_texture(__ind, __x2, __y2, __z2, 0, 0, 1, __hrepeat, __vrepeat);
	d3d_model_vertex_normal_texture(__ind, __x1, __y2, __z2, 0, 0, 1, 0, __vrepeat);
	d3d_model_vertex_normal_texture(__ind, __x1, __y1, __z2, 0, 0, 1, 0, 0);


	d3d_model_vertex_normal_texture(__ind, __x1, __y2, __z1, 0, 1, 0, 0, 0);
	d3d_model_vertex_normal_texture(__ind, __x1, __y2, __z2, 0, 1, 0, 0, __vrepeat);
	d3d_model_vertex_normal_texture(__ind, __x2, __y2, __z2, 0, 1, 0, __hrepeat, __vrepeat);

	d3d_model_vertex_normal_texture(__ind, __x2, __y2, __z2, 0, 1, 0, __hrepeat, __vrepeat);
	d3d_model_vertex_normal_texture(__ind, __x2, __y2, __z1, 0, 1, 0, __hrepeat, 0);
	d3d_model_vertex_normal_texture(__ind, __x1, __y2, __z1, 0, 1, 0, 0, 0);


	d3d_model_vertex_normal_texture(__ind, __x2, __y2, __z1, 1, 0, 0, 0, 0);
	d3d_model_vertex_normal_texture(__ind, __x2, __y2, __z2, 1, 0, 0, 0, __vrepeat);
	d3d_model_vertex_normal_texture(__ind, __x2, __y1, __z2, 1, 0, 0, __hrepeat, __vrepeat);

	d3d_model_vertex_normal_texture(__ind, __x2, __y1, __z2, 1, 0, 0, __hrepeat, __vrepeat);
	d3d_model_vertex_normal_texture(__ind, __x2, __y1, __z1, 1, 0, 0, __hrepeat, 0);
	d3d_model_vertex_normal_texture(__ind, __x2, __y2, __z1, 1, 0, 0, 0, 0);


	d3d_model_vertex_normal_texture(__ind, __x2, __y1, __z1, 0, -1, 0, 0, 0);
	d3d_model_vertex_normal_texture(__ind, __x2, __y1, __z2, 0, -1, 0, 0, __vrepeat);
	d3d_model_vertex_normal_texture(__ind, __x1, __y1, __z2, 0, -1, 0, __hrepeat, __vrepeat);

	d3d_model_vertex_normal_texture(__ind, __x1, __y1, __z2, 0, -1, 0, __hrepeat, __vrepeat);
	d3d_model_vertex_normal_texture(__ind, __x1, __y1, __z1, 0, -1, 0, __hrepeat, 0);
	d3d_model_vertex_normal_texture(__ind, __x2, __y1, __z1, 0, -1, 0, 0, 0);


	d3d_model_vertex_normal_texture(__ind, __x1, __y1, __z1, -1, 0, 0, 0, 0);
	d3d_model_vertex_normal_texture(__ind, __x1, __y1, __z2, -1, 0, 0, 0, __vrepeat);
	d3d_model_vertex_normal_texture(__ind, __x1, __y2, __z2, -1, 0, 0, __hrepeat, __vrepeat);

	d3d_model_vertex_normal_texture(__ind, __x1, __y2, __z2, -1, 0, 0, __hrepeat, __vrepeat);
	d3d_model_vertex_normal_texture(__ind, __x1, __y2, __z1, -1, 0, 0, __hrepeat, 0);
	d3d_model_vertex_normal_texture(__ind, __x1, __y1, __z1, -1, 0, 0, 0, 0);

	d3d_model_primitive_end(__ind);


}
