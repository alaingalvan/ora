//Orb Engine 4
//By Alain Galvan
//Last Revision: 06/15/12
////////////////////////////////////////////////////////////////////////////////////////
//Draw Code
//This is the script that is in charge of controlling all Graphics of Orb. THis script is
//programmed such that it could work in both a 2D environment or a 3D environment.
////////////////////////////////////////////////////////////////////////////////////////
{
  d3d_set_lighting(false);
  d3d_set_hidden(false);
  draw_set_blend_mode(bm_add);
  draw_set_color(image_blend);
  //draw_set_alpha(image_alpha*.1)
  //d3d_draw_floor(x - (128*image_scale), y - (128*image_scale), z, x + (128*image_scale), y + (128*image_scale), z, global.tex_ora_largeglow, 1, 1);
  draw_set_alpha(image_alpha);
  d3d_draw_floor(
    x - 32 * image_scale,
    y - 32 * image_scale,
    z,
    x + 32 * image_scale,
    y + 32 * image_scale,
    z,
    global.tex_ora_smallglow,
    1,
    1
  );
  draw_set_color(c_white);
  d3d_draw_floor(
    x - 32 * image_scale,
    y - 32 * image_scale,
    z,
    x + 32 * image_scale,
    y + 32 * image_scale,
    z,
    global.tex_ora_mediumglow,
    1,
    1
  );
  draw_set_blend_mode(bm_normal);
  draw_set_alpha(1);
  d3d_set_hidden(true);
}
