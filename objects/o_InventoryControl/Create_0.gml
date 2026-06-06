global.itemList = {
    generic: new inventory_item_create("Generic",s_GenericItem),
    coins : new inventory_item_create("Coins",s_CoinIcon),
    molotov : new inventory_item_create("Molotov",s_MolotovIcon),
    simple_key : new inventory_item_create("Key",s_KeyIcon),
}

inventory_slots = 5;

inv = array_create(0);
money = 0;