if (al < 1) {
  al += 0.02;
}
if (al >= 1) {
  room_goto(men_main);
  d3d_end();
}
