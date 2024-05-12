if (instance_exists(obj_orb)) {
  //If Orb is on top of block
  if (
    obj_orb.x > x &&
    obj_orb.x < x + xlength &&
    !collision_line(x, y, obj_orb.x, obj_orb.y, obj_block_par, false, true) &&
    canfall == false
  ) {
    //after (timer) seconds, the block falls.
    canfall = true;
    alarm[0] = timer;
  }

  //If the block falls on you
  if (place_meeting(x, y + 2, obj_orb) && vspeed > 0) {
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

//Terminal Speed
if (vspeed > 8) {
  vspeed = 8;
}

//Accelerate once you can fall.
if (fall == true) {
  gravity += 0.25;
}

if (!instance_exists(obj_orb)) {
  if (doonce == false) {
    doonce = true;
    alarm[1] = 29;
  }
}
