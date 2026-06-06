//var _startY = sprite_height+sprite_get_height(sprite_index);
//for (var i = 0; i < image_yscale; i++){
    ////draw_sprite_stack(wallType,0,x,_startY+i,1,1,1,image_angle,-1,1);
    //draw_sprite_ext(sprite_index,0,x,y-_startY,1,1,image_angle,image_blend,image_alpha);
//}
//

//draw_self();
//var _startX = (sprite_width/2)-(sprite_get_width(wallType)/2);
//var _startY = (sprite_height/2)-(sprite_get_height(wallType)/2);
//
//for (var i = 0; i < image_xscale; i++){
    //var _posX = (x-_startX)+(i*sprite_get_width(wallType));
    //draw_sprite_stack(wallType,0,_posX,y+16,,1,1,image_angle,image_blend,image_alpha);
//}
//for (var i = 0; i < image_yscale; i++){
    //var _posY = (y-_startY)+(i*sprite_get_height(wallType));
    //draw_sprite_stack(wallType,0,x,_posY+16,,1,1,image_angle,image_blend,image_alpha);
//}


var _w = sprite_get_width(wallType);
var _h = sprite_get_height(wallType);

var _rep_x = max(1, ceil(abs(image_xscale)));
var _rep_y = max(1, ceil(abs(image_yscale)));

var _sign_x = sign(image_xscale);
var _sign_y = sign(image_yscale);

var _camangle = -camera_get_view_angle(CAMERA) + 90;

var _dirx = lengthdir_x(1, _camangle);
var _diry = lengthdir_y(1, _camangle);

var _max = sprite_get_number(wallType) * global.camRotV;

for (var i = 0; i < _max; i += global.camRotV){
    var j = 1;
    repeat (ceil(global.camRotV)){
        var _dist = (i + j) / 2;
        var _xoff_stack = lengthdir_x(_dist, _camangle) + lengthdir_x(global.camRotV, _camangle);
        var _yoff_stack = lengthdir_y(_dist, _camangle) + lengthdir_y(global.camRotV, _camangle);
        var _list = ds_list_create();
        for (var xx = 0; xx < _rep_x; xx++){
            for (var yy = 0; yy < _rep_y; yy++){
                var _off_x = (xx - (_rep_x - 1) * 0.5) * _w * _sign_x;
                var _off_y = (yy - (_rep_y - 1) * 0.5) * _h * _sign_y;
                var _px = x + _off_x + _xoff_stack;
                var _py = y + _off_y + _yoff_stack;
                var _depth = (_px * _dirx) + (_py * _diry) * 1.0001;
                ds_list_add(_list, [_px, _py, _depth]);
            }
        }
        ds_list_sort(_list, true);
        for (var k = 0; k < ds_list_size(_list); k++){
            var _d = _list[| k];
            draw_sprite_ext(wallType,i/global.camRotV,_d[0],_d[1],_sign_x,_sign_y,image_angle,image_blend,image_alpha);
        }
        ds_list_destroy(_list);
        j++;
    }
}