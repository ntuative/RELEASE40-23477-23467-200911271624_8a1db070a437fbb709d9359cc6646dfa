package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_1522:Number = 0;
      
      private var var_1524:Number = 0;
      
      private var var_1521:Number = 0;
      
      private var var_1523:Number = 0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1524 = param1;
         var_1521 = param2;
         var_1522 = param3;
         var_1523 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1524;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1522;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1521;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1523;
      }
   }
}
