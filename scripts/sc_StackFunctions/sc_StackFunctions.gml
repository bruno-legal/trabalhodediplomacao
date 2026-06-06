function draw_self_stack(){
    if draw_skip(x,y) exit;
	var _camangle = -camera_get_view_angle(CAMERA) + 90;
	for (var i=0; i<image_number*global.camRotV; i+=global.camRotV){
		var j = 1;
		repeat (ceil(global.camRotV)){
			var _xoff = lengthdir_x((i+j)/2,_camangle);
			var _yoff = lengthdir_y((i+j)/2,_camangle);
			draw_sprite_ext(sprite_index,i/global.camRotV,x+_xoff,y+_yoff,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
			j++;
		}
	}
}

function draw_sprite_stack(_sprite_index=sprite_index,_start_image=0,_x=x,_y=y,_z=1,_image_xscale=1,_image_yscale=1,_image_angle=image_angle,_image_blend=image_blend,_image_alpha=image_alpha){
    if draw_skip(_x,_y) exit;
	var _camangle = -camera_get_view_angle(CAMERA) + 90;
	for (var i=_start_image; i<sprite_get_number(_sprite_index)*global.camRotV; i+=global.camRotV){
		var j = 1;
		repeat (ceil(global.camRotV)){
			var _dist = (i + j) / 2;
			var _xoff = lengthdir_x(_dist,_camangle) + lengthdir_x(_z * global.camRotV,_camangle);
			var _yoff = lengthdir_y(_dist,_camangle) + lengthdir_y(_z * global.camRotV,_camangle) - 16;
			draw_sprite_ext(_sprite_index,i/global.camRotV,_x+_xoff,_y+_yoff,_image_xscale,_image_yscale,_image_angle,_image_blend,_image_alpha);
			j++;
		}
	}
}

function draw_sprite_stack_outlined(_sprite_index=sprite_index,_start_image=0,_x=x,_y=y,_z=1,_image_xscale=1,_image_yscale=1,_image_angle=image_angle,_image_blend=image_blend,_image_alpha=image_alpha,_outline_color=c_black){
    if draw_skip(_x,_y) exit;
    var _camangle = -camera_get_view_angle(CAMERA) + 90;
    gpu_set_fog(1,_outline_color,1,1);
    for (var o = 0; o < 4; o++){
        var ox = (o == 0) - (o == 1);
        var oy = (o == 2) - (o == 3);
        for (var i = _start_image; i < sprite_get_number(_sprite_index) * global.camRotV; i += global.camRotV){
            var j = 1;
            repeat (ceil(global.camRotV)){
                var _dist = (i + j) / 2;
                var _xoff = lengthdir_x(_dist, _camangle) + lengthdir_x(_z * global.camRotV, _camangle);
                var _yoff = lengthdir_y(_dist, _camangle) + lengthdir_y(_z * global.camRotV, _camangle) - 16;
                draw_sprite_ext(_sprite_index,i / global.camRotV,_x + _xoff + ox,_y + _yoff + oy,_image_xscale,_image_yscale,_image_angle,c_white,1);
                j++;
            }
        }
    }
    gpu_set_fog(0,_outline_color,1,1);
    for (var i = _start_image; i < sprite_get_number(_sprite_index) * global.camRotV; i += global.camRotV){ 
        var j = 1;
        repeat (ceil(global.camRotV)){
            var _dist = (i + j) / 2;
            var _xoff = lengthdir_x(_dist, _camangle) + lengthdir_x(_z * global.camRotV, _camangle);
            var _yoff = lengthdir_y(_dist, _camangle) + lengthdir_y(_z * global.camRotV, _camangle) - 16;
            draw_sprite_ext(_sprite_index,i / global.camRotV,_x + _xoff,_y + _yoff,_image_xscale,_image_yscale,_image_angle,_image_blend,_image_alpha);
            j++;
        }
    }
}

function stack_depth_calc(){
	var _camangle = -camera_get_view_angle(CAMERA) -90;
	depth = -lengthdir_y(y,_camangle) - lengthdir_x(x,_camangle);
}

function draw_self_billboard(_follow_camera_rotation=true,_modify_height=true){
	var _camangle = -camera_get_view_angle(CAMERA);
	var _height = (camera_get_view_height(CAMERA) / global.viewH)-1;
    var _rot = image_angle;
    
    if _follow_camera_rotation _rot = _camangle;
    if !_modify_height _height = 0;
     
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale+_height,_rot,image_blend,image_alpha);
	depth = -lengthdir_y(y,_camangle-90) - lengthdir_x(x,_camangle-90);
}

