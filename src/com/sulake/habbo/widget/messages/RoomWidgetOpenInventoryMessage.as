package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_975:String = "inventory_badges";
      
      public static const const_1166:String = "inventory_clothes";
      
      public static const const_1265:String = "inventory_furniture";
      
      public static const const_523:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_944:String = "inventory_effects";
       
      
      private var var_1843:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_523);
         var_1843 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1843;
      }
   }
}
