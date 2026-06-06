inputs_load();

//if canMove{
    hsp = xInput * movespeed;
    vsp = yInput * movespeed;
//}

image_angle = -global.camRotH;

var _moveAngle = -global.camRotH - 90;

if canMove{
    x += vsp * lengthdir_x(movespeed, _moveAngle);
    y += vsp * lengthdir_y(movespeed, _moveAngle);
    
    x += hsp * lengthdir_x(movespeed, _moveAngle + 90);
    y += hsp * lengthdir_y(movespeed, _moveAngle + 90);
}

phy_position_x = x;
phy_position_y = y;

if canMove && (abs(hsp) > 0 || abs(vsp) > 0){
    dir = point_direction(x, y, x + hsp, y + vsp) - global.camRotH;
    dir = (dir + 360) mod 360;
}

//Throw
if key_useItem_pressed{
    throwing = true;
    canMove = false;
    hsp = 0;
    vsp = 0;
    throwX = x+lengthdir_x(throwDefaultStrength,dir);
    throwY = y+lengthdir_y(throwDefaultStrength,dir);
}
if key_useItem_hold{
    throwX += vsp * lengthdir_x(aimSpeed, _moveAngle);
    throwY += vsp * lengthdir_y(aimSpeed, _moveAngle);
    
    throwX += hsp * lengthdir_x(aimSpeed, _moveAngle + 90);
    throwY += hsp * lengthdir_y(aimSpeed, _moveAngle + 90);
}

if key_useItem_release{
    throwing = false;
    instance_create_depth(x,y,depth,o_Molotov);
}

//Animation
part_system_depth(psWalk,depth+1);
if canMove{
    if abs(hsp) > 0 || abs(vsp) > 0 {
        if sideY = -1 sprite_index = s_bPlayer_Walk;
        if sideY = 1 sprite_index = s_fPlayer_Walk;
        if current_time % 4 == 1 part_particles_burst(psWalk,x,y,ps_Walk);
    }
    else{
        if sideY = -1 sprite_index = s_bPlayer_Idle;
        if sideY = 1 sprite_index = s_fPlayer_Idle;
    }
}

if attacking{
    if sideY = -1 sprite_index = s_bPlayer_Attack;
    if sideY = 1 sprite_index = s_fPlayer_Attack;
}
    
if abs(hsp) > 0 image_xscale = -sign(hsp);
if abs(vsp) > 0 sideY = sign(vsp);


if attacking canMove = false;
if !attacking && !throwing canMove = true;