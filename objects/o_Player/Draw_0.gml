inputs_load();
draw_self_billboard();
//draw_sprite_ext(s_Arrow,0,x,y,1,1,dir,-1,1);

if key_useItem_hold{
    var dist = point_distance(x, y, throwX, throwY);
    var steps = dist / 8;
    var height = 24 * (1 - clamp(dist / 512, 0, 1));
    for (var i = 0; i <= steps; i++){
        var t = i / steps;
        var px = lerp(x, throwX, t);
        var py = lerp(y, throwY, t) + 16;
        var z = lerp(8, 1, t) + 4 * height * t * (1 - t);
    
        draw_sprite_stack(ss_AimTrail, 0, px, py, z);
    }
    draw_sprite(s_AimSpot,0,throwX,throwY);
}


//draw_sprite_stack_outlined(ss_Molotov,0,xstart,ystart-16,1,1,1,0,c_white);