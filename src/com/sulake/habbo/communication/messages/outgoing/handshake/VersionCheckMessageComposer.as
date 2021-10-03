package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_1832:String;
      
      private var var_1228:String;
      
      private var var_1833:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_1833 = param1;
         var_1228 = param2;
         var_1832 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1833,var_1228,var_1832];
      }
      
      public function dispose() : void
      {
      }
   }
}
