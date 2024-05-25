function vec2_reflect(_vector, _normal) {
  //vec_reflect(vector,normal)
  var _ret, _dot;

  _dot = 2 * vec2_dot(_vector, _normal);

  for (var _a = 1; _a > -1; _a--) {
    _ret[_a] = _vector[_a] - _dot * _normal[a];
  }

  return _ret;
}
