if place_meeting(x,y,o_PlayerHB){
    outlined = true;
    if canGetDamage && o_PlayerHB.attackDur<o_PlayerHB.attackDurMax{  
        canGetDamage = false;
        lifeIndex -= o_Player.attackDamage;
        alarm[0] = IMMUNITYCOOLDOWN;
        damageFlash = true;
        
        var _pDir = point_direction(x,y,o_Player.x,o_Player.y);
        part_particles_burst(psDamage,x,y,ps_EnemyDamage);
    }
}
else outlined = false;
if lifeIndex <= 0 instance_destroy();