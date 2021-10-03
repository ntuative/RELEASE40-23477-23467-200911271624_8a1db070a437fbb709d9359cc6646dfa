package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_240:uint = 1;
      
      public static const const_445:uint = 0;
      
      public static const const_951:uint = 8;
      
      public static const const_262:uint = 4;
      
      public static const const_345:uint = 2;
       
      
      private var var_366:uint;
      
      private var var_2031:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_2030:uint;
      
      private var var_102:Rectangle;
      
      private var var_571:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_102 = param3;
         _color = param4;
         var_366 = param5;
         var_2031 = param6;
         var_2030 = param7;
         var_571 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_2031;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_366;
      }
      
      public function get scaleV() : uint
      {
         return var_2030;
      }
      
      public function get tags() : Array
      {
         return var_571;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_102 = null;
         var_571 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_102;
      }
   }
}
