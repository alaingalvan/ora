if (al1 == 1 && image_alpha < 1) {
  image_alpha += 0.025;
}
if (al2 == 1 && image_alpha > 0) {
  al1 = 0;
  image_alpha -= 0.025;
  if (image_alpha <= 0) {
    instance_destroy();
  }
}
