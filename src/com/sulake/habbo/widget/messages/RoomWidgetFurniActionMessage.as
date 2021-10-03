package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_221:String = "RWFAM_MOVE";
      
      public static const const_553:String = "RWFUAM_ROTATE";
      
      public static const const_614:String = "RWFAM_PICKUP";
       
      
      private var var_2006:int = 0;
      
      private var var_2007:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_2006 = param2;
         var_2007 = param3;
      }
      
      public function get furniId() : int
      {
         return var_2006;
      }
      
      public function get furniCategory() : int
      {
         return var_2007;
      }
   }
}
