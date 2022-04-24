if instance_exists(obj_orb) {
if collision_rectangle(x,y,x+xlength,y+ylength,obj_orb,0,0)
{
obj_orb.hspd+=dash
}
}



if doonce=true
{
timer+=1
}

if collision_rectangle(x,y,x+width,y+height,obj_player,false,false)
{
obj_player.vspeed+=m^(timer/10)
doonce=true
}
if ! collision_rectangle(x,y,x+width,y+height,obj_player,false,false)
{
timer=0
}

