//Resolution set
//changes the resolution of the screen in response to argument0.
global.fullscreen=false
//global.disw=1280
//global.dish=800
switch (argument0)
{
case 0: //Auto
sc_res(0,0)
window_set_fullscreen(true)
break;
case 1: //480p 16x10
view_wview[0] = 768;
view_hview[0] = 480;
view_wport[0] = 768;
view_hport[0] = 480;
view_enabled = 1;
window_set_fullscreen(global.fullscreen)
break;
case 2: //720p 16x9
window_set_size(1280, 720);
window_set_fullscreen(global.fullscreen)
break;
case 3: //800p 16x10
window_set_size(1280, 800);
window_set_fullscreen(global.fullscreen)
break;
case 4: //800p 16x10
window_set_size(1280, 800);
window_set_fullscreen(global.fullscreen)
break;
}
