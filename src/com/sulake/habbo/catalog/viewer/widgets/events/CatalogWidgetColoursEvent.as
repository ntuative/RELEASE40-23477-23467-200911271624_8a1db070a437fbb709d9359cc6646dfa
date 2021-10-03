package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1117:Array;
      
      private var var_1696:String;
      
      private var var_1695:String;
      
      private var var_1694:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         var_1117 = param1;
         var_1696 = param2;
         var_1695 = param3;
         var_1694 = param4;
      }
      
      public function get colours() : Array
      {
         return var_1117;
      }
      
      public function get backgroundAssetName() : String
      {
         return var_1696;
      }
      
      public function get colourAssetName() : String
      {
         return var_1695;
      }
      
      public function get chosenColourAssetName() : String
      {
         return var_1694;
      }
   }
}
