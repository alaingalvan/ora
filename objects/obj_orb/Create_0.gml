// game_ini();
// Orb Engine 4
// By Alain Galvan
// Last Revision: 06/15/12
// Revisited at 05/10/2024 - Hi past Alain!
////////////////////////////////////////////////////////////////////////////////////////
//Initial Code
//This has been set so that one can easily modify the physics that influence orb while at
//the same time keep individual ai easily modifiable in the event off the need of
//ai or other entities.
////////////////////////////////////////////////////////////////////////////////////////
//Arrow Controls
////////////////////////////////////////////////////////////////////////////////////////
left = 0;
right = 0;
up = 0;
down = 0;
////////////////////////////////////////////////////////////////////////////////////////
//Physics
////////////////////////////////////////////////////////////////////////////////////////
//Constants
hpmax = 3; //Max HP
airgravspd = 1; //Air's Gravity Acc
watergravspd = 0.25; //Water's Gravity Acc
maxjump = 2; //Max Number of Double Jumps
jumpspd = 16; //Jump Speed
airfric = 0.5; //Air Friction
groundfric = 1; //Ground Friction
maxspd = 12; //Max Horizontal Speed
z = -64;

//Dynamic Vars
gravspd = 1; //Current Grav Speed
waterstage = 0;
slopedir = 0;
flash = 1;
hspd = 0;
vspd = 0;
accspd = 1;
dir = 1;
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
hue = floor(random(255));
gem = 0;
movetimerr = 0;
movetimerl = 0;
noclip = false;

//Load Game
if ((global.loadgame = true)) {
  x = global.xx;
  y = global.yy;
}
if ((global.loadgame = false)) {
  global.xx = x;
  global.yy = y;
  gamesave_save();
}

//Constants
block = obj_block_par;
bounce = obj_bounce_par;
water = obj_water_par;
ladder = obj_ladder_par;

global.loadgame = false;
touch_control();
