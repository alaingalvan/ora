function tutorial_show(argument0) {
	//tutorial_show(var);
	if instance_exists(obj_sfx_tutmessage) then with obj_sfx_tutmessage {alarm[1]=1}

	var j;
	j=instance_create(0,0,obj_sfx_tutmessage)
	j.image_index=argument0




}
