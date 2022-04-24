xlength=64
ylength=64
zlength=-64

d3d_draw_wall(select_x,select_y,select_z,select_x+(image_xscale*xlength),select_y,select_z+zlength,cursor,1,1);
//facing wall
d3d_draw_floor(select_x,select_y,select_z,select_x+xlength*image_xscale,select_y+ylength,select_z,cursor,1,1);
//Bottom wall
d3d_draw_wall(select_x,select_y+ylength,select_z,select_x+(image_xscale*xlength),select_y+ylength,select_z+zlength,cursor,1,1);
//left wall
d3d_draw_floor(select_x,select_y,select_z,select_x,select_y+ylength,select_z+zlength,cursor,1,1);
//right wall
d3d_draw_floor(select_x+(image_xscale*xlength),select_y,select_z,select_x+(image_xscale*xlength),select_y+ylength,select_z+zlength,cursor,1,1);
draw_set_color(c_white)


