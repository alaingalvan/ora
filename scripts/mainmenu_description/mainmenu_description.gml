function mainmenu_description(_sel = "") {
  //This script returns a string based on the imputed string. This is for options related stuff.
  _sel = string_lower(_sel);

  if (string_lower(cur_menu) == "gameplay") {
    if (_sel == "difficulty") {
      if (global.difficulty == 0) {
        return "For people that are new to gaming, or who want to experience the story without too much difficulty.";
      }
      if (global.difficulty == 1) {
        return "The intended gameplay difficulty the game was designed arround.";
      }
      if (global.difficulty == 2) {
        return "For those who want more challenging gameplay. This will disable movement aids and make AI more rigorous.";
      }
    }
    if (_sel == "subtitles") {
      if (global.captions == 0) {
        return "No Subtitles. ";
      }
      if (global.captions == 1) {
        return "Subtitles for dialogue.";
      }
      if (global.captions == 2) {
        return "Closed Captions, for those hard of hearing, this will show subtitles for every sound.";
      }
    }
    if (_sel == "commentary") {
      return "If you'd like to hear commentary on the game design.";
    }
    if (_sel == "language") {
      if (global.language == 0) {
        return "Currently the only language the game is available in.";
      }
      if (global.language == 1) {
        return "Not Supported.";
      }
      if (global.language == 2) {
        return "Not Supported.";
      }
      if ((global.language = 3)) {
        return "Not Supported.";
      }
    }
  }
  if (string_lower(cur_menu) == "graphics") {
    if (_sel == "resolution") {
      return "The screen canvas dimensions. The higher this is the sharper the graphics will be.";
    }
    if (_sel == "aspect ratio") {
      return "The ratio of the horizontal dimensions of the screen, to the vertical.";
    }
    if (_sel == "fullscreen") {
      return "Has the game either cover the whole display or show it as a window. ";
    }
    if (_sel == "vsync") {
      return "If you're experiencing screen tearing while playing the game, Vsync will correct that. ";
    }
    if (_sel == "presets") {
      return "Easy access to graphical settings for those who don't want to deal with the advanced options. ";
    }
    if (_sel == "advanced graphics") {
      return "If you want to adjust individual graphical settings, you can go here to change them. ";
    }
    if (_sel == "apply settings") {
      return "Save the current configuration. ";
    }
  }
  if (string_lower(cur_menu) == "advanced graphics") {
    if (_sel == "anti-aliasing") {
      return "Makes any polygon edges smoother.";
    }
    if (_sel == "framelimit") {
      return "The maximum framelimit of the game. Frame rate is how many frames the game displays in a second.";
    }
    if (_sel == "textures") {
      return "This affects the scaling textures in the game go through.";
    }
    if (_sel == "shadows") {
      return "If on, this effects the scaling the shadows will go through. Maximum has no scaling occuring.";
    }
    if (_sel == "anisotropic filtering") {
      return "How well textures filter from various distances. If you notice blury textures further up from the viewport, turn this up.";
    }
    if (_sel == "post-processing") {
      return "Post-Processing are effects that are applied after rendering. Turn this off to save performance.";
    }
    if (_sel == "cutscene dof") {
      return "During cutscenes, Depth of Field will give cutscenes a more cinematic look, bluring distant objects and bringing the cutscene into focus.";
    }
    if (_sel == "gameplay dof") {
      return "During gameplay, Depth of Field effects will occur, making objects extremely close to the screen blur the way your eyes would blur a close object.";
    }
    if (_sel == "motion blur") {
      return "Objects moving faster than what the eye can track are slightly blurred in the direction of their movement. This isn't an obnoxious motion blur.";
    }
    if (_sel == "ssao") {
      return "Screen Space Ambient Occlusion creates soft shadows around corners of models the way shadows wrap them_selves around a model in real life.";
    }
  }
  if (string_lower(cur_menu) == "sound") {
    if (_sel == "master volume") {
      return "The master volume of the game, from which all volumes are based off.";
    }
    if (_sel == "bgm volume") {
      return "The volume of the background music.";
    }
    if (_sel == "effects volume") {
      return "The volume of any special effects. ";
    }
    if (_sel == "voice volume") {
      return "The volume of any dialogue. ";
    }
  }
  if (string_lower(cur_menu) == "controls") {
    if (_sel == "key/mouse bindings") {
      return "Change the controls of the game to your liking for the keyboard and mouse.";
    }
    if (_sel == "gamepad bindings") {
      return "Change the location of the button mappings on your gamepad.";
    }
    if (_sel == "touch bindings") {
      return "Change the locations and settings of the touchscreen controls. ";
    }
  }
  return "";
}
