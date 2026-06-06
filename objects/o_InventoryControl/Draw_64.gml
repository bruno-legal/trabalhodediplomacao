var _slotSpacing = 128+32;

for (var i=0; i<inventory_slots; i++){
    var _x = display_get_gui_width()-128;
    var _y = display_get_gui_height()-128;
    draw_sprite_ext(sHud_InventorySpace,0,_x-i*_slotSpacing,_y,4,4,0,-1,1);
}

for (var i = 0; i < array_length(inv); i++){
    var _item = inv[i];
    var _x = display_get_gui_width()-128;
    var _y = display_get_gui_height()-128;
    
    draw_sprite_ext(_item.icon,0,_x-i*_slotSpacing,_y,4,4,0,-1,1);
    
    draw_set_halign(fa_middle);
    draw_set_font(fnt_Dialog);
    draw_text(_x-i*_slotSpacing,_y+64,_item.name);
}

draw_set_halign(fa_left);