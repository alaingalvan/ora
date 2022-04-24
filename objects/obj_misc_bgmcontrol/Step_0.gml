var bgm_vol;
bgm_vol =(global.bgm_volume / 100) * 0.5;
//Fade in Volume
if (fade == 1)
{
    if (vol < bgm_vol)
    {
        vol += 0.025;
    }
}

//Fade out Volume
if (fade == 0)
{
    if (vol > 0.0)
    {
        vol -= 0.01;
    }
}
vol = clamp(vol, 0, bgm_vol)

//Track Selection
switch (room)
{
case men_main:
    //Ini Song
    if (!ini && !sound_isplaying(sou_bgm_selection))
    {
        ini = true;
        fade = 1;
        sound_loop(sou_bgm_selection);
    }
    //Modify Volume
    sound_volume(sou_bgm_selection, vol);
    //Transition out
    if (instance_exists(obj_sfx_transload) || instance_exists(obj_sfx_transexit) || instance_exists(obj_sfx_tran0))
    {
        fade = 0;
    }

    break;
case lev_chamber0:
case lev_chamber1:
case lev_chamber2:
case lev_chamber3:
case lev_chamber4:
case lev_chamber5:
case lev_chamber6:
case lev_chamber7:
case lev_chamber8:
case lev_chamber9:

    //Ini Song
    if (!ini && !sound_isplaying(sou_bgm_dimensions))
    {
        ini = true;
        fade = 1;
        sound_loop(sou_bgm_dimensions);
    }
    //Modify Volume
    sound_volume(sou_bgm_dimensions, vol)
    //Transition out
    if (instance_exists(obj_sfx_transmenu))
    {
        fade = 0;
    }
    break;
}

