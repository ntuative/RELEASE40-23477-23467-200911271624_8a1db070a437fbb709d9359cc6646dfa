package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1691:Array;
      
      private var var_1689:String;
      
      private var var_1690:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1689 = param1;
         var_1691 = param2;
         var_1690 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1689;
      }
      
      public function get yieldList() : Array
      {
         return var_1691;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1690;
      }
   }
}
