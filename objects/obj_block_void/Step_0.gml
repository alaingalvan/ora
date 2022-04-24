if instance_exists(obj_orb) {
if collision_rectangle(x,y+31,x+xlength,y+ylength,obj_orb,0,0)
{
with (obj_orb)
{
instance_destroy();
}
}
}

if instance_exists(obj_orb2) {
if collision_rectangle(x,y+31,x+xlength,y+ylength,obj_orb2,0,0)
{
with (obj_orb2)
{
instance_destroy();
}
}
}

