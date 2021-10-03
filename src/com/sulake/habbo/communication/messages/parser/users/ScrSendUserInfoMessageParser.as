package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1633:int;
      
      private var var_1217:String;
      
      private var var_1634:int;
      
      private var var_1632:int;
      
      private var var_1631:int;
      
      private var var_1635:Boolean;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function get productName() : String
      {
         return var_1217;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_1635;
      }
      
      public function get responseType() : int
      {
         return var_1632;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_1634;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1217 = param1.readString();
         var_1634 = param1.readInteger();
         var_1633 = param1.readInteger();
         var_1631 = param1.readInteger();
         var_1632 = param1.readInteger();
         var_1635 = param1.readBoolean();
         return true;
      }
      
      public function get memberPeriods() : int
      {
         return var_1633;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1631;
      }
   }
}
