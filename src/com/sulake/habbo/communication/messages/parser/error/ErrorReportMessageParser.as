package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1245:int;
      
      private var var_1077:int;
      
      private var var_1246:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1245;
      }
      
      public function flush() : Boolean
      {
         var_1077 = 0;
         var_1245 = 0;
         var_1246 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1077;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1245 = param1.readInteger();
         var_1077 = param1.readInteger();
         var_1246 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1246;
      }
   }
}
