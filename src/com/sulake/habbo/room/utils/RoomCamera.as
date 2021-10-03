package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_339:Number = 0.5;
      
      private static const const_764:int = 3;
      
      private static const const_1093:Number = 1;
       
      
      private var var_2119:Boolean = false;
      
      private var _targetCategory:int = -2;
      
      private var var_2123:Boolean = false;
      
      private var var_2120:Boolean = false;
      
      private var var_2122:Boolean = false;
      
      private var var_2121:int = -1;
      
      private var var_1017:int = 0;
      
      private var var_271:Vector3d = null;
      
      private var var_408:Vector3d = null;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_2123;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_2120;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_408 != null && var_271 != null)
         {
            ++var_1017;
            _loc2_ = Vector3d.dif(var_408,var_271);
            if(_loc2_.length <= const_339)
            {
               var_271 = var_408;
               var_408 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_339 * (const_764 + 1))
               {
                  _loc2_.mul(const_339);
               }
               else if(var_1017 <= const_764)
               {
                  _loc2_.mul(const_339);
               }
               else
               {
                  _loc2_.mul(const_1093);
               }
               var_271 = Vector3d.sum(var_271,_loc2_);
            }
         }
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_2123 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_2122 = param1;
      }
      
      public function get targetId() : int
      {
         return var_2121;
      }
      
      public function set targetCategory(param1:int) : void
      {
         _targetCategory = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_408 == null)
         {
            var_408 = new Vector3d();
         }
         var_408.assign(param1);
         var_1017 = 0;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_2120 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_271 != null)
         {
            return;
         }
         var_271 = new Vector3d();
         var_271.assign(param1);
      }
      
      public function set targetId(param1:int) : void
      {
         var_2121 = param1;
      }
      
      public function dispose() : void
      {
         var_408 = null;
         var_271 = null;
      }
      
      public function get targetCategory() : int
      {
         return _targetCategory;
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_2119;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_2122;
      }
      
      public function get location() : IVector3d
      {
         return var_271;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_2119 = param1;
      }
   }
}
