if (canmove == true) {
  if (place_meeting(x, y - 1, obj_orb)) {
    hspeed = obj_player.hspd;
  }
}

if (
  !position_meeting(x, y, obj_block_water) ||
  !position_meeting(x, y, obj_block_void)
) {
  gravity = 1;
}

if (
  position_meeting(x, y + 1, obj_block_void) ||
  position_meeting(x, y + 1, obj_block_water)
) {
  gravity = 0;
  vspeed = 0;
  canmove = true;
  in_water = 1;
  falling = false;
}
