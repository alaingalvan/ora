//Orb Engine 4
//By Alain Galvan
//Last Revision: 10/26/12
////////////////////////////////////////////////////////////////////////////////////////
//Implement:
//Allow the
//New Motion engine that supports:
//Slopes
//Higher max Hspeed
//Screen Zooms out and averages on bouncing at high frequencies.
//Implement Box Physics
//Fullscreen Fix
//Options Implemtation
//Adjust tutorial image to scale with screen.
//Add more contrast to menu buttons.
//Make it so that blocks no longer kill you if falling, only when you're crushed.
//Make title screen for level so player knows where they're at.
//Level 3, make it so that you have a button that can add boxes to the level.
// Revised 05/10/2024
// I think I believed that code should look as much like English as possible.
////////////////////////////////////////////////////////////////////////////////////////
//Loop Code
//Orb Engine Revision 4
////////////////////////////////////////////////////////////////////////////////////////
//Movement & Friction
////////////////////////////////////////////////////////////////////////////////////////
//PC Controls

left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));

//Gamepad Controls

if (os_type == os_windows || os_type == os_macosx) {
  if (joystick_exists(2)) {
    switch (joystick_direction(2)) {
      case vk_numpad1:
        left = true;
        if (inwater == 1) {
          down = true;
        }
        break;
      case vk_numpad2:
        if (inwater == 1) {
          down = true;
        }
        break;
      case vk_numpad3:
        right = true;
        if (inwater == 1) {
          down = true;
        }
        break;
      case vk_numpad4:
        left = true;
        break;
      case vk_numpad6:
        right = true;
        break;
      case vk_numpad7:
        left = true;
        if (inwater == 1) {
          up = true;
        }
        break;
      case vk_numpad8:
        if (inwater == 1) {
          up = true;
        }
        break;
      case vk_numpad9:
        right = true;
        if (inwater == 1) {
          up = true;
        }
        break;
    }
    if (joystick_check_button(2, 1)) {
      up = true;
    }
    if (joystick_check_button(2, 7)) {
      if (instance_exists(obj_orb)) {
        x = obj_orb.x;
        y = obj_orb.y;
      }
    }
  }
}

//Movement Mechanics

if (left == true) {
  if (hspd > -maxspd) {
    hspd -= accspd;
  }
}
if (right == true) {
  if (hspd < maxspd) {
    hspd += accspd;
  }
}

//Air Mechanics
if (place_meeting(x, y + 1, block) == 1) {
  inair = 0;
} else {
  inair = 1;
}
//Air Friction
if (inair == 1) {
  vspd += gravspd;
  if (left != true && right != true) {
    hspd = max(0, abs(hspd) - airfric) * sign(hspd);
  }
  //Insert new deccel code for air
}
//Ground Friction
if (inair == 0) {
  jump = 0;
  if (left != true && right != true) {
    hspd = max(0, abs(hspd) - groundfric) * sign(hspd);
  }
  //insert new decel code for ground
}

////////////////////////////////////////////////////////////////////////////////////////
//Jump
////////////////////////////////////////////////////////////////////////////////////////
if (up == true) {
  if (inair == 0 && hold == 0) {
    vspd = -jumpspd;
    hold = 1;
    jump = 1;
  }
  if (jump >= 1 && hold == 0 && jump < maxjump) {
    vspd = -jumpspd;
    hold = 1;
    jump += 1;
  }
} else {
  hold = 0;
}

////////////////////////////////////////////////////////////////////////////////////////
//Motion
////////////////////////////////////////////////////////////////////////////////////////
//Horizontal Motion
for (var __i = 0; __i < ceil(abs(hspd)); __i++) {
  var blk, wtr;
  blk = place_meeting(x + sign(hspd), y, block);
  wtr = place_meeting(x + sign(hspd), y, water);
  mov = 0;
  //Slope Mechanics UP
  if (blk == 1 && up == true && wtr == false) {
    hspd *= -1.005;
    vspd *= 1.005;
  } else if (blk == 1) {
    //Wall Collision
    if (mov == 0) {
      hspd = 0;
      bounce = false;
    }
  } else {
    //Slope Mechanics DOWN

    if (mov == 0) {
      x += sign(hspd);
      bounce = false;
    }
  }
}

//Vertical Motion
if (vspd > 120) {
  vspd = 120;
}
if (vspd < -120) {
  vspd = -120;
}
for (var __i = 0; __i < ceil(abs(vspd)); __i++) {
  //Collision Vertically
  if (
    place_meeting(x, y + sign(vspd), block) == 1 &&
    place_meeting(x, y + sign(vspd), water) != 1 &&
    up == true
  ) {
    vspd *= -1.005;
    hspd *= 1.005;
  }
  if (place_meeting(x, y + sign(vspd), obj_block_jumppad) == 1) {
    vspd *= -1.5;
    hspd *= 1.005;
  } else if (place_meeting(x, y + sign(vspd), block) == 1) {
    vspd = 0;
  } else {
    //Vertical Mechanic
    if (vspd != 0) {
      y += sign(vspd);
    }
  }
}

////////////////////////////////////////////////////////////////////////////////////////
//Water
////////////////////////////////////////////////////////////////////////////////////////
if (instance_position(x, y, water)) {
  inwater = 1;
  gravspd = watergravspd;
}
if (!instance_position(x, y, water) && waterstage != 1) {
  inwater = 0;
  gravspd = airgravspd;
}
//Swimming
if (up == true) {
  if (inwater == 1) {
    vspd = max(-maxspd / 2, vspd - accspd);
  }
}

if (down == true) {
  if (inwater == 1) {
    vspd = min(maxspd / 2, vspd + accspd);
  }
}
////////////////////////////////////////////////////////////////////////////////////////
//Border Control
////////////////////////////////////////////////////////////////////////////////////////
if (y > room_height + 128) {
  instance_destroy();
}

if (x < 8) {
  x = 8;
  hspd = 0;
  hspeed = 0;
}

if (x > room_width - 8) {
  x = room_width - 8;
  hspeed = 0;
  hspd = 0;
}

if (y < 8) {
  y = 8;
  vspeed = 0;
  vspd = 0;
}
////////////////////////////////////////////////////////////////////////////////////////
//Ghosts
////////////////////////////////////////////////////////////////////////////////////////
image_blend = make_color_hsv(hue, 255, 255);
hue += 1;
if (hue > 255) {
  hue = 0;
}

if (dirprevious - Direction >= 180) {
  dirprevious -= 360;
}
if (dirprevious - Direction <= -180) {
  dirprevious += 360;
}

//Alpha of first ghost
imgalpha = 0.375;

//Average of change in direction.
dir = (dirprevious + Direction) / 2;

//temp vars for script.
xx = xprevious;
yy = yprevious;

//This is where the ghosts are started to be created
//Repeat as many times as there is space between the current and previous position
for (var __i = 0; __i < (Speed / 100) * global.blurvar; __i++) {
  with (instance_create(xx, yy, obj_orb_blur2)) {
    image_alpha = other.imgalpha;
    image_blend = other.image_blend;
  }

  xx += lengthdir_x(100 / global.blurvar, dir);
  yy += lengthdir_y(100 / global.blurvar, dir);
  //Both these move where the ghosts are created towards the right spot a bit
  dir -= (dirprevious - Direction) / Speed;
  //This increases the dir variable at a rate that makes the curve correctly
  imgalpha += 0.05 / ((Speed / 100) * global.blurvar);
  //Increases the alpha, so it creates a smoothly fading line,
  //rather than one that fades in blocks
  //This should be equal to what the ghost is decreasing by divided by (Speed/100*40)
}
