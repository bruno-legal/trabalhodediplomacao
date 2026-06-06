hsp = 0;
vsp = 0;
movespeed = 1.5;
fric = 0.5;

hbId = instance_create_depth(x,y,depth,o_PlayerHB);
hbId.playerIndex = id;

dir = 0;
attackDamage = 10;
attacking = false;
throwing = false;
canMove = true;

sideX = 1;
sideY = 1;

throwX = x;
throwY = y;
throwDefaultStrength = 96;
aimSpeed = 2;


//Particles
psWalk = part_system_create(0);

phy_fixed_rotation = true;