package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_880:PetData;
      
      private var var_1306:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1306 = param1.readBoolean();
         var_880 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1306 + ", " + var_880.id + ", " + var_880.name + ", " + pet.figure + ", " + var_880.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1306;
      }
      
      public function get pet() : PetData
      {
         return var_880;
      }
   }
}
