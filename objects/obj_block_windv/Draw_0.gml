
//Top wall
d3d_draw_wall(x,y,z,x+xlength,y,z+zlength,pad,1,2);
//facing wall
d3d_draw_floor(x,y,z,x+xlength,y+ylength,z,pad,1,1);
//Bottom wall
d3d_draw_wall(x,y+ylength,z,x+xlength,y+ylength,z+zlength,pad,1,2);
//left wall
d3d_draw_floor(x,y,z,x,y+ylength,z+zlength,pad,2,1);
//right wall
d3d_draw_floor(x+xlength,y,z,x+xlength,y+ylength,z+zlength,pad,2,1);


