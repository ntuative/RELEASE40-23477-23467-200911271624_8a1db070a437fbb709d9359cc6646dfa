package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_1658:int;
      
      private var var_1654:String;
      
      private var var_1479:IActionDefinition;
      
      private var var_1657:Boolean;
      
      private var _color:IPartColor;
      
      private var var_1655:String;
      
      private var var_1653:String;
      
      private var var_1652:Boolean;
      
      private var var_1656:ColorTransform;
      
      private var var_1659:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_1654 = param1;
         var_1655 = param2;
         var_1658 = param3;
         _color = param4;
         _frames = param5;
         var_1479 = param6;
         var_1652 = param7;
         var_1659 = param8;
         var_1653 = param9;
         var_1657 = param10;
         var_1656 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1652;
      }
      
      public function get partType() : String
      {
         return var_1655;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_1659;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_1657;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_1658;
      }
      
      public function get flippedPartType() : String
      {
         return var_1653;
      }
      
      public function get bodyPartId() : String
      {
         return var_1654;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1479;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_1656;
      }
   }
}
