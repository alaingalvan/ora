/// @description  Loads the model from the indicated file name.
/// @param ind The index of the model to be loaded.
/// @param fname The name of the file to load the model from.
function d3d_model_load(argument0, argument1) {

	var __ind = argument0;
	var __fname = argument1;

	var __file = file_text_open_read(__fname);
	if (__file == -1)
		return -1;
	
	// Get version number
	var __version = file_text_read_real(__file);
	if (__version != 100)
	{
		file_text_close(__file);
		return - 1; // wrong version
	}
	file_text_readln(__file);

	// Get number of entries
	var __numthings = file_text_read_real(__file);
	file_text_readln(__file);

	// At this point, scrub the contents of the passed-in model
	d3d_model_clear(__ind);

	// Now parse the contents of the file
	var __currthing = 0;
	var __i;
	while(__currthing < __numthings)
	{
		// Every entry is 11 values - 1 'command' and 10 parameters
		var __kind = round(file_text_read_real(__file));
		var __args;
		for(__i = 0; __i < 10; __i++)
		{
			__args[__i] = file_text_read_real(__file);
		}
		file_text_readln(__file);
	
		switch(__kind)
		{
			case e__YYMKIND.PRIMITIVE_BEGIN:	d3d_model_primitive_begin(__ind, round(__args[0])); break;
			case e__YYMKIND.PRIMITIVE_END:		d3d_model_primitive_end(__ind); break;
			case e__YYMKIND.VERTEX:				d3d_model_vertex(__ind, __args[0], __args[1], __args[2]); break;
			case e__YYMKIND.VERTEX_COLOR:		d3d_model_vertex_color(__ind, __args[0], __args[1], __args[2], round(__args[3]), __args[4]); break;
			case e__YYMKIND.VERTEX_TEX:			d3d_model_vertex_texture(__ind, __args[0], __args[1], __args[2], __args[3], __args[4]); break;
			case e__YYMKIND.VERTEX_TEX_COLOR:	d3d_model_vertex_texture_color(__ind, __args[0], __args[1], __args[2], __args[3], __args[4], round(__args[5]), __args[6]); break;
			case e__YYMKIND.VERTEX_N:			d3d_model_vertex_normal(__ind, __args[0], __args[1], __args[2], __args[3], __args[4], __args[5]); break;
			case e__YYMKIND.VERTEX_N_COLOR:		d3d_model_vertex_normal_color(__ind, __args[0], __args[1], __args[2], __args[3], __args[4], __args[5], round(__args[6]), __args[7]); break;
			case e__YYMKIND.VERTEX_N_TEX:		d3d_model_vertex_normal_texture(__ind, __args[0], __args[1], __args[2], __args[3], __args[4], __args[5], __args[6], __args[7]); break;
			case e__YYMKIND.VERTEX_N_TEX_COLOR: d3d_model_vertex_normal_texture_color(__ind, __args[0], __args[1], __args[2], __args[3], __args[4], __args[5], __args[6], __args[7], round(__args[8]), __args[9]); break;
			case e__YYMKIND.SHAPE_BLOCK:		d3d_model_block(__ind, __args[0], __args[1], __args[2], __args[3], __args[4], __args[5], __args[6], __args[7]); break;
			case e__YYMKIND.SHAPE_CYLINDER:		d3d_model_cylinder(__ind, __args[0], __args[1], __args[2], __args[3], __args[4], __args[5], __args[6], __args[7], round(__args[8]), round(__args[9])); break;
			case e__YYMKIND.SHAPE_CONE:			d3d_model_cone(__ind, __args[0], __args[1], __args[2], __args[3], __args[4], __args[5], __args[6], __args[7], round(__args[8]), round(__args[9])); break;
			case e__YYMKIND.SHAPE_ELLIPSOID:	d3d_model_ellipsoid(__ind, __args[0], __args[1], __args[2], __args[3], __args[4], __args[5], __args[6], __args[7], round(__args[8])); break;
			case e__YYMKIND.SHAPE_WALL:			d3d_model_wall(__ind, __args[0], __args[1], __args[2], __args[3], __args[4], __args[5], __args[6], __args[7]); break;
			case e__YYMKIND.SHAPE_FLOOR:		d3d_model_floor(__ind, __args[0], __args[1], __args[2], __args[3], __args[4], __args[5], __args[6], __args[7]); break;		
		};
	
		__currthing++;
	}

	
	file_text_close(__file);


}
