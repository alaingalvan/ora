
timer+=1
if instance_exists(foeid)
{image_blend=make_color_hsv(foeid.hue,255,255)}
else
{
image_blend=make_color_hsv(0,0,255)

}


image_alpha-=.025
if image_alpha<0 {instance_destroy();}

image_scale-=.01


