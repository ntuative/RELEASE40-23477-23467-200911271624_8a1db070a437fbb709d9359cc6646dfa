package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1772:Boolean = false;
      
      private var var_1769:Boolean = false;
      
      private var var_1831:String = "";
      
      private var _type:String = "";
      
      private var var_1770:Boolean = false;
      
      private var var_1604:Number = 0;
      
      private var var_2084:Number = 0;
      
      private var var_2086:Number = 0;
      
      private var var_2085:String = "";
      
      private var var_1602:Number = 0;
      
      private var var_1771:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_2085 = param2;
         var_1831 = param3;
         var_2084 = param4;
         var_2086 = param5;
         var_1604 = param6;
         var_1602 = param7;
         var_1771 = param8;
         var_1769 = param9;
         var_1770 = param10;
         var_1772 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1771;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1772;
      }
      
      public function get localX() : Number
      {
         return var_1604;
      }
      
      public function get localY() : Number
      {
         return var_1602;
      }
      
      public function get canvasId() : String
      {
         return var_2085;
      }
      
      public function get altKey() : Boolean
      {
         return var_1769;
      }
      
      public function get spriteTag() : String
      {
         return var_1831;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_2084;
      }
      
      public function get screenY() : Number
      {
         return var_2086;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1770;
      }
   }
}
