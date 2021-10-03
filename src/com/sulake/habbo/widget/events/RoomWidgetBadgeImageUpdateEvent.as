package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_574:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_1570:BitmapData;
      
      private var var_1548:String;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_574,param3,param4);
         var_1548 = param1;
         var_1570 = param2;
      }
      
      public function get badgeImage() : BitmapData
      {
         return var_1570;
      }
      
      public function get badgeID() : String
      {
         return var_1548;
      }
   }
}
