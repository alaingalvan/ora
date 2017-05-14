//Cam Angle / Distance / FOV
global.cam_angle_y = 135;
global.cam_angle_x = 89;
global.cam_distance = 800;
global.cam_fov = 45;

//Banding
global.cam_angle_changex = global.cam_angle_x;
global.cam_angle_changey = global.cam_angle_y;
global.cam_changedistance = global.cam_distance;
global.cam_changefov = global.cam_fov;

//Cam Translate
global.cam_xto = 0;
global.cam_yto = 0;
global.cam_zto = 0;

global.cam_xfrom = global.cam_xto + (cos(global.cam_angle_x * pi180) * cos(global.cam_angle_y * pi180) * global.cam_distance);
global.cam_yfrom = global.cam_yto - (sin(global.cam_angle_x * pi180) * cos(global.cam_angle_y * pi180) * global.cam_distance);
global.cam_zfrom = global.cam_zto + (sin(global.cam_angle_y * pi180) * global.cam_distance);

//  Up vector
global.cam_up_x = 0;
global.cam_up_y = 0;
global.cam_up_z = 1;


global.mb_middle_event_x = mouse_x;
global.mb_middle_event_y = mouse_y;
