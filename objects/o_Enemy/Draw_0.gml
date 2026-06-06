if outlined{
    var _camAngle = -camera_get_view_angle(CAMERA);
	var _height = camera_get_view_height(CAMERA) / global.viewH;
    gpu_set_fog(true,c_white,1,1);
    draw_sprite_ext(sprite_index,image_index,x,y+2,image_xscale+0.25,_height+0.25,_camAngle,image_blend,image_alpha);
}

//draw_text(x,y-16,x);

gpu_set_fog(damageFlash,c_white,1,1);

draw_self_billboard();

gpu_set_fog(false,c_white,1,1);