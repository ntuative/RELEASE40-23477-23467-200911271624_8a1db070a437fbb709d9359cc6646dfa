package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1888:Number;
      
      private var var_534:Number = 0;
      
      private var var_1887:Number;
      
      private var var_535:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1888 = param1;
         var_1887 = param2;
      }
      
      public function update() : void
      {
         var_535 += var_1887;
         var_534 += var_535;
         if(var_534 > 0)
         {
            var_534 = 0;
            var_535 = var_1888 * -1 * var_535;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_535 = param1;
         var_534 = 0;
      }
      
      public function get location() : Number
      {
         return var_534;
      }
   }
}
