package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_526:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_200:String;
      
      private var var_679:String;
      
      private var var_1486:String;
      
      private var var_155:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_155 = param2;
         var_1486 = param3;
         var_200 = param4;
         var_679 = param5;
         _controller = param6;
      }
      
      public function get objectType() : String
      {
         return var_1486;
      }
      
      public function get colorHex() : String
      {
         return var_679;
      }
      
      public function get text() : String
      {
         return var_200;
      }
      
      public function get objectId() : int
      {
         return var_155;
      }
      
      public function get controller() : Boolean
      {
         return _controller;
      }
   }
}
