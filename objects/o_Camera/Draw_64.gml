inputs_load();
if key_debugHud{
    var _string = string("{0}\n{1}\n{2}\n{3}\n{4}",global.camRotH,global.camRotV,global.viewW,global.viewH,fps_real);
    draw_text_transformed(16,16,_string,2,2,0);
}