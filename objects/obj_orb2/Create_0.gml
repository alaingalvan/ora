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
left=keyboard_check(ord("A"))
right=keyboard_check(ord("D"))
up=keyboard_check(ord("W"))
down=keyboard_check(ord("S"))
////////////////////////////////////////////////////////////////////////////////////////
//Physics
////////////////////////////////////////////////////////////////////////////////////////
//Constants
hpmax=3
airgravspd=1
watergravspd=0.25
maxjump=2
jumpspd=16
airfric=0.5
groundfric=1
maxspd=12
gravspd=1
waterstage=0
z=-64


//Dynamic Vars
slopedir=0
flash=1
hspd=0
vspd=0
accspd=1
dir=1
inair=0
hold=0
jump=0
jumpstatus=0
inwater=0
hdir=0
hp=hpmax
Speed=0
Direction=0
dirprevious=Direction
hue=obj_orb.hue+128
gem=0
movetimerr=0
movetimerl=0

//Constants
block=obj_block_par
bounce=obj_bounce_par
water=obj_water_par
ladder=obj_ladder_par

