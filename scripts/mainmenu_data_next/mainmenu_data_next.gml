function mainmenu_data_next(argument0) {
	//mainmenu_data_next(category)
	//This script returns a string based on the inputed string. This is for options related stuff.
	var sel;
	sel = string_lower(argument0)
	if !trigger
	{

	    if string_lower(cur_menu) == "gameplay"
	    {
	        if (sel == "difficulty")
	        {
	            global.difficulty = (global.difficulty + 1) mod 3;
	        }
	        if (sel == "subtitles")
	        {
	            global.captions = (global.captions + 1) mod 3;
	        }
	        if (sel == "commentary")
	        {
	            global.commentary = !(global.commentary);
	        }
	        if (sel == "language")
	        {
	            global.language = (global.language + 1) mod 1;
	        }
	    }

	    if string_lower(cur_menu) == "graphics"
	    {
	        if (sel == "resolution")
	        {
	            res_preset_set((res_preset_get() + 1) mod 5);
	        }
	        if (sel == "aspect ratio")
	        {
	            aspect_preset_set((aspect_preset_get() + 1) mod 3);
	        }
	        if (sel == "fullscreen")
	        {
	            global.fullscreen = !global.fullscreen;
	        }
	        if (sel == "vsync")
	        {
	            global.vsync = !global.vsync;
	        }
	        if (sel == "presets")
	        {
	            //return "Custom"
	        }

	    }

	    if string_lower(cur_menu) == "advanced graphics"
	    {
	        if (sel == "anti-aliasing")
	        {
	            global.antialiasing = (global.antialiasing + 2) mod 10;
	        }
	        if (sel == "framelimit")
	        {
	            global.framelimit = (global.framelimit + 10) mod 130;
	            if (global.framelimit == 0)
	            {
	                global.framelimit = 10;
	            }
	        }
	        if (sel == "textures")
	        {
	            //return string(global.antialiasing) + "x"
	        }
	        if (sel == "shadows")
	        {
	            //return string(global.antialiasing) + "x"
	        }
	        if (sel == "anisotropic filtering")
	        {
	            // return string(global.antialiasing) + "x"
	        }
	        if (sel == "post-processing")
	        {
	            //return string(global.antialiasing) + "x"
	        }
	        if (sel == "cutscene dof")
	        {
	            //return string(global.antialiasing) + "x"
	        }
	        if (sel == "gameplay dof")
	        {
	            //return string(global.antialiasing) + "x"
	        }
	        if (sel == "motion blur")
	        {
	            global.motionblur = !global.motionblur;
	        }
	        if (sel == "ssao")
	        {
	            global.ssao = !global.ssao;

	        }
	    }

	    if string_lower(cur_menu) == "sound"
	    {
	        if (sel == "master volume")
	        {
	            global.master_volume = clamp(global.master_volume + 10, 0, 100);
	        }
	        if (sel == "bgm volume")
	        {
	            global.bgm_volume = clamp(global.bgm_volume + 10, 0, 100);
	        }
	        if (sel == "effects volume")
	        {
	            global.sfx_volume = clamp(global.sfx_volume + 10, 0, 100);
	        }
	        if (sel == "voice volume")
	        {
	            global.dialogue_volume = clamp(global.dialogue_volume + 10, 0, 100);
	        }

	    }

	    trigger = true
	    alarm[0] = (room_speed / 5) / global.delta_fps
	}



}
