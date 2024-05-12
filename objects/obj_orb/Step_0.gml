/// @description Orb Engine 4
//By Alain Galvan
//Last Revision: 10/26/12
// Revised by Alain again in 05/10/2024
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
////////////////////////////////////////////////////////////////////////////////////////
//Loop Code
//Orb Engine Revision 4
////////////////////////////////////////////////////////////////////////////////////////
//Movement & Friction
////////////////////////////////////////////////////////////////////////////////////////
//PC Controls
left = keyboard_check(global.left);
right = keyboard_check(global.right);
up = keyboard_check(global.up);
down = keyboard_check(global.down);
//Gamepad Controls

if (os_type == os_windows || os_type == os_macosx) {
  if (joystick_exists(1)) {
    switch (joystick_direction(1)) {
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
        if (inwater) {
          up = true;
        }
        break;
    }
    if (joystick_check_button(1, 1)) {
      up = true;
    }
    if (joystick_check_button(1, 7)) {
      if (instance_exists(obj_orb2)) {
        x = obj_orb2.x;
        y = obj_orb2.y;
      }
    }
  }
}
if (!noclip) {
  ora_move(up, left, down, right);
} else {
  noclip_move(up, left, down, right);
}

///Ghosts
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
for (var __i = 0; __i < Speed / 5; __i++) {
  with (instance_create(xx, yy, obj_orb_blur)) {
    image_alpha = other.imgalpha;
    image_blend = other.image_blend;
  }

  xx += lengthdir_x(5, dir);
  yy += lengthdir_y(5, dir);
  //Both these move where the ghosts are created towards the right spot a bit
  dir -= (dirprevious - Direction) / Speed;
  //This increases the dir variable at a rate that makes the curve correctly
  imgalpha += 0.025 / (Speed / 5);
  //Increases the alpha, so it creates a smoothly fading line,
  //rather than one that fades in blocks
  //This should be equal to what the ghost is decreasing by divided by the ratio
}
