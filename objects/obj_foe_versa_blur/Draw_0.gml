d3d_set_lighting(false) 
{
d3d_set_hidden(false);
    var tex0,tex1;
  tex0 = sprite_get_texture(spr_foe_anti,0);
  tex1 = sprite_get_texture(spr_foe_anti,1);
  draw_set_blend_mode(bm_normal)
  draw_set_alpha(image_alpha)
  draw_set_color(image_blend)
  d3d_draw_floor(xprevious-(32*image_scale),yprevious-(32*image_scale),z,xprevious+(32*image_scale),yprevious+(32*image_scale),z,tex0,1,1);
  draw_set_color(c_white)
  d3d_draw_floor(xprevious-(32*image_scale),yprevious-(32*image_scale),z,xprevious+(32*image_scale),yprevious+(32*image_scale),z,tex1,1,1);
draw_set_blend_mode(bm_normal)
draw_set_alpha(1)
d3d_set_hidden(true);
}
d3d_set_lighting(true) 
