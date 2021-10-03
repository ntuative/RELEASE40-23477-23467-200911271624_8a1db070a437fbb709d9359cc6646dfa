package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1702:String;
      
      private var var_542:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_542 = param1;
         var_1702 = param2;
      }
      
      public function get race() : String
      {
         return var_1702;
      }
      
      public function get figure() : String
      {
         return var_542;
      }
   }
}
