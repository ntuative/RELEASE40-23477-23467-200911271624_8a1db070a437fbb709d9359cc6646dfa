package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ApproveNameMessageParser implements IMessageParser
   {
       
      
      private var var_638:int;
      
      public function ApproveNameMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_638 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_638 = -1;
         return true;
      }
      
      public function get result() : int
      {
         return var_638;
      }
   }
}
