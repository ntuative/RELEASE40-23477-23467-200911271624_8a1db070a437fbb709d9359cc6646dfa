package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1388:String = "e";
      
      public static const const_1489:String = "i";
      
      public static const const_1387:String = "s";
       
      
      private var _id:int;
      
      private var _title:String;
      
      private var _type:String;
      
      private var var_1597:int;
      
      private var var_1117:Array;
      
      private var var_1594:int;
      
      private var var_1593:int;
      
      private var var_1595:int;
      
      private var _name:String;
      
      private var var_1596:int;
      
      private var var_1204:String;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String)
      {
         super();
         _type = param1;
         _id = param2;
         _name = param3;
         var_1597 = param4;
         var_1596 = param5;
         var_1594 = param6;
         var_1593 = param7;
         var_1595 = param8;
         var_1117 = param9;
         _title = param10;
         var_1204 = param11;
      }
      
      public function get tileSizeY() : int
      {
         return var_1593;
      }
      
      public function get tileSizeZ() : int
      {
         return var_1595;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function get revision() : int
      {
         return var_1596;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get colourIndex() : int
      {
         return var_1597;
      }
      
      public function get tileSizeX() : int
      {
         return var_1594;
      }
      
      public function get colours() : Array
      {
         return var_1117;
      }
      
      public function get description() : String
      {
         return var_1204;
      }
   }
}
