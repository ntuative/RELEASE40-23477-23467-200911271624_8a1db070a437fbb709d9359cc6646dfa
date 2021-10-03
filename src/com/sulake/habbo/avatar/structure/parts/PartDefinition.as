package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1300:int = -1;
      
      private var var_1058:Boolean;
      
      private var var_1057:String;
      
      private var var_1578:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_1578 = String(param1["set-type"]);
         var_1057 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1058 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1300 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1057;
      }
      
      public function get staticId() : int
      {
         return var_1300;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1300 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1058;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1058 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1057 = param1;
      }
      
      public function get setType() : String
      {
         return var_1578;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
