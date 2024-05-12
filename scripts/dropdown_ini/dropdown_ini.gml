function dropdown_ini(argument0) {
  switch (argument0) {
    case 0:
      biggeststring = "Exit Ora Editor";
      list = ds_list_create();
      ds_list_add(list, "New Level");
      ds_list_add(list, "Load Level");
      ds_list_add(list, "Save Level");
      ds_list_add(list, "Exit Ora Editor");
      cur_select = 0;
      width = string_width(string_hash_to_newline(biggeststring)) + 8;
      height = 4;
      for (i = 0; i < ds_list_size(list); i++) {
        height +=
          string_height(string_hash_to_newline(ds_list_find_value(list, i))) +
          8;
      }
      break;
    case 1:
      biggeststring = "Hide Level Editor";
      list = ds_list_create();
      ds_list_add(list, "Hide Level Editor");
      cur_select = 0;
      width = string_width(string_hash_to_newline(biggeststring)) + 8;
      height = 4;
      for (i = 0; i < ds_list_size(list); i++) {
        height +=
          string_height(string_hash_to_newline(ds_list_find_value(list, i))) +
          8;
      }
      break;
  }
}
