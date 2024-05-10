function camera_draw() {
    //camera_draw()
    d3d_set_projection_ext(xfrom, yfrom, zfrom, xto, yto, zto, xup, yup, zup, fov, aspect_ratio, 1, zfar);
}
