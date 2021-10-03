package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1557:int = 0;
      
      private var var_1556:int = 0;
      
      private var var_1554:int = 0;
      
      private var var_1555:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get pixels() : int
      {
         return var_1556;
      }
      
      public function set pixels(param1:int) : void
      {
         var_1556 = param1;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1557 = param1;
      }
      
      public function get credits() : int
      {
         return var_1554;
      }
      
      public function get clubDays() : int
      {
         return var_1557;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1555 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1554 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1555;
      }
   }
}
