package com.sulake.habbo.avatar.structure.figure
{
   import flash.geom.ColorTransform;
   
   public class PartColor implements IPartColor
   {
       
      
      private var _id:int;
      
      private var var_1329:uint;
      
      private var _rgb:uint;
      
      private var _index:int;
      
      private var var_1693:int;
      
      private var var_1327:Number;
      
      private var _b:uint;
      
      private var var_1330:Number;
      
      private var var_1328:uint;
      
      private var _colorTransform:ColorTransform;
      
      private var var_1326:Number;
      
      private var var_1692:Boolean = false;
      
      public function PartColor(param1:XML)
      {
         super();
         _id = parseInt(param1.@id);
         _index = parseInt(param1.@index);
         var_1693 = parseInt(param1.@club);
         var_1692 = Boolean(parseInt(param1.@selectable));
         var _loc2_:String = param1.text();
         _rgb = parseInt(_loc2_,16);
         var_1329 = _rgb >> 16 & 255;
         var_1328 = _rgb >> 8 & 255;
         _b = _rgb >> 0 & 255;
         var_1326 = var_1329 / 255 * 1;
         var_1330 = var_1328 / 255 * 1;
         var_1327 = _b / 255 * 1;
         _colorTransform = new ColorTransform(var_1326,var_1330,var_1327);
      }
      
      public function get colorTransform() : ColorTransform
      {
         return _colorTransform;
      }
      
      public function get rgb() : uint
      {
         return _rgb;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get blueMultiplier() : Number
      {
         return var_1327;
      }
      
      public function get r() : uint
      {
         return var_1329;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1692;
      }
      
      public function get b() : uint
      {
         return _b;
      }
      
      public function get greenMultiplier() : Number
      {
         return var_1330;
      }
      
      public function get g() : uint
      {
         return var_1328;
      }
      
      public function get redMultiplier() : Number
      {
         return var_1326;
      }
      
      public function get club() : int
      {
         return var_1693;
      }
   }
}
