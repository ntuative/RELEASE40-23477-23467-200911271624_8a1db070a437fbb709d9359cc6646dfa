package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoucherRedeemOkMessageParser implements IMessageParser
   {
       
      
      private var var_1217:String = "";
      
      private var var_1218:String = "";
      
      public function VoucherRedeemOkMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_1218 = "";
         var_1217 = "";
         return true;
      }
      
      public function get productName() : String
      {
         return var_1217;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1218 = param1.readString();
         var_1217 = param1.readString();
         return true;
      }
      
      public function get productDescription() : String
      {
         return var_1218;
      }
   }
}
