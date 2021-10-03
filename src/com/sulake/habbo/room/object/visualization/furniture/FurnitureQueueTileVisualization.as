package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1034:int = 1;
      
      private static const const_994:int = 3;
      
      private static const const_1033:int = 2;
      
      private static const const_1035:int = 15;
       
      
      private var var_776:int;
      
      private var var_222:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_222 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1033)
         {
            var_222 = new Array();
            var_222.push(const_1034);
            var_776 = const_1035;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_776 > 0)
         {
            --var_776;
         }
         if(var_776 == 0)
         {
            if(false)
            {
               super.setAnimation(var_222.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
