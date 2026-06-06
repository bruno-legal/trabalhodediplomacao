stack_depth_calc();

life += 1;
if life >= lifeMax instance_destroy();
    
movespeed += movespeedIcr;
movespeed = max(0,movespeed);

dir += dirIncr;
dir = max(0,dir);

xsp = lengthdir_x(movespeed,dir);
x += xsp;

ysp = lengthdir_y(movespeed,dir);
y += ysp;

zSpeed += zSpeedIcr;
zSpeed = max(0,zSpeed);
zsp = zSpeed*zDir;
z += zsp;
z -= gravForce;
z = max(0,z);

size += sizeIcr;
size = max(0,size);
image_xscale = xscale*size;
image_yscale = yscale*size;

ori += oriIncr;

//image_angle = ori;

if !loopAnimation && animate && (image_index > image_number-1) image_speed = 0;