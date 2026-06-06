inputs_load();
x = playerIndex.x;
y = playerIndex.y;
image_angle = playerIndex.dir - 90;


if attackDur < attackDurMax{
    visible = true;
    playerIndex.hsp = 0;
    playerIndex.vsp = 0;
    playerIndex.attacking = true;
}
else{
    visible = false;
    playerIndex.attacking = false;
}
if attackDur <= attackDurMax + attackSpeed{
    attackDur++;
}
else if key_attack && !o_Player.throwing attackDur = 0;