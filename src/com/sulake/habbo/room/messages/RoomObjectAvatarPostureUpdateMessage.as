package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1774:String;
      
      private var var_758:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_1774 = param1;
         var_758 = param2;
      }
      
      public function get postureType() : String
      {
         return var_1774;
      }
      
      public function get parameter() : String
      {
         return var_758;
      }
   }
}
