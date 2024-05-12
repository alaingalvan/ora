//Orb Engine 4
//By Alain Galvan
//Last Revision: 06/15/12
////////////////////////////////////////////////////////////////////////////////////////
//Draw Code
//Versa Beta is a being with 3 legs that behaves like a tripod like creature.
//It has therefore 4 mathmatical points that are interconnected. They move such that they
//look parabolic, and as they approch the middle of the being, they become linear.
////////////////////////////////////////////////////////////////////////////////////////

d3d_set_lighting(false);
d3d_set_hidden(false);
var tex0, tex1, tex2;
tex0 = sprite_get_texture(spr_foe_anti, 0);
tex1 = sprite_get_texture(spr_foe_anti, 1);
tex2 = sprite_get_texture(spr_foe_anti, 2);
draw_set_blend_mode(bm_normal);
draw_set_color(image_blend);
//Main Body
d3d_draw_floor(x0 - 128, y0 - 128, z, x0 + 128, y0 + 128, z, tex2, 1, 1);

//Leg 1
d3d_draw_floor(x1 - 16, y1 - 16, z, x1 + 16, y1 + 16, z, tex2, 1, 1);

//Leg 2
d3d_draw_floor(x2 - 16, y2 - 16, z, x2 + 16, y2 + 16, z, tex2, 1, 1);

//Leg 3
d3d_draw_floor(x3 - 16, y3 - 16, z, x3 + 16, y3 + 16, z, tex2, 1, 1);

draw_set_color(c_white);
draw_set_blend_mode(bm_normal);

d3d_set_hidden(true);
