function noclip_move(argument0, argument1, argument2, argument3) {
    up = argument0;
    left = argument1;
    down = argument2;
    right = argument3;

    //Movement Mechanics

    if (left) {
        if (hspd > -(maxspd * 2)) {
            hspd -= accspd * 2;
        }
    }
    if (right) {
        if (hspd < (maxspd * 2)) {
            hspd += accspd * 2;
        }
    }

    if (up) {
        if (vspd > -(maxspd * 2)) {
            vspd -= accspd * 2;
        }
    }
    if (down) {
        if (vspd < (maxspd * 2)) {
            vspd += accspd * 2;
        }
    }
    hspd = max(0, abs(hspd) - airfric) * sign(hspd);
    vspd = max(0, abs(vspd) - airfric) * sign(vspd);
    ////////////////////////////////////////////////////////////////////////////////////////
    //Motion
    ////////////////////////////////////////////////////////////////////////////////////////
    //Horizontal Motion
    x += hspd;
    y += vspd;

}
