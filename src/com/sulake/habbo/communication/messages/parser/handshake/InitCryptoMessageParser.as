package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class InitCryptoMessageParser implements IMessageParser
   {
       
      
      protected var var_877:String;
      
      protected var var_2218:Boolean;
      
      protected var var_2143:Boolean;
      
      public function InitCryptoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get isClientEncrypted() : Boolean
      {
         return var_2218;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_877 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var_2143 = _loc2_ > 0 ? true : false;
         return true;
      }
      
      public function get token() : String
      {
         return var_877;
      }
      
      public function get isServerEncrypted() : Boolean
      {
         return var_2143;
      }
   }
}
