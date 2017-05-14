//This script returns a string based on the inputed string. This is for options related stuff.
var sel;
sel = string_lower(argument0)

if string_lower(cur_menu) == "gameplay"
{
    if (sel == "difficulty")
    {
        if global.difficulty == 0
        {
            return "Casual"
        }
        if global.difficulty == 1
        {
            return "Normal"
        }
        if global.difficulty == 2
        {
            return "Challenging"
        }
    }
    if (sel == "subtitles")
    {
        if global.captions == 0
        {
            return "Off"
        }
        if global.captions == 1
        {
            return "Sub"
        }
        if global.captions == 2
        {
            return "CC"
        }
    }
    if (sel == "commentary")
    {
        if global.commentary
        {
            return "On"
        }
        else
        {
            return "Off"
        }
    }
    if (sel == "language")
    {
        if (global.language == 0)
        {
            return "English";
        }
        if (global.language == 1)
        {
            return "Español";
        }
        if (global.language == 2)
        {
            return "日本語";
        }
        if (global.language = 3)
        {
            return "中文";
        }
    }
}
if string_lower(cur_menu) == "graphics"
{
    if (sel == "resolution")
    {
        return string(global.res_x) + "x" + string(global.res_y)
    }
    if (sel == "aspect ratio")
    {
        return aspect_string();
    }
    if (sel == "fullscreen")
    {
        if global.fullscreen
        {
            return "On"
        }
        else
        {
            return "Off"
        }
    }
    if (sel == "vsync")
    {
        if global.vsync
        {
            return "On"
        }
        else
        {
            return "Off"
        }
    }
    if (sel == "presets")
    {
        return game_presets_string();
    }

}
if string_lower(cur_menu) == "advanced graphics"
{
    if (sel == "anti-aliasing")
    {
        return string(global.antialiasing) + "x"
    }
    if (sel == "framelimit")
    {
        if global.framelimit < 120
        {
            return string(global.framelimit) + " FPS"
        }
        else
        {
            return "Unlimited"
        }
    }
    if (sel == "textures")
    {
        return string(global.antialiasing) + "x"
    }
    if (sel == "shadows")
    {
        return string(global.antialiasing) + "x"
    }
    if (sel == "anisotropic filtering")
    {
        return string(global.antialiasing) + "x"
    }
    if (sel == "post-processing")
    {
        return string(global.antialiasing) + "x"
    }
    if (sel == "cutscene dof")
    {
        return string(global.antialiasing) + "x"
    }
    if (sel == "gameplay dof")
    {
        return string(global.antialiasing) + "x"
    }
    if (sel == "motion blur")
    {
        if global.motionblur
        {
            return "On"
        }
        else
        {
            return "Off"
        }
    }
    if (sel == "ssao")
    {
        if global.ssao
        {
            return "On"
        }
        else
        {
            return "Off"
        }
    }

}
if string_lower(cur_menu) == "sound"
{
    if (sel == "master volume")
    {
        return string(global.master_volume)
    }
    if (sel == "bgm volume")
    {
        return string(global.bgm_volume)
    }
    if (sel == "effects volume")
    {
        return string(global.sfx_volume)
    }
    if (sel == "voice volume")
    {
        return string(global.dialogue_volume)
    }

}
return ""
