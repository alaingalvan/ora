//Orb Engine 4
//By Alain Galvan
//Last Revision: 10/10/12
////////////////////////////////////////////////////////////////////////////////////////
//Loop Code
//Orb Engine Revision 4 
////////////////////////////////////////////////////////////////////////////////////////
//Movement & Friction
////////////////////////////////////////////////////////////////////////////////////////
//PC Controls 
//Controlled by alarm[0]

//Movement Mechanics
if left==true {hspd=max(-maxspd,hspd - accspd)}
if right=true {hspd=min(maxspd,hspd + accspd)}

//Air Mechanics
if(place_meeting(x,y+1,block)==1) 
{
inair = 0;
}  
else 
{
inair = 1;
}
//Air Friction
if(inair==1) 
{
    vspd+= gravspd;
    if ! left=true && ! right=true{hspd = max(0,abs(hspd)-airfric)*sign(hspd);}
}
//Ground Friction
if(inair==0) 
{
    jump = 0;
    if ! left=true && ! right=true{hspd = max(0,abs(hspd)-groundfric)*sign(hspd);}
}

////////////////////////////////////////////////////////////////////////////////////////
//Jump
////////////////////////////////////////////////////////////////////////////////////////
switch (jumpstatus)
{
//Double Jump
case 0:
if up=true {
    if(inair==0 && hold==0) {
        vspd  = -jumpspd;
        hold = 1;
        jump = 1;
    }
    if(jump>=1 && hold==0 && jump<maxjump) {
        vspd  = -jumpspd;
        hold = 1;
        jump+= 1;
    }
} 
else {hold = 0}
break;
case 1:
//Reflection System

break;
}
////////////////////////////////////////////////////////////////////////////////////////
//Motion
////////////////////////////////////////////////////////////////////////////////////////
//Horizontal Motion
repeat(ceil(abs(hspd))) 
{
var blk, mov, slp;
blk = place_meeting(x+sign(hspd),y,block);
mov = 0;
//Slope Mechanics UP
if(blk==1) and up=true
{
hspd*= -1.005;
} 
else
if(blk==1) 
{ 
//Wall Collision
if(mov==0) 
{            
hspd = 0;                
}
} 
else 
{
//Slope Mechanics DOWN

if(mov==0) 
{ 
x+= sign(hspd);            
}
}
}

//Vertical Motion
if vspd>120 {vspd=120}
if vspd<-120 {vspd=-120}
repeat(ceil(abs(vspd))) 
{
//Collision Vertically
if(place_meeting(x,y+sign(vspd),block)==1) and up=true 
{
vspd*= -1.005;
} 
else
if(place_meeting(x,y+sign(vspd),block)==1) 
{
vspd = 0;
} 
else 
{
//Vertical Mechanic
if(vspd!=0) 
{
y+= sign(vspd);
}
}
}


////////////////////////////////////////////////////////////////////////////////////////
//Water
////////////////////////////////////////////////////////////////////////////////////////
if instance_position(x,y,water) {inwater=1 gravspd=watergravspd}
if ! instance_position(x,y,water) and ! waterstage=1 {inwater=0 gravspd=airgravspd}
//Swimming
if up=true
{if inwater=1 {vspd=max(-maxspd/2,vspd - accspd)}}
if down=true
{if inwater=1 {vspd=min(maxspd/2,vspd + accspd)}}
////////////////////////////////////////////////////////////////////////////////////////
//Border Control
////////////////////////////////////////////////////////////////////////////////////////
if y>room_height+64
{instance_destroy()}

if x<8
{x=8 hspd=0 hspeed=0}

if x>room_width-8
{x=room_width-8 hspeed=0 hspd=0}

if y<8
{y=8 vspeed=0 vspd=0}
////////////////////////////////////////////////////////////////////////////////////////
//Ghosts
////////////////////////////////////////////////////////////////////////////////////////
image_blend=make_color_hsv(hue,255,255)
hue+=1
if hue>255 {hue=0}

if (dirprevious-Direction)>=180 dirprevious-=360
//Makes sure that difference isn't too high
if (dirprevious-Direction)<=-180 dirprevious+=360
//Makes sure the difference isn't too low
//Both these are necessary because when you are going at same Direction 5, then 355
//it loop around completely
imgalpha=.15*100/40
//This sets the alpha at which to draw the first ghost
dir=(dirprevious+Direction)/2
//This is the average of the previous and current direction
//Dir is what direction the ghost trail is being built-up in
xx=xprevious
yy=yprevious
//This is where the ghosts are started to be created
repeat(Speed/100*global.blurvar) //Repeat as many times as there is space between the current and previous position
{
 with (instance_create(xx,yy,obj_foe_versa_blur)) {foeid=other.id image_alpha=other.imgalpha image_blend=other.image_blend}
 //Make a ghost at the correct alpha and color
 xx+=lengthdir_x(100/global.blurvar,dir)
 yy+=lengthdir_y(100/global.blurvar,dir)
 //Both these move where the ghosts are created towards the right spot a bit
 dir-=(dirprevious-Direction)/Speed
 //This increases the dir variable at a rate that makes the curve correctly
 imgalpha+=.05/(Speed/100*global.blurvar)
  //Increases the alpha, so it creates a smoothly fading line,
 //rather than one that fades in blocks
 //This should be equal to what the ghost is decreasing by divided by (Speed/100*40)
}

if instance_exists(obj_orb) 
{
if collision_point(x,y,obj_orb,1,0) and obj_orb.Speed>30
{
hp=0
hspd*=-1
vspd*=-1
obj_orb.hspd*=-1
obj_orb.vspd*=-1
sound_play(sou_sfx_hit)//Play hitsound.
flash=-1//Flash.
alarm[1]=1//Blinks Flash.
alarm[2]=30//Alarm to stop flash.
}
if collision_point(x,y,obj_orb,1,0) and obj_orb.Speed<30
{
with (obj_orb) {instance_destroy()}
}
}
if hp<=0
{
instance_destroy();
}

//Test
if point_distance(x0,y0,x1,y1)<leglength
{
//Change the point such that it's leglength away from the main body. 
//also, this is primarily the leg that takes the angle 225, so go to this point at a 225 degree angle.
x1+=lengthdir_x(1,225)
y1+=lengthdir_y(1,225)
}
if point_distance(x0,y0,x2,y2)<leglength
{
//Change the point such that it's leglength away from the main body. 
//also, this is primarily the leg that takes the angle 225, so go to this point at a 225 degree angle.
x2+=lengthdir_x(1,270)
y2+=lengthdir_y(1,270)
}

