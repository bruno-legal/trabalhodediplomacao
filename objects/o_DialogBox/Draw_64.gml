var _x = (x - camera_get_view_x(CAMERA)) * (display_get_gui_width()  / camera_get_view_width(CAMERA));
var _y = (y - camera_get_view_y(CAMERA)) * (display_get_gui_height() / camera_get_view_height(CAMERA));
var gui_x = (speaker.x - camera_get_view_x(CAMERA)) * (display_get_gui_width()  / camera_get_view_width(CAMERA));
var gui_y = (speaker.y - camera_get_view_y(CAMERA)) * (display_get_gui_height() / camera_get_view_height(CAMERA))-32;

//var _strFin = textArray[textPage].text;
//var _strLen = string_length(_strFin);
//var _recX = speaker.x;
//var _recY = speaker.y;
//var _recW = (string_width(_strFin)/sprite_get_width(s_DialogBox))+0.5;
//var _recH = (string_height(_strFin)/sprite_get_height(s_DialogBox))+0.5;
//
//draw_sprite_ext(s_DialogBox,0,_recX,_recY,_recW,_recH,0,c_white,1);
//draw_set_colour(textArray[textPage].color);
//draw_set_font(fnt_Dialog);
//draw_text(_recX+8,_recY+8,string_copy(_strFin,0,l));
//draw_set_colour(c_white);
//
//draw_primitive_begin(pr_trianglelist);
//draw_vertex(_recX+_recW, _recY+_recH);
//draw_vertex(_recX-32, _recY-32);
//draw_vertex(gui_x, gui_y);
//draw_primitive_end();

var _recX = _x;
var _recY = _y;
var _recW = sprite_get_width(s_DialogBox)*10+8;
var _recH = sprite_get_height(s_DialogBox)*5+8; 

var _pW = clamp(point_distance(_x,_y,gui_x,gui_y)/32,5,12);

var _px1 = (_recX+_recW/2);
var _py1 = (_recY+_recH/2);
draw_sprite_ext(s_DiagArrow,0,_px1,_py1,_pW,2,point_direction(_px1,_py1,gui_x,gui_y),-1,1);

draw_sprite_stretched(s_DialogBox,0,_recX,_recY,_recW,_recH);