function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 1000000; // obj_camera
	global.__objectDepths[1] = 0; // obj_sfx_light
	global.__objectDepths[2] = -10; // obj_orb
	global.__objectDepths[3] = -10; // obj_orb_blur
	global.__objectDepths[4] = -10; // obj_orb2
	global.__objectDepths[5] = -10; // obj_orb_blur2
	global.__objectDepths[6] = 0; // obj_orb_death
	global.__objectDepths[7] = 0; // obj_orb2_death
	global.__objectDepths[8] = -1000000; // obj_sfx_shockring
	global.__objectDepths[9] = 0; // obj_block_checkpoint
	global.__objectDepths[10] = 0; // obj_block_floor
	global.__objectDepths[11] = 0; // obj_block_wall
	global.__objectDepths[12] = 10; // obj_block_backwall
	global.__objectDepths[13] = 0; // obj_block_invis
	global.__objectDepths[14] = -5; // obj_block_void
	global.__objectDepths[15] = 0; // obj_block_crush
	global.__objectDepths[16] = 0; // obj_item_pushcrate
	global.__objectDepths[17] = 0; // obj_block_fall
	global.__objectDepths[18] = -5; // obj_block_jumppad
	global.__objectDepths[19] = -5; // obj_block_dashu
	global.__objectDepths[20] = -5; // obj_block_dashr
	global.__objectDepths[21] = -5; // obj_block_windv
	global.__objectDepths[22] = 0; // boj_block_hmove
	global.__objectDepths[23] = 0; // obj_block_conveyorbelt
	global.__objectDepths[24] = -10; // obj_block_nextlv
	global.__objectDepths[25] = 0; // obj_block_tutorial
	global.__objectDepths[26] = 0; // obj_block_par
	global.__objectDepths[27] = 0; // obj_water_par
	global.__objectDepths[28] = 0; // obj_ladder_par
	global.__objectDepths[29] = 0; // obj_block_risingvoidini
	global.__objectDepths[30] = 0; // obj_block_raft
	global.__objectDepths[31] = -100; // obj_block_water
	global.__objectDepths[32] = 0; // obj_block_risingvoid
	global.__objectDepths[33] = 0; // obj_bounce_par
	global.__objectDepths[34] = 0; // obj_block_boss
	global.__objectDepths[35] = -100; // obj_mainmenu
	global.__objectDepths[36] = -1000; // obj_sfx_tran0
	global.__objectDepths[37] = -1000; // obj_sfx_tran1
	global.__objectDepths[38] = -1000; // obj_sfx_transload
	global.__objectDepths[39] = -1000; // obj_sfx_transmenu
	global.__objectDepths[40] = -1000; // obj_sfx_transexit
	global.__objectDepths[41] = -100; // object41
	global.__objectDepths[42] = 0; // obj_sfx_tutmessage
	global.__objectDepths[43] = 0; // obj_sfx_screenmessge
	global.__objectDepths[44] = 0; // obj_misc_bgmcontrol
	global.__objectDepths[45] = -10; // obj_foe_versa
	global.__objectDepths[46] = -10; // object46
	global.__objectDepths[47] = -100; // obj_foe_versa_blur
	global.__objectDepths[48] = 0; // obj_foe_par
	global.__objectDepths[49] = -1000; // obj_leveleditor
	global.__objectDepths[50] = -10000; // obj_oe_dropmenu_file
	global.__objectDepths[51] = 0; // obj_ui_par
	global.__objectDepths[52] = -10000000; // obj_console


	global.__objectNames[0] = "obj_camera";
	global.__objectNames[1] = "obj_sfx_light";
	global.__objectNames[2] = "obj_orb";
	global.__objectNames[3] = "obj_orb_blur";
	global.__objectNames[4] = "obj_orb2";
	global.__objectNames[5] = "obj_orb_blur2";
	global.__objectNames[6] = "obj_orb_death";
	global.__objectNames[7] = "obj_orb2_death";
	global.__objectNames[8] = "obj_sfx_shockring";
	global.__objectNames[9] = "obj_block_checkpoint";
	global.__objectNames[10] = "obj_block_floor";
	global.__objectNames[11] = "obj_block_wall";
	global.__objectNames[12] = "obj_block_backwall";
	global.__objectNames[13] = "obj_block_invis";
	global.__objectNames[14] = "obj_block_void";
	global.__objectNames[15] = "obj_block_crush";
	global.__objectNames[16] = "obj_item_pushcrate";
	global.__objectNames[17] = "obj_block_fall";
	global.__objectNames[18] = "obj_block_jumppad";
	global.__objectNames[19] = "obj_block_dashu";
	global.__objectNames[20] = "obj_block_dashr";
	global.__objectNames[21] = "obj_block_windv";
	global.__objectNames[22] = "boj_block_hmove";
	global.__objectNames[23] = "obj_block_conveyorbelt";
	global.__objectNames[24] = "obj_block_nextlv";
	global.__objectNames[25] = "obj_block_tutorial";
	global.__objectNames[26] = "obj_block_par";
	global.__objectNames[27] = "obj_water_par";
	global.__objectNames[28] = "obj_ladder_par";
	global.__objectNames[29] = "obj_block_risingvoidini";
	global.__objectNames[30] = "obj_block_raft";
	global.__objectNames[31] = "obj_block_water";
	global.__objectNames[32] = "obj_block_risingvoid";
	global.__objectNames[33] = "obj_bounce_par";
	global.__objectNames[34] = "obj_block_boss";
	global.__objectNames[35] = "obj_mainmenu";
	global.__objectNames[36] = "obj_sfx_tran0";
	global.__objectNames[37] = "obj_sfx_tran1";
	global.__objectNames[38] = "obj_sfx_transload";
	global.__objectNames[39] = "obj_sfx_transmenu";
	global.__objectNames[40] = "obj_sfx_transexit";
	global.__objectNames[41] = "object41";
	global.__objectNames[42] = "obj_sfx_tutmessage";
	global.__objectNames[43] = "obj_sfx_screenmessge";
	global.__objectNames[44] = "obj_misc_bgmcontrol";
	global.__objectNames[45] = "obj_foe_versa";
	global.__objectNames[46] = "object46";
	global.__objectNames[47] = "obj_foe_versa_blur";
	global.__objectNames[48] = "obj_foe_par";
	global.__objectNames[49] = "obj_leveleditor";
	global.__objectNames[50] = "obj_oe_dropmenu_file";
	global.__objectNames[51] = "obj_ui_par";
	global.__objectNames[52] = "obj_console";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
