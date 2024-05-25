function angle_8dir(_angle) {
  _angle = floor(_angle);
  if (_angle > 360) {
    _angle -= 360;
  }
  if (_angle < 0) {
    _angle += 360;
  }

  if (_angle >= 337.5 || _angle < 22.5) {
    _angle = 0;
  }
  if (_angle >= 67.5 && _angle < 112.5) {
    _angle = 90;
  }
  if (_angle >= 157.5 && _angle < 202.5) {
    _angle = 180;
  }
  if (_angle >= 247.5 && _angle < 292.5) {
    _angle = 270;
  }
  if (_angle >= 22.5 && _angle < 67.5) {
    _angle = 45;
  }
  if (_angle >= 112.5 && _angle < 157.5) {
    _angle = 135;
  }
  if (_angle >= 202.5 && _angle < 247.5) {
    _angle = 225;
  }
  if (_angle >= 292.5 && _angle < 337.5) {
    _angle = 315;
  }

  return _angle;
}
