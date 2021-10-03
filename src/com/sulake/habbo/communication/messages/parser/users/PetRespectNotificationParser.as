package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1569:int;
      
      private var var_1096:PetData;
      
      private var var_1697:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1569;
      }
      
      public function get petData() : PetData
      {
         return var_1096;
      }
      
      public function flush() : Boolean
      {
         var_1096 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1697;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1569 = param1.readInteger();
         var_1697 = param1.readInteger();
         var_1096 = new PetData(param1);
         return true;
      }
   }
}
