package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1523:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1464:String = "ROE_MOUSE_ENTER";
      
      public static const const_369:String = "ROE_MOUSE_MOVE";
      
      public static const const_1530:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_217:String = "ROE_MOUSE_CLICK";
      
      public static const const_436:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1770:Boolean;
      
      private var var_1772:Boolean;
      
      private var var_1769:Boolean;
      
      private var var_1771:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_1769 = param4;
         var_1771 = param5;
         var_1770 = param6;
         var_1772 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1772;
      }
      
      public function get altKey() : Boolean
      {
         return var_1769;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1771;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1770;
      }
   }
}
