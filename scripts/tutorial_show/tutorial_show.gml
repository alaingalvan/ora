function tutorial_show(argument0) {
  if (instance_exists(obj_sfx_tutmessage)) {
    with (obj_sfx_tutmessage) {
      alarm[1] = 1;
    }
  }

  var _cur_instance;
  _cur_instance = instance_create(0, 0, obj_sfx_tutmessage);
  _cur_instance.image_index = argument0;
}
