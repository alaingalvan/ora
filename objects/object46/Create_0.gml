//Orb Engine 4
//By Alain Galvan
//Last Revision: 06/15/12
////////////////////////////////////////////////////////////////////////////////////////
//Initial Code
//This has been set so that one can easily modify the physics that influence orb while at
//the same time keep individual ai easily modifiable in the event off the need of
//ai or other entities.
////////////////////////////////////////////////////////////////////////////////////////
//Arrow Controls
////////////////////////////////////////////////////////////////////////////////////////
left = false;
right = false;
up = false;
down = false;
////////////////////////////////////////////////////////////////////////////////////////
//Physics
////////////////////////////////////////////////////////////////////////////////////////
//Constants
hpmax = 3;
hp = 3;
airgravspd = 1;
watergravspd = 0.25;
maxjump = 2;
jumpspd = 24; //*(8)
airfric = 0.5;
groundfric = 1;
maxspd = 18;
gravspd = 1;
waterstage = 0;
z = -64;

//Dynamic Vars
slopedir = 0;
flash = 1;
hspd = 0;
vspd = 0;
accspd = 1;
dir = 1;
max_slope = 2;
inair = 0;
hold = 0;
jump = 0;
jumpstatus = 0;
inwater = 0;
hdir = 0;
hp = hpmax;
Speed = 0;
Direction = 0;
dirprevious = Direction;
hue = floor(random(255) + 128);
flash = 1;
gem = 0;
block = obj_block_par;
water = obj_water_par;
ladder = obj_ladder_par;

/* */
intel = 30;
alarm[0] = room_speed / intel;

//Origin point of beast
x0 = x;
y0 = y;

//First Leg
x1 = x;
y1 = y;

//Second Leg
x2 = x;
y2 = y;

//Third Leg
x3 = x;
y3 = y;

//Leg length
leglength = 256;

/* */
/*  */
