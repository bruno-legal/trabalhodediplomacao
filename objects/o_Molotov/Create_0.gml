startX = x;
startY = y;

targetX = o_Player.throwX;
targetY = o_Player.throwY+16;

dist = point_distance(startX, startY, targetX, targetY);

height = 24 * (1 - clamp(dist / 512, 0, 1));

t = 0;
z = 8;

hsp = 0;
vsp = 0;
moveSpeed = 5 / dist;
flashExplode = false;
fTime = 60;
alpha = 0;

upixelH = shader_get_uniform(shdr_Outline,"pixelH");
upixelW = shader_get_uniform(shdr_Outline,"pixelW");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index,0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index,0));