package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_396:int = -2147483648;
      
      private var var_397:int = 2147483647;
      
      private var var_398:int = 2147483647;
      
      private var _target:IWindow;
      
      private var var_395:int = -2147483648;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         _target = param1;
      }
      
      public function get maxWidth() : int
      {
         return var_397;
      }
      
      public function get isEmpty() : Boolean
      {
         return var_395 == int.MIN_VALUE && var_397 == int.MAX_VALUE && var_396 == int.MIN_VALUE && var_398 == int.MAX_VALUE;
      }
      
      public function set maxWidth(param1:int) : void
      {
         var_397 = param1;
         if(var_397 < int.MAX_VALUE && true && _target.width > var_397)
         {
            _target.width = var_397;
         }
      }
      
      public function setEmpty() : void
      {
         var_395 = int.MIN_VALUE;
         var_397 = int.MAX_VALUE;
         var_396 = int.MIN_VALUE;
         var_398 = int.MAX_VALUE;
      }
      
      public function set maxHeight(param1:int) : void
      {
         var_398 = param1;
         if(var_398 < int.MAX_VALUE && true && _target.height > var_398)
         {
            _target.height = var_398;
         }
      }
      
      public function get minHeight() : int
      {
         return var_396;
      }
      
      public function get minWidth() : int
      {
         return var_395;
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_395 = var_395;
         _loc2_.var_397 = var_397;
         _loc2_.var_396 = var_396;
         _loc2_.var_398 = var_398;
         return _loc2_;
      }
      
      public function set minWidth(param1:int) : void
      {
         var_395 = param1;
         if(var_395 > int.MIN_VALUE && true && _target.width < var_395)
         {
            _target.width = var_395;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         var_396 = param1;
         if(var_396 > int.MIN_VALUE && true && _target.height < var_396)
         {
            _target.height = var_396;
         }
      }
      
      public function get maxHeight() : int
      {
         return var_398;
      }
   }
}
