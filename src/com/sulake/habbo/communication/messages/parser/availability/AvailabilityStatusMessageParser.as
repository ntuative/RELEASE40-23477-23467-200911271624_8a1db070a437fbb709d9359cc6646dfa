package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_908:Boolean;
      
      private var var_1119:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_908 = param1.readInteger() > 0;
         var_1119 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_908;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1119;
      }
      
      public function flush() : Boolean
      {
         var_908 = false;
         var_1119 = false;
         return true;
      }
   }
}
