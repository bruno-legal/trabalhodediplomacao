inputs_load();
if instance_exists(followTarget){
	var _xTo = followTarget.x;
	var _yTo = followTarget.y;
	
	x = lerp(x,_xTo,0.25);
	y = lerp(y,_yTo,0.25);
}

var _rotH = camRotInput * camRotateSpeed;
var _rotV = camTiltInput * (camRotateSpeed/10);

global.camRotH += _rotH;
global.camRotV += _rotV;

global.camRotV = clamp(global.camRotV,1,10);

if global.camRotH >= 360 global.camRotH -= 360;
if global.camRotH <= 0 global.camRotH += 360;
    
global.viewW += inputZoom*16;
global.viewW = clamp(global.viewW,80,infinity);
global.viewH = 9*(global.viewW/16);

camera_set_view_angle(CAMERA,global.camRotH);
camera_set_view_size(CAMERA,global.viewW,global.viewH * (1 + (global.camRotV-1)/2));

if key_altFunction{
    if resetRotInput{
       script_execute(MACROS);
    }
}
else if resetRotInput room_restart(); 
if key_pause game_end();

x = clamp(x,0,room_width);
y = clamp(y,0,room_height);

var _camX = x - global.viewW/2;
var _camY = y - camera_get_view_height(CAMERA)/2;

camera_set_view_pos(CAMERA,_camX,_camY);