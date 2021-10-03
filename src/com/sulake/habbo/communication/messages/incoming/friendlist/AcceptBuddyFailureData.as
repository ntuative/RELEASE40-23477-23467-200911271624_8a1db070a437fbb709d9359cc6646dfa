package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AcceptBuddyFailureData
   {
       
      
      private var var_1077:int;
      
      private var var_745:String;
      
      public function AcceptBuddyFailureData(param1:IMessageDataWrapper)
      {
         super();
         this.var_745 = param1.readString();
         this.var_1077 = param1.readInteger();
      }
      
      public function get senderName() : String
      {
         return this.var_745;
      }
      
      public function get errorCode() : int
      {
         return this.var_1077;
      }
   }
}
