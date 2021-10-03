package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_212:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1738:Boolean = false;
      
      private var var_1739:int = 0;
      
      private var var_1736:int = 0;
      
      private var var_1737:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_212,param5,param6);
         var_1737 = param1;
         var_1736 = param2;
         var_1739 = param3;
         var_1738 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_1739;
      }
      
      public function get periodsLeft() : int
      {
         return var_1736;
      }
      
      public function get daysLeft() : int
      {
         return var_1737;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_1738;
      }
   }
}
