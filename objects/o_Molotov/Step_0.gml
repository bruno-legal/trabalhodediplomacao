t += moveSpeed;

if (t >= 1){
    x = targetX;
    y = targetY;
    flashExplode = true;
    z = 1;
}
else{
    hsp = lerp(startX, targetX, t);
    vsp = lerp(startY, targetY, t);
    z = lerp(8, 1, t) + 4 * height * t * (1 - t);
}

x = hsp;
y = vsp;

if flashExplode fTime--;
if fTime == 0{
    instance_destroy();
    //Particle
    explodePart = {
        xMin : x, yMin : y-16, zMin : 1, xMax : x, yMax : y-16, zMax : 1,
        spriteToUse : spart_Explosion, imageIndex : 0, animate: false, randomImg: false, loopAnimation : false,
        col1 : c_white, col2 : c_white, col3 : c_white, additiveCol : false,
        lifeMin : 120, lifeMax : 120,
        xscale : 1, yscale : 1, sizeMin : 0.5, sizeMax : 1, sizeIcr : 0,
        movespeedMin : 0, movespeedMax : 2,  movespeedIcr : -0.05,
        gravForce : 3,
        dirMin : 0, dirMax : 360, dirIcr : 0,
        oriMin : 0, oriMax : 90, oriIcr : 0, oriRelative : false,
        zDir : 1, zSpeedMin : 0, zSpeedMax : 5, zSpeedIcr : -0.05
    }
    particle_billboard_create(explodePart,200);
}

stack_depth_calc();