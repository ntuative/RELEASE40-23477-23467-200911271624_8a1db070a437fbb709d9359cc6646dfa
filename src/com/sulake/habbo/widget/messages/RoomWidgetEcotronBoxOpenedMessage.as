package com.sulake.habbo.widget.messages
{
   public class RoomWidgetEcotronBoxOpenedMessage extends RoomWidgetMessage
   {
      
      public static const const_1334:String = "RWEBOM_ECOTRONBOX_OPENED";
       
      
      private var var_1255:int;
      
      private var var_972:String;
      
      public function RoomWidgetEcotronBoxOpenedMessage(param1:String, param2:String, param3:int)
      {
         super(param1);
         var_972 = param2;
         var_1255 = param3;
      }
      
      public function get classId() : int
      {
         return var_1255;
      }
      
      public function get itemType() : String
      {
         return var_972;
      }
   }
}
