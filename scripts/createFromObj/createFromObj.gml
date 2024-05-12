function createFromObj(argument0) {
  // MOSAIC Light 3D OBJ IMPORTER
  // (c) 2006. Zoltan Percsich. All Rights Reserved.
  // Don't edit this script

  filename = argument0;
  flipnormals = 1;
  //if (argument1>0) flipnormals=-1;
  vertex_list1 = ds_list_create();
  ds_list_clear(vertex_list1);
  ds_list_add(vertex_list1, 0);
  vertex_list2 = ds_list_create();
  ds_list_clear(vertex_list2);
  ds_list_add(vertex_list2, 0);
  vertex_list3 = ds_list_create();
  ds_list_clear(vertex_list3);
  ds_list_add(vertex_list3, 0);
  normal_list1 = ds_list_create();
  ds_list_clear(normal_list1);
  ds_list_add(normal_list1, 0);
  normal_list2 = ds_list_create();
  ds_list_clear(normal_list2);
  ds_list_add(normal_list2, 0);
  normal_list3 = ds_list_create();
  ds_list_clear(normal_list3);
  ds_list_add(normal_list3, 0);
  texture_list1 = ds_list_create();
  ds_list_clear(texture_list1);
  ds_list_add(texture_list1, 0);
  texture_list2 = ds_list_create();
  ds_list_clear(texture_list2);
  ds_list_add(texture_list2, 0);
  faces_list = ds_list_create();
  ds_list_clear(faces_list);
  fp = file_text_open_read(filename);

  for (i = 0; file_text_eof(fp) == false; i += 1) {
    row = file_text_read_string(fp);
    row = string_replace_all(row, "  ", " ");

    if (string_char_at(row, 1) == "v" && string_char_at(row, 2) == " ") {
      row = string_delete(row, 1, string_pos(" ", row));
      vx = real(string_copy(row, 1, string_pos(" ", row)));
      row = string_delete(row, 1, string_pos(" ", row));
      vy = real(string_copy(row, 1, string_pos(" ", row)));
      row = string_delete(row, 1, string_pos(" ", row));
      vz = real(string_copy(row, 1, string_length(row)));
      ds_list_add(vertex_list1, vx);
      ds_list_add(vertex_list2, vy);
      ds_list_add(vertex_list3, vz);
    }

    if (string_char_at(row, 1) == "v" && string_char_at(row, 2) == "n") {
      row = string_delete(row, 1, string_pos(" ", row));
      nx = real(string_copy(row, 1, string_pos(" ", row)));
      row = string_delete(row, 1, string_pos(" ", row));
      ny = real(string_copy(row, 1, string_pos(" ", row)));
      row = string_delete(row, 1, string_pos(" ", row));
      nz = real(string_copy(row, 1, string_length(row)));
      ds_list_add(normal_list1, nx);
      ds_list_add(normal_list2, ny);
      ds_list_add(normal_list3, nz);
    }

    if (string_char_at(row, 1) == "v" && string_char_at(row, 2) == "t") {
      row = string_delete(row, 1, string_pos(" ", row));
      tx = real(string_copy(row, 1, string_pos(" ", row)));
      row = string_delete(row, 1, string_pos(" ", row));
      ty = real(string_copy(row, 1, string_length(row)));
      ds_list_add(texture_list1, tx);
      ds_list_add(texture_list2, ty);
    }

    if (string_char_at(row, 1) == "f" && string_char_at(row, 2) == " ") {
      row = string_replace_all(row, "  ", " ");
      row = string_delete(row, 1, string_pos(" ", row));
      if (string_char_at(row, string_length(row)) == " ")
        row = string_copy(row, 0, string_length(row) - 1);
      face_num = string_count(" ", row);
      face_division = 1;
      temp_faces[0] = 0;

      for (fc = 0; fc < face_num; fc += 1) {
        f = string_copy(row, 1, string_pos(" ", row));
        row = string_delete(row, 1, string_pos(" ", row));
        temp_faces[face_division] = f;
        face_division += 1;
      }

      f = string_copy(row, 1, string_length(row));
      temp_faces[face_division] = f;
      if (face_division == 3) {
        f1 = temp_faces[2];
        f2 = temp_faces[3];
        f3 = temp_faces[1];
        ds_list_add(faces_list, f1);
        ds_list_add(faces_list, f2);
        ds_list_add(faces_list, f3);
      } else {
        f1 = temp_faces[2];
        f2 = temp_faces[3];
        f3 = temp_faces[1];
        ds_list_add(faces_list, f1);
        ds_list_add(faces_list, f2);
        ds_list_add(faces_list, f3);
        for (t = 0; t < face_division - 3; t += 1) {
          f1 = temp_faces[4 + t];
          f2 = temp_faces[1];
          f3 = temp_faces[3 + t];
          ds_list_add(faces_list, f1);
          ds_list_add(faces_list, f2);
          ds_list_add(faces_list, f3);
        }
      }
    }

    file_text_readln(fp);
  }
  file_text_close(fp);

  tm = d3d_model_create();
  tsn = 0;
  d3d_model_primitive_begin(tm, pr_trianglelist);

  for (fc = 0; fc < ds_list_size(faces_list); fc += 1) {
    sub_face = ds_list_find_value(faces_list, fc);

    if (string_count("/", sub_face) == 0) {
      f_index = sub_face;
      t_index = -1;
      n_index = -1;
    }

    if (string_count("/", sub_face) == 1) {
      f_index = string_copy(sub_face, 1, string_pos("/", sub_face) - 1);
      sub_face = string_delete(sub_face, 1, string_pos("/", sub_face));
      t_index = string_copy(sub_face, 1, string_length(sub_face));
      n_index = -1;
    }

    if (string_count("/", sub_face) == 2 && string_count("//", sub_face) == 0) {
      f_index = string_copy(sub_face, 1, string_pos("/", sub_face) - 1);
      sub_face = string_delete(sub_face, 1, string_pos("/", sub_face));
      t_index = string_copy(sub_face, 1, string_pos("/", sub_face) - 1);
      sub_face = string_delete(sub_face, 1, string_pos("/", sub_face));
      n_index = string_copy(sub_face, 1, string_length(sub_face));
    }

    if (string_count("/", sub_face) == 2 && string_count("//", sub_face) == 1) {
      sub_face = string_replace(sub_face, "//", "/");
      f_index = string_copy(sub_face, 1, string_pos("/", sub_face) - 1);
      sub_face = string_delete(sub_face, 1, string_pos("/", sub_face));
      t_index = -1;
      n_index = string_copy(sub_face, 1, string_length(sub_face));
    }

    vx = ds_list_find_value(vertex_list1, floor(real(f_index)));
    vy = ds_list_find_value(vertex_list2, floor(real(f_index)));
    vz = ds_list_find_value(vertex_list3, floor(real(f_index)));

    if (floor(real(n_index)) != -1 && ds_list_size(normal_list1) >= 1) {
      nx = flipnormals * ds_list_find_value(normal_list1, floor(real(n_index)));
      ny = flipnormals * ds_list_find_value(normal_list2, floor(real(n_index)));
      nz = flipnormals * ds_list_find_value(normal_list3, floor(real(n_index)));
    } else {
      nx = 0;
      ny = 0;
      nz = 0;
    }

    if (floor(real(t_index)) != -1 && ds_list_size(texture_list1) >= 1) {
      tx = ds_list_find_value(texture_list1, floor(real(t_index)));
      ty = ds_list_find_value(texture_list2, floor(real(t_index)));
    } else {
      tx = 0;
      ty = 0;
    }

    d3d_model_vertex_normal_texture(tm, vx, vy, vz, nx, ny, nz, tx, ty);

    tsn += 1;
    if (tsn == 999) {
      tsn = 0;
      d3d_model_primitive_end(tm);
      d3d_model_primitive_begin(tm, pr_trianglelist);
    }
  }

  d3d_model_primitive_end(tm);
  return tm;
}
