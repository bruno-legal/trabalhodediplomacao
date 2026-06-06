stack_depth_calc();
if place_meeting(x,y,o_PlayerHB){
    //if !instance_exists(diagId) diagId = dialogbox_create(x,y-16,["Save"],self,false);
}
else dialogbox_destroy(diagId);
    
if current_time mod 12 == 0 particle_billboard_create(savePart,1);