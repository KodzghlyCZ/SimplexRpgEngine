#define inventoryPickUp
/// inventoryPickUp(count)

var n;
in_inv    = 0;
free_slot = -1;
n         = -1;

if (argument_count > 0) {n = argument[0];}

if (itm_stackable)
{
 for(a = 0; a < oInventory.slots; a++)
         {
          if (oInventory.slot[a,inv_id] == itm_id)
             {
              in_inv  = 1;
              in_slot = a;                                                                                          //show_message("Already in inv");
              break;
             }         
         } 
 if (in_inv)
    {                                                                                 //show_message("Sound: "+string(itm_sound));
     if (loot != 2) {oInventory.slot[in_slot,inv_number] += itm_number; event_user(event_user_destroy); return true;}
     else if (n != -1) {itm_number -= n; oInventory.slot[in_slot,inv_number] += n; if (itm_number <= 0) {event_user(event_user_destroy); return true;}}
    }
 else
     {
      for(a = 0; a < oInventory.slots; a++)
         {
          if (oInventory.slot[a,inv_id] == 0)
             {
              free_slot = a;                                                              //show_message("Slot: "+string(free_slot));
              break;
             }                
         } 
      if (free_slot != -1)
         {
          if (n == -1)
            {
            inventoryPickUpParam(1);                                                                              
            event_user(event_user_destroy);
            return true;
            }
            else if (loot == 2)
                    {
                     inventoryPickUpParam(1, n);
                     itm_number -= n;
                     if (itm_number <= 0) {event_user(event_user_destroy); return true;}
                    }                                                                               
         }     
     }
}
else
{
 for(a = 0; a < oInventory.slots; a++)
    {
      if (oInventory.slot[a,inv_id] == 0)
         {
         free_slot = a;                                                            
         break;
         }                
    } 
      if (free_slot != -1)
         {
            inventoryPickUpParam(0);                        
            event_user(event_user_destroy); 
            return true;                                                                                         //show_message("Inventory is full! (imho)");
         }
}

return false;

#define inventoryPickUpParam
///inventoryPickUpParam(stackable, count)

var param_stackable, count;
param_stackable = 0;
count           = -1;

if (argument_count > 0) {param_stackable = argument[0];}
if (argument_count > 1) {count           = argument[1];}

if (param_stackable = 1)
   {
   oInventory.slot[free_slot,inv_id]             = itm_id;
   oInventory.slot[free_slot,inv_sprite]         = itm_sprite;
   oInventory.slot[free_slot,inv_slot_stackable] = 1;
   oInventory.slot[free_slot,inv_sprite_number]  = itm_sprite_number;
   if (count == -1) {oInventory.slot[free_slot,inv_number] += itm_number; }
   else {oInventory.slot[free_slot,inv_number]        += count;} 


   
   }
else
    {
   oInventory.slot[free_slot,inv_id]             = itm_id;
   oInventory.slot[free_slot,inv_sprite]         = itm_sprite;
   oInventory.slot[free_slot,inv_slot_stackable] = 0;
   oInventory.slot[free_slot,inv_sprite_number]  = itm_sprite_number;
   oInventory.slot[free_slot,inv_number]         = 1;


   
    }

oInventory.slot[free_slot,inv_item_effect]            = itm_effect;    
oInventory.slot[free_slot,inv_item_info_head]         = itm_info_head;
oInventory.slot[free_slot,inv_item_info_text]         = itm_info_text;
oInventory.slot[free_slot,inv_item_info_color]        = itm_info_color;
oInventory.slot[free_slot,inv_item_equip_slot]        = itm_equip_slot;
oInventory.slot[free_slot,inv_item_materialType]      = itm_materialType;

                                                                                                                      //show_message(oInventory.slot[free_slot,inv_item_equip_slot])
for(a=0 a<10 a++)                  {oInventory.slot_option[free_slot,a] = itm_options[a];}
for(a=0; a<celkem_vlastnosti; a++) {oInventory.slot_vlastnosti[free_slot,a] = vlastnost[a];}