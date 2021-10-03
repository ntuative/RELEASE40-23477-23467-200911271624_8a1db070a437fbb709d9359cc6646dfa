package com.sulake.habbo.widget.events
{
   public class RoomWidgetFrameUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_310:String = "RWUE_EVENT_FRAME";
       
      
      public function RoomWidgetFrameUpdateEvent(param1:Boolean = false, param2:Boolean = false)
      {
         super(const_310,param1,param2);
      }
   }
}
