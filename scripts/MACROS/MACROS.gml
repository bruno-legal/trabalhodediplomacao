//Camera
#macro CAM_W 640/1.5
#macro CAM_H 360/1.5
#macro IMMUNITYCOOLDOWN 15 
global.viewW = CAM_W;
global.viewH = CAM_H;
global.camRotH = 0;
global.camRotV = 1;
#macro CAMERA view_camera[0]

var _winW = 1920;//display_get_width();
var _winH = 1080;//display_get_height();
window_set_size(_winW,_winH);
window_set_position((display_get_width()-_winW)/2,(display_get_height()-_winH)/2);

// 2560 1440