if mouse_x>x+width or mouse_y>y+height or mouse_x<x
{
instance_destroy()
}

for(i = 0; i<ds_list_size(list); i+=1)
{
if mouse_x>x and mouse_y>y+4+(24*i) and mouse_x<x+width and mouse_y<y+4+(24*(i+1))
{
dropmenu_perform(i)
}
}

