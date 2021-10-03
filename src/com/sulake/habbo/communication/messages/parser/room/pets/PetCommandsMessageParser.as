package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetCommandsMessageParser implements IMessageParser
   {
       
      
      private var var_966:Array;
      
      private var var_1051:int;
      
      public function PetCommandsMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1051 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_966 = new Array();
         while(_loc2_-- > 0)
         {
            var_966.push(param1.readInteger());
         }
         return true;
      }
      
      public function get enabledCommands() : Array
      {
         return var_966;
      }
      
      public function get petId() : int
      {
         return var_1051;
      }
      
      public function flush() : Boolean
      {
         var_1051 = -1;
         var_966 = null;
         return true;
      }
   }
}
