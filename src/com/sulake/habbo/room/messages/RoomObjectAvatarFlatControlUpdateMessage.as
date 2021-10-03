package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFlatControlUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2113:String;
      
      private var var_2114:Boolean = false;
      
      public function RoomObjectAvatarFlatControlUpdateMessage(param1:String)
      {
         super();
         var_2113 = param1;
         if(param1 != null && param1.indexOf("useradmin") != -1)
         {
            var_2114 = true;
         }
      }
      
      public function get rawData() : String
      {
         return var_2113;
      }
      
      public function get isAdmin() : Boolean
      {
         return var_2114;
      }
   }
}
