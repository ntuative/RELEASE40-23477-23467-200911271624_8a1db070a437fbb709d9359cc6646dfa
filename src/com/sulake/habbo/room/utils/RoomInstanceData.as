package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_791:LegacyWallGeometry = null;
      
      private var var_539:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_540:TileHeightMap = null;
      
      private var var_1930:String = null;
      
      private var _roomId:int = 0;
      
      private var var_792:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_791 = new LegacyWallGeometry();
         var_792 = new RoomCamera();
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_540 != null)
         {
            var_540.dispose();
         }
         var_540 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_1930 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_791;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_792;
      }
      
      public function dispose() : void
      {
         if(var_540 != null)
         {
            var_540.dispose();
            var_540 = null;
         }
         if(var_791 != null)
         {
            var_791.dispose();
            var_791 = null;
         }
         if(var_792 != null)
         {
            var_792.dispose();
            var_792 = null;
         }
         if(var_539 != null)
         {
            var_539.dispose();
            var_539 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_540;
      }
      
      public function get worldType() : String
      {
         return var_1930;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_539 != null)
         {
            var_539.dispose();
         }
         var_539 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_539;
      }
   }
}
