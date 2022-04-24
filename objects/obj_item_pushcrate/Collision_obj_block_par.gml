if (vspeed > 0 && !place_free(x, y + vspeed))
{
move_contact_solid(270, 4);
}
vspeed = 0;
// stops the player falling through the floor, by contacting with the solid.

