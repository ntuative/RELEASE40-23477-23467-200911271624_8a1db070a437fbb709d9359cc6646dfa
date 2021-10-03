package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1369:int;
      
      private var var_1370:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1369;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1369 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1369 = this.var_1369;
         _loc1_.var_1370 = this.var_1370;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1370 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1370;
      }
   }
}
