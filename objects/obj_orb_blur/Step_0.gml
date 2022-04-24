
timer+=1
if instance_exists(obj_orb)
{image_blend=make_color_hsv(obj_orb.hue,255,255)}
else
{
image_blend=make_color_hsv(hue,255,255)

}


image_alpha-=.025
if image_alpha<0 {instance_destroy();}

image_scale-=.01


