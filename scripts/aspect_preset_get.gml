//aspect_preset_set(set);
//Input an int, and returns a new aspect ratio. 

switch (global.aspect_ratio)
{
case (4 / 3):
    return 0;
break;
case (16 / 9):
    return 1;
break;
case (16 / 10):
    return 2;
break;
}

return 1;
