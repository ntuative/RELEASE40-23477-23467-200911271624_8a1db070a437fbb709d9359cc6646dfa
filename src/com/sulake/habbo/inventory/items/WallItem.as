package com.sulake.habbo.inventory.items
{
   public class WallItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var var_1276:String;
      
      protected var var_2131:Boolean;
      
      protected var var_2129:int;
      
      protected var _type:int;
      
      protected var _category:int;
      
      protected var var_2003:Boolean;
      
      protected var var_2130:Boolean;
      
      protected var var_2128:Boolean;
      
      public function WallItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:String)
      {
         super();
         _id = param1;
         _type = param2;
         var_2129 = param3;
         _category = param4;
         var_2003 = param5;
         var_2128 = param6;
         var_2131 = param7;
         var_1276 = param8;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function set extras(param1:String) : void
      {
         var_1276 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get locked() : Boolean
      {
         return var_2130;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2128;
      }
      
      public function get ref() : int
      {
         return var_2129;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get extras() : String
      {
         return var_1276;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2131;
      }
      
      public function get groupable() : Boolean
      {
         return var_2003;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2130 = param1;
      }
   }
}
