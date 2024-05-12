//keyboard_string = string_lettersdigits(keyboard_string)
if (keyboard_lastchar != "#" && keyboard_lastchar != "`") {
  cur_string = string_replace_all(keyboard_string, "#", "");
}

if (keyboard_check_pressed(vk_enter)) {
  //string_history +=cur_string+"#"
  console_execute(cur_string);
  keyboard_string = "";
  cur_string = "";
}
