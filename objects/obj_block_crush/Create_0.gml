z = 0;
xlength = 64;
ylength = 64;
zlength = -128;
doonce = false;

frontwall = background_get_texture(bac_tex_wall);
sides = background_get_texture(bac_tex_walldepth);
top = background_get_texture(spr_bac_tex_floor);

doonce = false;
canfall = false;
fall = false;

if (global.difficulty == 1) {
  timer = 10;
}
if (global.difficulty == 0) {
  timer = 20;
}
