package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1016:int;
      
      private var var_1901:int;
      
      private var var_1426:int;
      
      private var var_114:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1426 = param1.readInteger();
         var_1901 = param1.readInteger();
         var_1016 = param1.readInteger();
         var_114 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1426);
      }
      
      public function get reportedUserId() : int
      {
         return var_1016;
      }
      
      public function get callerUserId() : int
      {
         return var_1901;
      }
      
      public function get callId() : int
      {
         return var_1426;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_114;
      }
   }
}
