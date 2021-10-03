package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_921:String = "select_outfit";
       
      
      private var var_2013:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_921);
         var_2013 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_2013;
      }
   }
}
