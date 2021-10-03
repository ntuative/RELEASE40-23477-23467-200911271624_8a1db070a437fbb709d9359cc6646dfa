package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetApproveNameResultEvent extends Event
   {
       
      
      private var var_638:int;
      
      public function CatalogWidgetApproveNameResultEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(WidgetEvent.const_855,param2,param3);
         var_638 = param1;
      }
      
      public function get result() : int
      {
         return var_638;
      }
   }
}
