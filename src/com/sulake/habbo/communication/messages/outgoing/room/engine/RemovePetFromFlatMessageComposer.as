package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RemovePetFromFlatMessageComposer implements IMessageComposer
   {
       
      
      private var var_1051:int;
      
      public function RemovePetFromFlatMessageComposer(param1:int)
      {
         super();
         var_1051 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1051];
      }
      
      public function dispose() : void
      {
      }
   }
}
