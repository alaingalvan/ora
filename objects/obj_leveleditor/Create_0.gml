//3D mouse initialization
convert_prepare(
  obj_camera.xfrom,
  obj_camera.yfrom,
  obj_camera.zfrom,
  obj_camera.xto,
  obj_camera.yto,
  obj_camera.zto,
  obj_camera.xup,
  obj_camera.yup,
  obj_camera.zup,
  obj_camera.fov,
  global.aspect_ratio
);
select_x = 0;
select_y = 0;
select_z = 0;
cur_select = noone; //The current instance selected.
cur_tool = 0; //0 = draw 1 = select, 2 = erase

//Hierarchy Selection and Rendering
hierarchy_ini();
cur_window = 0; // 0 = Prefab Hierarchy | 1 = File Manager | 2 = Instance Viewer
cur_x = 0;
cur_y = 0;
sel_x = -1;
sel_y = -1;
//cur_list X = index Y = param (obj, spr, name)
folder_goto("root");
line_width = 3;
list_scroll = 0;
list_scroll_band = 0; //value that list_scroll approches.

//The current object that gets created.
cur_object = obj_block_floor;
//String that stores the list of folders.
hierarchy = "Environments > Infinity Plains";
//if the editor is minimized.
editorclosed = false;
//if a drop down menu is currently active.
dropdown = false;
//cursor = instance_create(select_x,select_y,cur_object)

placeover = -1;
//mask_index = cur_object.mask_index
d3d_on = true;
cursor = background_get_texture(bac_oe_cursor);
