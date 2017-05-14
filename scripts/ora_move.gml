up = argument0;
left = argument1;
down = argument2;
right = argument3;

//Movement Mechanics

if (left)
{
    if (hspd > -maxspd)
    {
        hspd -= accspd;
    }
}
if (right)
{
    if (hspd < maxspd)
    {
        hspd += accspd;
    }
}

//Air Mechanics
if (place_meeting(x, y + 1, block))
{
    inair = 0;
}
else
{
    inair = 1;
}
//Air Friction
if (inair)
{
    vspd += gravspd;
    if (!left && !right)
    {
        hspd = max(0, abs(hspd) - airfric) * sign(hspd);
    }

}
//Ground Friction
if (!inair)
{
    jump = 0;
    if (!left && !right)
    {
        hspd = max(0, abs(hspd) - groundfric) * sign(hspd);
    }
}

////////////////////////////////////////////////////////////////////////////////////////
//Jump
////////////////////////////////////////////////////////////////////////////////////////
if (up)
{
    if (!inair && !hold)
    {

        vspd = -jumpspd;
        hold = 1;
        jump = 1;
    }
    if (jump >= 1 && !hold && jump < maxjump)
    {

        vspd = -jumpspd;
        hold = 1;
        jump += 1;
    }
}
else
{
    hold = 0;
}

////////////////////////////////////////////////////////////////////////////////////////
//Motion
////////////////////////////////////////////////////////////////////////////////////////
//Horizontal Motion
repeat(ceil(abs(hspd)))
{
    var blk, wtr;
    blk = place_meeting(x + sign(hspd), y, block);
    wtr = place_meeting(x + sign(hspd), y, water);
    mov = 0;
    //Slope Mechanics UP
    if (blk && up && !wtr)
    {
        hspd *= -1.005;
        vspd *= 1.005;
    }
    else if (blk)
    {
        //Wall Collision
        if (!mov)
        {
            hspd = 0;
            bounce = false;
        }
    }
    else
    {
        //Slope Mechanics DOWN

        if (!mov)
        {
            x += sign(hspd);
            bounce = false;
        }
    }
}

//Vertical Motion
if (vspd > 120)
{
    vspd = 120;
}
if (vspd < -120)
{
    vspd = -120;
}
repeat(ceil(abs(vspd)))
{
    //Collision Vertically
    if (place_meeting(x, y + sign(vspd), block) && !place_meeting(x, y + sign(vspd), water) && up)
    {
        vspd *= -1.005;
        hspd *= 1.005;
    }
    if (place_meeting(x, y + sign(vspd), obj_block_jumppad))
    {

        vspd *= -1.5;
        hspd *= 1.005;


    }
    else if (place_meeting(x, y + sign(vspd), block))
    {
        vspd = 0;
    }
    else
    {
        //Vertical Mechanic
        if (vspd != 0)
        {
            y += sign(vspd);
        }
    }
}


////////////////////////////////////////////////////////////////////////////////////////
//Water
////////////////////////////////////////////////////////////////////////////////////////
if (instance_position(x, y, water))
{
    inwater = 1;
    gravspd = watergravspd;
}
if (!instance_position(x, y, water) && !waterstage)
{
    inwater = 0;
    gravspd = airgravspd;
}
//Swimming
if (up)
{
    if (inwater)
    {
        vspd = max(-maxspd / 2, vspd - accspd);
    }
}

if (down)
{
    if (inwater)
    {
        vspd = min(maxspd / 2, vspd + accspd);
    }
}
////////////////////////////////////////////////////////////////////////////////////////
//Border Control
////////////////////////////////////////////////////////////////////////////////////////
if (y > room_height + 128)
{
    instance_destroy();
}

if (x < 8)
{
    x = 8; 
    hspd = 0;
}

if (x > room_width - 8)
{
    x = room_width - 8;
    hspd = 0;
}

if (y < 8)
{
    y = 8;
    vspd = 0;
}
