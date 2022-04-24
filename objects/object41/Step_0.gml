//Transition Script

if image_alpha>0 and trigger=0
{
image_alpha-=.01
if image_alpha<0 and trigger=0 {image_alpha=0}
}

if trigger=1
{
image_alpha+=0.01
if image_alpha=1 {instance_create(0,0,obj_sfx_tran0)}
}

if keyboard_check_released(vk_anykey)
{
alarm[0]=1
}

