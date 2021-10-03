package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1820:int;
      
      private var var_1824:int;
      
      private var var_1821:Boolean;
      
      private var var_1822:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1823:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1824 = param1;
         var_1820 = param2;
         var_1822 = param3;
         var_1823 = param4;
         var_1821 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1824,var_1820,var_1822,var_1823,int(var_1821)];
      }
      
      public function dispose() : void
      {
      }
   }
}
