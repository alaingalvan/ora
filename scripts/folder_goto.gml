cur_folder = argument0
switch (cur_folder)
{
    case "root":
        cur_x = 0
        cur_y = 0
        sel_x = -1
        sel_y = -1
        //cur_list X = index Y = param (obj, spr, name)
        cur_list = ds_grid_create(4, 3)
        ds_grid_add(cur_list, 0, 0, "objects")
        ds_grid_add(cur_list, 0, 1, noone)
        ds_grid_add(cur_list, 0, 2, "Objects")
        ds_grid_add(cur_list, 1, 0, "environments")
        ds_grid_add(cur_list, 1, 1, noone)
        ds_grid_add(cur_list, 1, 2, "Environments")
        ds_grid_add(cur_list, 2, 0, "sounds")
        ds_grid_add(cur_list, 2, 1, noone)
        ds_grid_add(cur_list, 2, 2, "Sounds")
        ds_grid_add(cur_list, 3, 0, "events")
        ds_grid_add(cur_list, 3, 1, noone)
        ds_grid_add(cur_list, 3, 2, "Events")
        cur_line = 0
        break;
    case "objects":
        cur_x = 0
        cur_y = 0
        sel_x = -1
        sel_y = -1
        cur_line = 0
        cur_list = ds_grid_create(1, 3)
        ds_grid_add(cur_list, 0, 0, "root")
        ds_grid_add(cur_list, 0, 1, noone)
        ds_grid_add(cur_list, 0, 2, "Root")
        break;

    case "environments":
        cur_x = 0
        cur_y = 0
        sel_x = -1
        sel_y = -1
        cur_line = 0
        cur_list = ds_grid_create(3, 3)
        ds_grid_add(cur_list, 0, 0, "root")
        ds_grid_add(cur_list, 0, 1, noone)
        ds_grid_add(cur_list, 0, 2, "Root")
        ds_grid_add(cur_list, 1, 0, "debug")
        ds_grid_add(cur_list, 1, 1, noone)
        ds_grid_add(cur_list, 1, 2, "Debug")
        ds_grid_add(cur_list, 2, 0, "infinityplains")
        ds_grid_add(cur_list, 2, 1, noone)
        ds_grid_add(cur_list, 2, 2, "Infinty Plains")
        break;
    case "sounds":
        cur_x = 0
        cur_y = 0
        sel_x = -1
        sel_y = -1
        cur_line = 0
        cur_list = ds_grid_create(1, 3)
        ds_grid_add(cur_list, 0, 0, "root")
        ds_grid_add(cur_list, 0, 1, noone)
        ds_grid_add(cur_list, 0, 2, "Root")
        break;
    case "events":
        cur_x = 0
        cur_y = 0
        sel_x = -1
        sel_y = -1
        cur_line = 0
        cur_list = ds_grid_create(1, 3)
        ds_grid_add(cur_list, 0, 0, "root")
        ds_grid_add(cur_list, 0, 1, noone)
        ds_grid_add(cur_list, 0, 2, "Root")
        break;
    case "debug":
        cur_x = 0
        cur_y = 0
        sel_x = -1
        sel_y = -1
        cur_line = 0
        cur_list = ds_grid_create(5, 3)
        ds_grid_add(cur_list, 0, 0, "environments")
        ds_grid_add(cur_list, 0, 1, noone)
        ds_grid_add(cur_list, 0, 2, "Environments")
        ds_grid_add(cur_list, 1, 0, obj_block_wall)
        ds_grid_add(cur_list, 1, 1, spr_block_wall)
        ds_grid_add(cur_list, 1, 2, "Wall")
        ds_grid_add(cur_list, 2, 0, obj_block_checkpoint)
        ds_grid_add(cur_list, 2, 1, spr_block_checkpoint)
        ds_grid_add(cur_list, 2, 2, "Checkpoint")
        ds_grid_add(cur_list, 3, 0, obj_block_jumppad)
        ds_grid_add(cur_list, 3, 1, spr_block_jumppad_mask)
        ds_grid_add(cur_list, 3, 2, "Jump Pad")
        ds_grid_add(cur_list, 4, 0, obj_block_nextlv)
        ds_grid_add(cur_list, 4, 1, spr_block_go)
        ds_grid_add(cur_list, 4, 2, "Next Level")
        break;
    case "infinityplains":
        cur_x = 0
        cur_y = 0
        sel_x = -1
        sel_y = -1
        cur_line = 0
        cur_list = ds_grid_create(1, 3)
        ds_grid_add(cur_list, 0, 0, "environments")
        ds_grid_add(cur_list, 0, 1, noone)
        ds_grid_add(cur_list, 0, 2, "Environments")
        break;
}
