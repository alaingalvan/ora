function mainmenu_action(_sel = "") {
  //This script executes whenever an accept command has been set to true.
  _sel = string_lower(_sel);
  if (cur_menu == "") {
    if (_sel == "continue") {
      instance_create(0, 0, obj_sfx_transload);
    }
    if (_sel == "new") {
      instance_create(0, 0, obj_sfx_tran0);
    }
    if (_sel == "load") {
      instance_create(0, 0, obj_sfx_tran0);
    }
    if (_sel == "options") {
      next_menu = "Options";
      trans_menu = true;
    }
    if (_sel == "exit") {
      instance_create(0, 0, obj_sfx_transexit);
    }
  }
  if (string_lower(cur_menu) == "options") {
    if (_sel == "gameplay") {
      next_menu = "Gameplay";
      trans_menu = true;
    }
    if (_sel == "graphics") {
      next_menu = "Graphics";
      trans_menu = true;
    }
    if (_sel == "sound") {
      next_menu = "Sound";
      trans_menu = true;
    }
    if (_sel == "controls") {
      next_menu = "Controls";
      trans_menu = true;
    }
    if (_sel == "back") {
      next_menu = "";
      trans_menu = true;
      config_save();
      config_apply();
    }
  }

  if (string_lower(cur_menu) == "gameplay") {
    if (_sel == "back") {
      next_menu = "Options";
      trans_menu = true;
    }
  }
  if (string_lower(cur_menu) == "graphics") {
    if (_sel == "advanced graphics") {
      next_menu = "Advanced Graphics";
      trans_menu = true;
    }
    if (_sel == "back") {
      next_menu = "Options";
      trans_menu = true;
    }
  }
  if (string_lower(cur_menu) == "advanced graphics") {
    if (_sel == "back") {
      next_menu = "Graphics";
      trans_menu = true;
    }
  }
  if (string_lower(cur_menu) == "sound") {
    if (_sel == "back") {
      next_menu = "Options";
      trans_menu = true;
    }
  }
  if (string_lower(cur_menu) == "controls") {
    if (_sel == "key/mouse bindings") {
      next_menu = "Key/Mouse Bindings";
      trans_menu = true;
    }
    if (_sel == "gamepad bindings") {
      next_menu = "Gamepad Bindings";
      trans_menu = true;
    }
    if (_sel == "back") {
      next_menu = "Options";
      trans_menu = true;
    }
  }
  if (string_lower(cur_menu) == "key/mouse bindings") {
    if (_sel == "back") {
      next_menu = "Controls";
      trans_menu = true;
    }
  }
  if (string_lower(cur_menu) == "gamepad bindings") {
    if (_sel == "back") {
      next_menu = "Controls";
      trans_menu = true;
    }
  }
}
