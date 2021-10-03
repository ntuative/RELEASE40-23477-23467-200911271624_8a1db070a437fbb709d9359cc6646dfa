package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_972:int;
      
      private var var_1205:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_972 = param1;
         var_1205 = param2;
      }
      
      public function get itemType() : int
      {
         return var_972;
      }
      
      public function get itemName() : String
      {
         return var_1205;
      }
   }
}
