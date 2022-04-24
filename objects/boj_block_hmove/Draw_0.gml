//Top wall
d3d_draw_wall(x,y,z,x+(image_xscale*xlength),y,z+zlength,top,image_xscale,2);
//facing wall
d3d_draw_floor(x,y,z,x+xlength*image_xscale,y+ylength,z,front,image_xscale,1);
//Bottom wall
d3d_draw_wall(x,y+ylength,z,x+(image_xscale*xlength),y+ylength,z+zlength,top,image_xscale,2);
//left wall
d3d_draw_floor(x,y,z,x,y+ylength,z+zlength,front,2,1);
//right wall
d3d_draw_floor(x+(image_xscale*xlength),y,z,x+(image_xscale*xlength),y+ylength,z+zlength,front,2,1);

/*
//Each Texture is a face
for (a=0;a<image_xscale;a+=1)
{
{
//Top wall
d3d_draw_wall(x+(a*ylength),y,z,x+xlength+(a*ylength),y,z+zlength,top,1,2);
//facing wall
d3d_draw_floor(x+(a*ylength),y,z,x+xlength+(a*ylength),y+ylength,z,front,1,1);
//Bottom wall
d3d_draw_wall(x+(a*ylength),y+ylength,z,x+xlength+(a*ylength),y+ylength,z+zlength,top,1,2);
//left wall
d3d_draw_floor(x+(a*ylength),y,z,x+(a*ylength),y+ylength,z+zlength,front,2,1);
//right wall
d3d_draw_floor(x+xlength+(a*ylength),y,z,x+xlength+(a*ylength),y+ylength,z+zlength,front,2,1);
}
}

/* */
/*  */
