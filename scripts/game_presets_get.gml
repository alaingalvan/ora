//Returns an int defining what the current preset is.
//-1 = custom, 0 = Minimum, 1 = Low, 2 = Default, 3 = High, 4 = Maximum.

//Minimum
//No Antialiasing, No Vsync, No Post-Processing, No DOFs, No Motion Blur, No Shadows, No Lights, 30 FPS Max, 
/*
    global.postprocess == 0
    global.antialiasing == 0
    global.vsync == false
    global.dof == false
    global.cutscene_dof == false
    global.motionblur = ini_read_real("Graphics", "Motion Blur", 0)
    global.renderrange = ini_read_real("Graphics", "Render Distance", 0)
    global.framelimit = ini_read_real("Graphics", "Frame Limit", 30)
    global.texture_quality = ini_read_real("Graphics", "Texture Quality", 0) //0 and 1 are max, everything above that will be how much textures scale down.
    global.ssao = false
    global.shadow_quality = ini_read_real("Graphics", "Shadow Quality", 0) //same as texture quality. 
*/
return -1;
