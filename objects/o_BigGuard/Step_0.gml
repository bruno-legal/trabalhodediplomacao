stack_depth_calc();
sprite_convert_dir();
look_player_dir();

lookDir = lookDir mod 360;
if lookDir <= 0 lookDir += 360;
lookDir = round(lookDir / 90) * 90;