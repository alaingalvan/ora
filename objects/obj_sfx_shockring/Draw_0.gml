if (radius < r_max) {
  radius += spd;
} else {
  instance_destroy();
}

var o, c, xx, yy, a, sx, sy;

o = (-radius + r_max) / 5; //Distortion offset
c = 0; //Multiplier for ring segments
a = 1 / (r_max / spd); //Alpha modifier
sx = tex_w / srf_w; //Texture x coord
sy = tex_h / srf_h; //texture y coord

//Draw the inner part of the ring
draw_primitive_begin_texture(pr_trianglestrip, tex);
for (var __i = 0; __i < 16; __i++) {
  xx = x + lengthdir_x(radius, c * d);
  yy = y + lengthdir_y(radius, c * d);
  draw_vertex_texture_color(
    xx,
    yy,
    sx * (xx + lengthdir_x(o, c * d)),
    sy * (yy + lengthdir_y(o, c * d)),
    c_white,
    image_alpha
  );
  xx = x + lengthdir_x(radius - ww, c * d);
  yy = y + lengthdir_y(radius - ww, c * d);
  draw_vertex_texture_color(xx, yy, sx * xx, sy * yy, c_white, 0);
  c += 1;
}
draw_primitive_end();
c = 0;
//Draw the outer part of the ring
draw_primitive_begin_texture(pr_trianglestrip, tex);
for (var __i = 0; __i < 16; __i++) {
  xx = x + lengthdir_x(radius + ww, c * d);
  yy = y + lengthdir_y(radius + ww, c * d);
  draw_vertex_texture_color(xx, yy, sx * xx, sy * yy, c_white, 0);
  xx = x + lengthdir_x(radius, c * d);
  yy = y + lengthdir_y(radius, c * d);
  draw_vertex_texture_color(
    xx,
    yy,
    sx * (xx + lengthdir_x(o, c * d)),
    sy * (yy + lengthdir_y(o, c * d)),
    c_white,
    image_alpha
  );
  c += 1;
}
draw_primitive_end();
image_alpha -= a;

/*
// Convert 3D coordinates to 2D screen coordinates.
// Convert_3d(targetx,targety,targetz,xfrom,from,zfrom,view)
convert_3d(x, y, z+sin(relic_hover)*0.5,global.cam_xfrom,global.cam_yfrom,global.cam_zfrom,0);
fx_2d = x_2d;
fy_2d = y_2d;
//distance.
convert_3d(x+lengthdir_x(global.cam_distance,global.cam_angle_x+90), y+lengthdir_y(global.cam_distance,global.cam_angle_y+90), z+sin(relic_hover)*0.5,global.cam_xfrom,global.cam_yfrom,global.cam_zfrom,0);
d = sqrt((x_2d-fx_2d)*(x_2d-fx_2d) + (y_2d-fy_2d)*(y_2d-fy_2d))/275;

// Draw the 2 rings made up of vertexes to create the effect 
d3d_model_clear(circle_model1);
d3d_model_clear(circle_model2);

light_animate += random(0.25);
s = 10+sin(light_animate)*3;
d3d_model_primitive_begin(circle_model1, pr_trianglestrip);
d3d_model_primitive_begin(circle_model2, pr_trianglestrip);

var i;
i = -15;
repeat(25)
{
    i += 15;

    lx = cos(i * pi180) * d;
    ly = -sin(i * pi180) * d;

    xx = lx * s * 300;
    yy = ly * s * 300;
    tx = (fx_2d + xx) / 1280;
    ty = (fy_2d + yy) / 800;
    d3d_model_vertex_texture(circle_model1, fx_2d + xx, fy_2d + yy, 0, tx, ty);

    xx = lx * s * (150 + 150 * (s / 0.95));
    yy = ly * s * (150 + 150 * (s / 0.95));
    tx = (fx_2d + xx * (0.7 + 0.3 * (s / 0.95))) / 960;
    ty = (fy_2d + yy * (0.7 + 0.3 * (s / 0.95))) / 600;
    d3d_model_vertex_texture(circle_model1, fx_2d + xx, fy_2d + yy, 0, tx, ty);
    d3d_model_vertex_texture(circle_model2, fx_2d + xx, fy_2d + yy, 0, tx, ty);

    xx = lx * s * 300 * (s / 0.95);
    yy = ly * s * 300 * (s / 0.95);
    tx = (fx_2d + xx) / 960;
    ty = (fy_2d + yy) / 600;
    d3d_model_vertex_texture(circle_model2, fx_2d + xx, fy_2d + yy, 0, tx, ty);
}

d3d_model_primitive_end(circle_model1);
d3d_model_primitive_end(circle_model2);

draw_set_color(c_white);
d3d_model_draw(circle_model2, x, y, z, tex);
d3d_model_draw(circle_model1, x, y, z, tex);

/* */
/*  */
