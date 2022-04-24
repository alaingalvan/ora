
//left wall
d3d_draw_floor(x,y,z,x,y+(ylength*image_yscale),z+zlength,global.tex_db_front,2,image_yscale);
//facing wall
d3d_draw_floor(x,y,z,x+xlength,y+(ylength*image_yscale),z,global.tex_db_front,1,image_yscale);
//right wall
d3d_draw_floor(x+xlength,y,z,x+xlength,y+(ylength*image_yscale),z+zlength,global.tex_db_front,2,image_yscale);
//Top wall
d3d_draw_wall(x,y,z,x+xlength,y,z+zlength,global.tex_db_floor,1,2);
//Bottom wall
d3d_draw_wall(x,y+(ylength*image_yscale),z,x+xlength,y+(ylength*image_yscale),z+zlength,global.tex_db_floor,1,2);
/*
//Draw face per tex
for (a=0;a<image_yscale;a+=1)
{
//left wall
d3d_draw_floor(x,y+(a*ylength),z,x,y+(a*ylength)+ylength,z+zlength,global.tex_db_front,2,1);
//facing wall
d3d_draw_floor(x,y+(a*ylength),z,x+xlength,y+ylength+(a*ylength),z,global.tex_db_front,1,1);
//right wall
d3d_draw_floor(x+xlength,y+(a*ylength),z,x+xlength,y+ylength+(a*ylength),z+zlength,global.tex_db_front,2,1);
//Top wall
d3d_draw_wall(x,y+(a*ylength),z,x+xlength,y+(a*ylength),z+zlength,global.tex_db_floor,1,2);
//Bottom wall
d3d_draw_wall(x,y+ylength+(a*ylength),z,x+xlength,y+ylength+(a*ylength),z+zlength,global.tex_db_floor,1,2);
}

/* */
/*  */
