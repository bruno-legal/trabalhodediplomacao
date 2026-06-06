
draw_sprite_stack_outlined(,,x,y,z);

if flashExplode{
   gpu_set_fog(1,c_white,1,1);
   scale = wave_value(0,1.25,fTime,0,current_time);
   draw_sprite_stack(,,x,y,z,scale,scale,,-1,1);
    gpu_set_fog(0,c_white,1,1);
}
//draw_text(x,y-16,alpha);
//
//var _partAmmount = 30;
//for (var i = 0; i <= _partAmmount; i++){
    //draw_sprite_billboard(spart_Explosion,0,x,y,15,1,1,0,-1,1,1,1);
//}
//