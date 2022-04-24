//Top wall
//point_distance(obj_camera.x,obj_camera.y,x,y)
//make_color_hsv()
//draw_set_color()
d3d_draw_wall(x,y,z,x+(image_xscale*xlength),y,z+zlength,global.tex_db_floor,image_xscale,2);
//facing wall
d3d_draw_floor(x,y,z,x+xlength*image_xscale,y+ylength,z,global.tex_db_fronttop,image_xscale,1);
//Bottom wall
d3d_draw_wall(x,y+ylength,z,x+(image_xscale*xlength),y+ylength,z+zlength,global.tex_db_floor,image_xscale,2);
//left wall
d3d_draw_floor(x,y,z,x,y+ylength,z+zlength,global.tex_db_fronttop,2,1);
//right wall
d3d_draw_floor(x+(image_xscale*xlength),y,z,x+(image_xscale*xlength),y+ylength,z+zlength,global.tex_db_fronttop,2,1);
/*
//Each Texture is a face
for (a=0;a<image_xscale;a+=1)
{
{
//Top wall
d3d_draw_wall(x+(a*ylength),y,z,x+xlength+(a*ylength),y,z+zlength,global.tex_db_floor,1,2);
//facing wall
d3d_draw_floor(x+(a*ylength),y,z,x+xlength+(a*ylength),y+ylength,z,global.tex_db_fronttop,1,1);
//Bottom wall
d3d_draw_wall(x+(a*ylength),y+ylength,z,x+xlength+(a*ylength),y+ylength,z+zlength,global.tex_db_floor,1,2);
//left wall
d3d_draw_floor(x+(a*ylength),y,z,x+(a*ylength),y+ylength,z+zlength,global.tex_db_fronttop,2,1);
//right wall
d3d_draw_floor(x+xlength+(a*ylength),y,z,x+xlength+(a*ylength),y+ylength,z+zlength,global.tex_db_fronttop,2,1);
}
}

/* */
/*  */
