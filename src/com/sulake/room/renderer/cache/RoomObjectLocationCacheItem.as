package com.sulake.room.renderer.cache
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectLocationCacheItem
   {
       
      
      private var var_1834:int = -1;
      
      private var var_1157:int = -1;
      
      private var var_632:Vector3d = null;
      
      public function RoomObjectLocationCacheItem()
      {
         super();
         var_632 = new Vector3d();
      }
      
      public function get objectUpdateId() : int
      {
         return var_1834;
      }
      
      public function set objectUpdateId(param1:int) : void
      {
         var_1834 = param1;
      }
      
      public function set screenLoc(param1:IVector3d) : void
      {
         var_632.assign(param1);
         var_632.x = Math.round(var_632.x);
         var_632.y = Math.round(var_632.y);
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         var_1157 = param1;
      }
      
      public function get screenLoc() : IVector3d
      {
         return var_632;
      }
      
      public function get geometryUpdateId() : int
      {
         return var_1157;
      }
   }
}
