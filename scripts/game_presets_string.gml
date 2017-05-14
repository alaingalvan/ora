//Returns a string defining what the current preset is.
//-1 = custom, 0 = minimum, 1 = low, 2 = medium, 3 = high, 4 = maximum.
var a;
a = game_presets_get();
if (a == -1)
{
    return "Custom";
}
