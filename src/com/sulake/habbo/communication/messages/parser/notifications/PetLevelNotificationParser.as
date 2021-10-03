package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_542:String;
      
      private var var_1539:int;
      
      private var var_1538:String;
      
      private var var_975:int;
      
      private var var_1051:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1051;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1051 = param1.readInteger();
         var_1538 = param1.readString();
         var_1539 = param1.readInteger();
         var_542 = param1.readString();
         var_975 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_1538;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_542;
      }
      
      public function get petType() : int
      {
         return var_975;
      }
      
      public function get level() : int
      {
         return var_1539;
      }
   }
}
