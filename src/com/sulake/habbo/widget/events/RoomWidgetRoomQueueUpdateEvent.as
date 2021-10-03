package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_462:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_294:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_707:int;
      
      private var var_243:Boolean;
      
      private var var_1919:Boolean;
      
      private var var_1383:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_707 = param2;
         var_1919 = param3;
         var_243 = param4;
         var_1383 = param5;
      }
      
      public function get position() : int
      {
         return var_707;
      }
      
      public function get isActive() : Boolean
      {
         return var_243;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1383;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_1919;
      }
   }
}
