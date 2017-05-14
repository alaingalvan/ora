//vec_reflect(vector,normal)
var vector, normal, ret, dot;
vector = argument0;
normal = argument1;

dot = 2 * vec2_dot(vector, normal);

for (var a = 1; a > -1; a--)
{
    ret[a] = vector[a] - dot2 * normal[a];
}

return ret;
