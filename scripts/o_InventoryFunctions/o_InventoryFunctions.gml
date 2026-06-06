function inventory_item_create(_name="Item",_icon=s_GenericItem,_type=-1,_use=0) constructor{
    name = _name;
    icon = _icon;
    type = _type;
    use = _use;
}

function inventory_item_add(itemIndex){
    if array_length(o_InventoryControl.inv) < o_InventoryControl.inventory_slots{
        array_push(o_InventoryControl.inv,itemIndex);
        instance_destroy();
    }
} 