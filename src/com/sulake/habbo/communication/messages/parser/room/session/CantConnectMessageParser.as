package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1446:int = 2;
      
      public static const const_304:int = 4;
      
      public static const const_1206:int = 1;
      
      public static const const_1329:int = 3;
       
      
      private var var_934:int = 0;
      
      private var var_758:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_934;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_934 = param1.readInteger();
         if(var_934 == 3)
         {
            var_758 = param1.readString();
         }
         else
         {
            var_758 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_934 = 0;
         var_758 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_758;
      }
   }
}
