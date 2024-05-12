if (place_free(x, y + 1)) {
  falling = true;
} else {
  falling = false;
}

//Fix gltich involving overshot of block
if (falling == false && instance_exists(obj_orb)) {
  if (
    place_meeting(x - 2, y, obj_orb) &&
    place_free(x + 1, y) &&
    obj_orb.right == true &&
    !obj_orb.left == true &&
    !place_free(x, obj_orb.y + 2)
  ) {
    hspeed += 8;
  }
  if (
    place_meeting(x + 2, y, obj_orb) &&
    place_free(x - 1, y) &&
    obj_orb.left == true &&
    !obj_orb.right == true &&
    !place_free(x, obj_orb.y + 2)
  ) {
    hspeed -= 8;
  }
}

if (!instance_exists(obj_orb)) {
  if (doonce == false) {
    doonce = true;
    alarm[0] = 29;
  }
}
fall += 1;
if (falling == true) {
  if (!place_meeting(x, y + 1, obj_water_par)) {
    gravity_direction = 270;
    gravity = 1;
  } else {
    gravity_direction = 270;
    gravity = 0.2;
  }
}
if ((falling = false)) {
  gravity = 0;
}

hspeed = round(hspeed);
if (instance_exists(obj_orb)) {
  if (obj_orb.left == false && obj_orb.right == false) {
    if (hspeed > 0) {
      hspeed -= 4;
    }
    if (hspeed < 0) {
      hspeed += 4;
    }
  }

  if (
    place_meeting(x, y + 1, obj_orb) &&
    vspeed > 0 &&
    place_meeting(x, y - 64, obj_block_par)
  ) {
    with (obj_orb) {
      instance_destroy();
    }
  }

  //If you're stuck and inside the block
  if (place_meeting(x, y, obj_orb)) {
    with (obj_orb) {
      instance_destroy();
    }
  }
}
