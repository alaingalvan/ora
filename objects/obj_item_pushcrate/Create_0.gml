//x=0
//y=0
z = -64;
xlength = 64;
ylength = 64;
zlength = 64;

falling = false;
fallspeed = 0;
fall = 0;
in_water = false;
splashc = 1;
spawn = room_speed * 300;
alarm[0] = spawn;
doonce = false;
sides = sprite_get_texture(spr_item_pushcrate, 0);
