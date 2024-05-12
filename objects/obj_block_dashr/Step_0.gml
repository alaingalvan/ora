if (instance_exists(obj_orb)) {
  if (collision_rectangle(x, y, x + xlength, y + ylength, obj_orb, 0, 0)) {
    obj_orb.hspd += dash;
  }
}
if (instance_exists(obj_orb2)) {
  if (collision_rectangle(x, y, x + xlength, y + ylength, obj_orb2, 0, 0)) {
    obj_orb2.hspd += dash;
  }
}
