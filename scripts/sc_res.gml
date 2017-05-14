var res_width; res_width = argument0
var res_height; res_height = argument1

if res_width = 0 or res_height = 0 then //If arguments are 0,0, set the games resolution to the players display resolution. (putting sc_res(0,0) in Room Start event is a good idea)
{
if view_wview[view_current] != display_get_width() or view_hview[view_current] != display_get_height() then
sc_res(display_get_width(),display_get_height()) //Change sc_res to whatever you name this script.
}

else //If there are specified arguments, set the resolution accordingly and restart the room to take effect.
{
room_set_view(room,view_current,true,0,0,res_width,

res_height,0,0,res_width,res_height,view_hborder[
view_current],view_vborder[view_current]
,view_hspeed[view_current],view_vspeed[
view_current],view_object[view_current]
)
room_restart()
}

//IMPORTANT: The resolution settings from this script only last for as long as the room doesn't change.
//That means you must re-execute this script every time a new room is loaded.
//So put this script in the room_start event as needed.

