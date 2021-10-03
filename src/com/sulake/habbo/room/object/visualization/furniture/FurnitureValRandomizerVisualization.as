package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_995:int = 31;
      
      private static const const_994:int = 32;
      
      private static const const_480:int = 30;
      
      private static const const_726:int = 20;
      
      private static const const_479:int = 10;
       
      
      private var var_501:Boolean = false;
      
      private var var_222:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_222 = new Array();
         super();
         super.setAnimation(const_480);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_501 = true;
            var_222 = new Array();
            var_222.push(const_995);
            var_222.push(const_994);
            return;
         }
         if(param1 > 0 && param1 <= const_479)
         {
            if(var_501)
            {
               var_501 = false;
               var_222 = new Array();
               if(_direction == 2)
               {
                  var_222.push(const_726 + 5 - param1);
                  var_222.push(const_479 + 5 - param1);
               }
               else
               {
                  var_222.push(const_726 + param1);
                  var_222.push(const_479 + param1);
               }
               var_222.push(const_480);
               return;
            }
            super.setAnimation(const_480);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
