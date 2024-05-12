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
  d3d_draw_floor(
    xprevious - 128,
    yprevious - 128,
    z,
    xprevious + 128,
    yprevious + 128,
    z,
    global.tex_ora_largeglow,
    1,
    1
  );

  d3d_draw_floor(
    xprevious - 32,
    yprevious - 32,
    z,
    xprevious + 32,
    yprevious + 32,
    z,
    global.tex_ora_smallglow,
    1,
    1
  );
  draw_set_color(c_white);
  d3d_draw_floor(
    xprevious - 32,
    yprevious - 32,
    z,
    xprevious + 32,
    yprevious + 32,
    z,
    global.tex_ora_mediumglow,
    1,
    1
  );
  draw_set_blend_mode(bm_normal);

  draw_set_color(c_white);
  d3d_set_hidden(true);
}