function draw_sprite_billboard(_sprite_index=sprite_index,_image_index=image_index,_x=x,_y=y,_z=1,_image_xscale=1,_image_yscale=1,
_image_angle=image_angle,_image_blend=image_blend,_image_alpha=image_alpha,_follow_camera_rotation=true,_modify_height=true){
    if draw_skip(_x,_y) exit;
    var _camangle = -camera_get_view_angle(CAMERA) + 90;
    var _height = (camera_get_view_height(CAMERA) / global.viewH)-1;
    var _rot = _image_angle;

    if _follow_camera_rotation _rot = -camera_get_view_angle(CAMERA);
    if !_modify_height _height = 0;

    var _dist = _z * global.camRotV;
    var _xoff = lengthdir_x(_dist, _camangle);
    var _yoff = lengthdir_y(_dist, _camangle);

    draw_sprite_ext(_sprite_index,_image_index,_x + _xoff,_y + _yoff,_image_xscale,_image_yscale + _height,_rot,_image_blend,_image_alpha);
}


function wave_value(_from,_to,_duration,_offset,_time=current_time){
    var _wave = (_to - _from) * 0.5;
    return _from + _wave + sin((((_time * 0.001) + _duration * _offset) / _duration) * (pi * 2)) * _wave;
}


function draw_skip(_x=x,_y=y){
    var _camx = camera_get_view_x(CAMERA);
    var _camy = camera_get_view_y(CAMERA);
    var _camw = camera_get_view_width(CAMERA);
    var _camh = camera_get_view_height(CAMERA);
    var _margin = 96;

    var _cx = _camx + _camw * 0.5;
    var _cy = _camy + _camh * 0.5;

    var _ang = -camera_get_view_angle(CAMERA);

    var dx = _x - _cx;
    var dy = _y - _cy;

    var cosa = dcos(_ang);
    var sina = dsin(_ang);

    var rx = dx * cosa - dy * sina;
    var ry = dx * sina + dy * cosa;

    return !point_in_rectangle(rx,ry,-_camw*0.5-_margin,-_camh*0.5-_margin,_camw*0.5+_margin,_camh*0.5+_margin);
}

function vb_draw_sprite_ext(_sprite_index,_image_index,_x,_y,_image_xscale,_image_yscale,_image_angle,_image_blend,_image_alpha){
    var _vb = o_vertexbuffer_controller.vb;

    var tex = sprite_get_texture(_sprite_index, _image_index);
    texture_set_stage(0, tex);
    var uv = sprite_get_uvs(_sprite_index, _image_index);

    var u1 = uv[0];
    var v1 = uv[1];
    var u2 = uv[2];
    var v2 = uv[3];
    
    var w = sprite_get_width(_sprite_index);
    var h = sprite_get_height(_sprite_index);

    var ox = sprite_get_xoffset(_sprite_index);
    var oy = sprite_get_yoffset(_sprite_index);

    var x1 = (-ox) * _image_xscale;
    var y1 = (-oy) * _image_yscale;

    var x2 = (w - ox) * _image_xscale;
    var y2 = (h - oy) * _image_yscale;
    
     var z = 0;
    
    // tri 1
    vertex_position_3d(_vb, _x, _y, z);
    vertex_texcoord(_vb, u1, v1);
    vertex_colour(_vb, _image_blend, _image_alpha);

    vertex_position_3d(_vb, _x, _y, z);
    vertex_texcoord(_vb, u2, v1);
    vertex_colour(_vb, _image_blend, _image_alpha);

    vertex_position_3d(_vb, _x, _y, z);
    vertex_texcoord(_vb, u2, v2);
    vertex_colour(_vb, _image_blend, _image_alpha);

    // tri 2
    vertex_position_3d(_vb, _x, _y, z);
    vertex_texcoord(_vb, u1, v1);
    vertex_colour(_vb, _image_blend, _image_alpha);

    vertex_position_3d(_vb, _x, _y, z);
    vertex_texcoord(_vb, u2, v2);
    vertex_colour(_vb, _image_blend, _image_alpha);

    vertex_position_3d(_vb, _x, _y, z);
    vertex_texcoord(_vb, u1, v2);
    vertex_colour(_vb, _image_blend, _image_alpha);
}

function sprite_convert_dir(){
    var _images = image_number / dirAmmount;
    var cx = camera_get_view_x(CAMERA) + camera_get_view_width(CAMERA) * 0.5;
    var cy = camera_get_view_y(CAMERA) + camera_get_view_height(CAMERA) * 0.5;
    var ang = point_direction(cx, cy, x, y);
    var _dir = (dirAmmount == 2)
        ? (ang < 180)
        : floor((ang + (180/dirAmmount)) / (360/dirAmmount)) mod dirAmmount;
    var _start = _dir * _images;
    image_index = _start + (image_index mod _images);
    if (image_index >= _start + _images) image_index = _start;
}

function look_player_dir(){
    if !instance_exists(o_Player) exit;
    lookDir = point_direction(x,y,o_Player.x,o_Player.y);
}