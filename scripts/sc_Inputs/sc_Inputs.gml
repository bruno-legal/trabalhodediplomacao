function inputs_load(){
	xInput = keyboard_check(vk_right) - keyboard_check(vk_left);
	yInput = keyboard_check(vk_down) - keyboard_check(vk_up);
	camRotInput = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	camTiltInput = keyboard_check(ord("Q")) - keyboard_check(ord("E"));
	resetRotInput = keyboard_check_pressed(ord("R"));
	key_attack = keyboard_check_pressed(ord("X"));
    key_debugHud = keyboard_check(vk_lcontrol);
    key_altFunction = keyboard_check(vk_lshift);
    key_pause = keyboard_check_pressed(vk_escape);
    inputZoom = keyboard_check(ord("S")) - keyboard_check(ord("W"));
    
    key_useItem_pressed = keyboard_check_pressed(ord("C"));
    key_useItem_hold = keyboard_check(ord("C"));
    key_useItem_release = keyboard_check_released(ord("C"));
    
    key_nextDiag = keyboard_check_pressed(ord("Z"));
    key_skipDiag = keyboard_check_pressed(ord("X"));
}