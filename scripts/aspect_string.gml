//aspect_preset_set(set);
//Input an int, and returns a new aspect ratio. 

switch (global.aspect_ratio)
{
case (4 / 3):
    return "4x3";
break;
case (16 / 9):
    return "16x9";
break;
case (16 / 10):
    return "16x10";
break;
}

return 1;
