//game_ini();
//Ora Engine 5
//By Alain Galvan
//Last Revision: 04/17/13
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
jump = false;

////////////////////////////////////////////////////////////////////////////////////////
//Physics
////////////////////////////////////////////////////////////////////////////////////////
//Variables
z = 512;

//Output Motion
velocity = vec2(0.0,0.0);

//Momentum from Gravity.
for_grav_dir = vec2(0.0,30.0);
vel_grav = vec2(0.0,0.0);
weight = 1.0;

//Momentum from Running
keyboard_turnspd = (1/10);
phy_surface_angle = 90;
phy_surface_angle_change = 90;
phy_surface_spd = 0;
phy_surface_acc = 30;
phy_surface_decel = 30;
phy_surface_maxspd = 360;
airfric = (30) //Air Friction
groundfric = (30) //Ground Friction
vel_movement = vec2(0.00000,0.00000,0.00000); 
for_movement = vec2(0.00000,0.00000,0.00000); 
for_drag = vec2(0.00000,0.00000,0.00000); 

//Momentum from Jumping
maxjump = 2; //Max Number of Double Jumps
jumpacc = (30); //Jump Speed
vel_jump = vec2(0.00000,0.00000,0.00000);

//Mesurement Vars
zprevious = z;
xdir = 0;
zdir = 0;
xdir_previous = 0;
zdir_previous = 0;
xdir_average = 0;
zdir_average = 0;
spd = 0;
gravspd = 0;
accspd = 0;

touch_control();

////////////////////////////////////////////////////////////////////////////////////////
//Rendering
////////////////////////////////////////////////////////////////////////////////////////
//Color
hue = floor(random(255));
huespd = 30;

//Ghosting
for (var i = 253; i > -1; i--)
{
    //x,y,z,a,s
    for (var j = 4; j > -1; j--)
    {
        ghost[i, j] = 0;
    }
}

//Pre load all possible vertexes (let's say, 255x4.) Each vertex is assigned a byte value.
//All transformations will occur in the shader itself. 
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_colour();
vertex_format_add_textcoord();
//vertex_format_add_custom(vertex_type_ubyte4,vertex_usage_blendindices);
vertex_format_ora = vertex_format_end();
vertex_buffer_ora = vertex_create_buffer();
vertex_begin(vertex_buffer_ora, vertex_format_ora);
//Create however many instances of particles are possible in this system in the origin. 
vertex_end(vertex_buffer_ora);
shader_sampler_ora =  shader_get_sampler_index(shaderOra,"texOraCore");
tex_ora_smallglow = background_get_texture(bac_ora_core);
tex_ora_mediumglow = background_get_texture(bac_ora_glow);

//Collision return vars. 
col[0] = 0;
col[1] = 0;
col[2] = 0;
col[3] = 0;
col[4] = 0;
col[5] = 0;
D1 = 100000;
D2 = 100000;
XC = 100000;
YC = 100000;
ZC = 100000;
Nx = 1.0;
Ny = 0.0;
Nz = 0.0;
