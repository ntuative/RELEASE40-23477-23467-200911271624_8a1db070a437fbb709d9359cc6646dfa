package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_503:String = "RWOCM_CLUB_MAIN";
      
      public static const const_627:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1607:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_627);
         var_1607 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1607;
      }
   }
}
