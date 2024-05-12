function camera_debug_control_ini() {
  left = false;
  right = false;
  up = false;
  down = false;
  jump = false;

  phy_surface_angle = 90;
  phy_surface_angle_change = 90;
  phy_surface_spd = 0;
  phy_surface_acc = 30;
  phy_surface_decel = 30;
  phy_surface_maxspd = 720;
  keyboard_turnspd = 1 / 10;

  xspd = 0;
  yspd = 0;
  zspd = 0;
}
