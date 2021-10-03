package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1376:String;
      
      private var var_1994:int;
      
      private var var_1992:int;
      
      private var var_1995:int;
      
      private var var_1993:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_1994 = param1.readInteger();
         var_1995 = param1.readInteger();
         var_1992 = param1.readInteger();
         var_1993 = param1.readString();
         var_1376 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1376;
      }
      
      public function get hour() : int
      {
         return var_1994;
      }
      
      public function get minute() : int
      {
         return var_1995;
      }
      
      public function get chatterName() : String
      {
         return var_1993;
      }
      
      public function get chatterId() : int
      {
         return var_1992;
      }
   }
}
