//camera_create(xto, yto, zto, distance, xangle, yangle)

with (instance_create(argument[0],argument[1],obj_camera)){
    z = argument[2];
    distance = argument[3];
    distance_band = argument[3];
    angle_x = argument[4];
    angle_x_band = argument[4];
    angle_y = argument[5];
    angle_y_band = argument[5];
}
