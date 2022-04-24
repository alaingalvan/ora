//Orb Engine 4
//By Alain Galvan
//Last Revision: 06/15/12
////////////////////////////////////////////////////////////////////////////////////////
//Draw Code
//This is the script that is in charge of controlling all Graphics of Orb. THis script is 
//programmed such that it could work in both a 2D environment or a 3D environment. 
////////////////////////////////////////////////////////////////////////////////////////
{
d3d_set_lighting(false) 
d3d_set_hidden(false);
    var tex0,tex1,tex2;
  tex0 = sprite_get_texture(spr_orb,0);
  tex1 = sprite_get_texture(spr_orb,1);
  tex2 = sprite_get_texture(spr_orb,2);
  draw_set_blend_mode(bm_add)
  draw_set_color(image_blend)
  d3d_draw_floor(xprevious-128,yprevious-128,z,xprevious+128,yprevious+128,z,tex2,1,1);
  
  d3d_draw_floor(xprevious-32,yprevious-32,z,xprevious+32,yprevious+32,z,tex0,1,1);
  draw_set_color(c_white)
  d3d_draw_floor(xprevious-32,yprevious-32,z,xprevious+32,yprevious+32,z,tex1,1,1);
draw_set_blend_mode(bm_normal)

d3d_set_hidden(true);
}

