/// @description gamescript_execute(instr)
/// @param instr
function console_execute(argument0) {
  var instr, list, curchar, curtoken;
  instr = argument0;
  list = ds_list_create();
  curchar = 1;
  curtoken = "";

  //Tokenize Script
  while (curchar < string_length(instr) + 1) {
    if (string_char_at(instr, curchar) != " ") {
      curtoken += string_char_at(instr, curchar);
    }
    if (
      string_char_at(instr, curchar) == " " ||
      curchar == string_length(instr)
    ) {
      if (curtoken != "") ds_list_add(list, curtoken);
      curtoken = "";
    }
    curchar++;
  }

  //Check Script
  for (var a = 0; a < ds_list_size(list); a++) {
    //----------------------------------------------------------------------------\\
    //help - Help With Console
    //----------------------------------------------------------------------------\\
    if (
      string_lower(ds_list_find_value(list, a)) == "help" ||
      ds_list_find_value(list, a) == "?"
    ) {
      string_history += @"ORA Console Help:
	      help - Displays all possible inputs.
	      clearhistory - Clears the history.
	      leveleditor - lets you edit the current level.
	      noclip - enables ORA noclip mode.
	      oraback - Teleports ORA to the last checkpoint.
	      antialiasing[0, 2, 4, 8] - Sets Anti - Aliasing.
	      vsync[on, off] - Sets VSync.
	      playeradd - Enables experimental 2 player.
";
    }

    //----------------------------------------------------------------------------\\
    //clearhistory - Clears the History of the console.
    //----------------------------------------------------------------------------\\
    if (string_lower(ds_list_find_value(list, a)) == "clearhistory") {
      string_history = "";
    }

    //----------------------------------------------------------------------------\\
    //playeradd - Enables experimental 2 player.
    //----------------------------------------------------------------------------\\
    if (string_lower(ds_list_find_value(list, a)) == "playeradd") {
      if (!instance_exists(obj_orb2)) {
        instance_create(obj_orb.x, obj_orb.y, obj_orb2);
        string_history += "Adding player 2.\n";
      }
    }
    //----------------------------------------------------------------------------\\
    //leveleditor - lets you edit the current level.
    //----------------------------------------------------------------------------\\
    if (string_lower(ds_list_find_value(list, a)) == "leveleditor") {
      if (instance_exists(obj_leveleditor)) {
        with (obj_leveleditor) {
          instance_destroy();
        }
        string_history += "Removing Level Editor.\n";
      } else {
        instance_create(0, 0, obj_leveleditor);
        string_history += "Creating Level Editor.\n";
      }
    }
    //----------------------------------------------------------------------------\\
    //oraback - Teleports ORA to the last checkpoint.
    //----------------------------------------------------------------------------\\
    if (string_lower(ds_list_find_value(list, a)) == "oraback") {
      if (instance_exists(obj_orb)) {
        with (obj_orb) {
          x = global.xx;
          y = global.yy;
          xprevious = global.xx;
          yprevious = global.yy;
        }
        string_history += "Teleporting.#";
      } else {
        string_history += "ERROR: ORA not in room.#";
      }
    }
    //----------------------------------------------------------------------------\\
    //noclip - enables ORA noclip mode.
    //----------------------------------------------------------------------------\\
    if (string_lower(ds_list_find_value(list, a)) == "noclip") {
      if (instance_exists(obj_orb)) {
        with (obj_orb) {
          noclip = !noclip;
        }
        string_history += "Noclip set..#";
      } else {
        string_history += "ERROR: ORA not in room.#";
      }
    }
    //----------------------------------------------------------------------------\\
    //vsync [on, off] - Sets VSync.
    //----------------------------------------------------------------------------\\
    if (string_lower(ds_list_find_value(list, a)) == "vsync") {
      if (a < ds_list_size(list) - 1) {
        //change that 1 to however many arguments you have.
        if (string_lower(ds_list_find_value(list, a + 1)) == "off") {
          global.vsync = false;
          display_reset(global.antialias, global.vsync);
          string_history += "Turning off VSync.#";
        } else if (string_lower(ds_list_find_value(list, a + 1)) == "on") {
          global.vsync = true;
          display_reset(global.antialias, global.vsync);
          string_history += "Turning on VSync.#";
        } else {
          string_history += "ERROR: Did not give valid parameter. [on, off]#";
        }
      }
    }

    //----------------------------------------------------------------------------\\
    //antialiasing [0, 2, 4, 8] - Sets Anti-Aliasing.
    //----------------------------------------------------------------------------\\
    if (string_lower(ds_list_find_value(list, a)) == "antialiasing") {
      if (a < ds_list_size(list) - 1) {
        //change that 1 to however many arguments you have.
        if (string_isdigit(ds_list_find_value(list, a + 1))) {
          if (
            real(tokenlist[a + 1]) % 2 == 0 &&
            real(tokenlist[a + 1]) >= 0 &&
            real(tokenlist[a + 1]) <= 8
          ) {
            string_history +=
              "Set Anti-Aliasing to  " + tokenlist[a + 1] + ".#";
            global.antialias = real(tokenlist[a + 1]);
            display_reset(global.antialias, global.vsync);
          } else {
            string_history +=
              "ERROR: Did not give valid parameter. [0, 2, 4, 8]#";
          }
        } else {
          string_history += "ERROR: Missing valid parameter. [0, 2, 4, 8]#";
        }
      }
    }

    //----end
  }

  //Clear List
  ds_list_destroy(list);
}
