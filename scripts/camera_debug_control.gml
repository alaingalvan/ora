var moving;
moving = false

moving = up || left || down || right
if right
{
    phy_surface_angle_change = 0
}
if up
{
    phy_surface_angle_change = 90
}
if left
{
    phy_surface_angle_change = 180
}
if down
{
    phy_surface_angle_change = 270
}
if right && up
{
    phy_surface_angle_change = 45
}
if left && up
{
    phy_surface_angle_change = 135
}
if right && down
{
    phy_surface_angle_change = 315
}
if left && down
{
    phy_surface_angle_change = 225
}

angmove = angle_difference(phy_surface_angle_change, phy_surface_angle)

if angmove < 170 && angmove > -170
{
    phy_surface_angle += (angmove / (keyboard_turnspd * global.delta_fps))
}
else
{
    phy_surface_angle = phy_surface_angle_change
}

if (moving)
{
    phy_surface_spd += phy_surface_acc

    if phy_surface_spd > (phy_surface_maxspd / weight)
    {
        phy_surface_spd = (phy_surface_maxspd / weight)
    }
}
else
{
    phy_surface_spd -= phy_surface_decel
    if phy_surface_spd <= 0
    {
        phy_surface_spd = 0
    }
}

////////////////////////////////////////////////////////////////////////////////////////
//Surface Motion
////////////////////////////////////////////////////////////////////////////////////////
//Input Vector Momentum
var xsv, ysv;
xsv = cos((global.camera_index[0].cam_angle_x + phy_surface_angle - 90) * pi180) * (phy_surface_spd / global.delta_fps)
ysv = -sin((global.camera_index[0].cam_angle_x + phy_surface_angle - 90) * pi180) * (phy_surface_spd / global.delta_fps)

//The Vector is then affected by the normal of the current surface, compared to the vector of gravity.
//The vector is the affected by friction of the current surface. 

xspd = xsv
yspd = ysv

////////////////////////////////////////////////////////////////////////////////////////
//Motion
////////////////////////////////////////////////////////////////////////////////////////
x += xspd
y += yspd
z += zspd

if keyboard_check(ord('Q'))
{
    if zspd < 16
    {
        zspd += 1
    }
}
if keyboard_check(ord('Z'))
{
    if zspd > -16
    {
        zspd -= 1
    }
}
if !(keyboard_check(ord('Z')) || keyboard_check(ord('Q')))
{
    if !(zspd == 0 || (zspd < 0.1 && zspd > -0.1))
    {
        zspd -= sign(zspd)
    }
}
