if instance_exists(obj_orb) {

    if point_distance(x,y,obj_orb.x,obj_orb.y)<800
    {
    if obj_orb.x > x
       {
       right=true
       left=false
       }

    if obj_orb.x<x
       {
       right=false
       left=true
       }

    if obj_orb.y<y-64
       {
       up=true
       }
       if obj_orb.y>y-64 and obj_orb.y<y+64
       {
       up=false
       }
    }
    else
    {
    left=false
    right=false
    up=false
    }

}    
alarm[0] = floor(random(room_speed/intel)+1)

