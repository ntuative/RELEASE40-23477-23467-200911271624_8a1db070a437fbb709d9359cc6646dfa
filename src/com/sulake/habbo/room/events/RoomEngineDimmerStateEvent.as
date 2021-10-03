package com.sulake.habbo.room.events
{
   public class RoomEngineDimmerStateEvent extends RoomEngineEvent
   {
      
      public static const const_59:String = "REDSE_ROOM_COLOR";
       
      
      private var var_939:int;
      
      private var _color:uint;
      
      private var var_940:int;
      
      private var var_1945:int;
      
      private var _state:int;
      
      public function RoomEngineDimmerStateEvent(param1:int, param2:int, param3:int, param4:int, param5:int, param6:uint, param7:uint, param8:Boolean = false, param9:Boolean = false)
      {
         super(const_59,param1,param2,param8,param9);
         _state = param3;
         var_1945 = param4;
         var_939 = param5;
         _color = param6;
         var_940 = param7;
      }
      
      public function get brightness() : uint
      {
         return var_940;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_939;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function get presetId() : int
      {
         return var_1945;
      }
   }
}
