package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_621:String;
      
      private var var_1884:int;
      
      private var var_1475:Boolean;
      
      private var _roomId:int;
      
      private var var_1883:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1475 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_621 = param1.readString();
         var_1883 = param1.readInteger();
         var_1884 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1475;
      }
      
      public function get roomName() : String
      {
         return var_621;
      }
      
      public function get enterMinute() : int
      {
         return var_1884;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1883;
      }
   }
}
