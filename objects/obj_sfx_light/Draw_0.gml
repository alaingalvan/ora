d3d_set_lighting(false) 
d3d_set_hidden(false);
    var tex0,tex1,tex2;
  tex2 = sprite_get_texture(spr_orb,2);
  draw_set_blend_mode(bm_add)
  draw_set_color(c_white)
  d3d_draw_floor(xprevious-256,yprevious-256,z,xprevious+256,yprevious+256,z,tex2,1,1);
draw_set_blend_mode(bm_normal)

d3d_set_hidden(true);

