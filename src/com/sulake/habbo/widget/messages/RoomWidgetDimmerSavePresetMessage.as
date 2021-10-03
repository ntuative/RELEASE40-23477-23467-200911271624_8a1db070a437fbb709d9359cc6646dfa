package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_562:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1820:int;
      
      private var var_1824:int;
      
      private var var_2116:Boolean;
      
      private var var_940:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_562);
         var_1824 = param1;
         var_1820 = param2;
         _color = param3;
         var_940 = param4;
         var_2116 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1820;
      }
      
      public function get presetNumber() : int
      {
         return var_1824;
      }
      
      public function get brightness() : int
      {
         return var_940;
      }
      
      public function get apply() : Boolean
      {
         return var_2116;
      }
   }
}
