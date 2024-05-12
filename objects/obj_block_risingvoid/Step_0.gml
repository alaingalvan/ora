y -= m;
if (collision_rectangle(0, y, room_width, y + 640, obj_orb, false, false)) {
  room_restart();
}
