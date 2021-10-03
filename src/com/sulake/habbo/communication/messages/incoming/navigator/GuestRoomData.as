package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1598:int;
      
      private var var_1863:String;
      
      private var var_1862:int;
      
      private var var_1860:int;
      
      private var var_660:Boolean;
      
      private var var_1546:Boolean;
      
      private var var_381:int;
      
      private var var_1204:String;
      
      private var var_1543:int;
      
      private var var_1085:int;
      
      private var _ownerName:String;
      
      private var var_621:String;
      
      private var var_1859:int;
      
      private var var_1861:RoomThumbnailData;
      
      private var var_1541:Boolean;
      
      private var var_571:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_571 = new Array();
         super();
         var_381 = param1.readInteger();
         var_660 = param1.readBoolean();
         var_621 = param1.readString();
         _ownerName = param1.readString();
         var_1543 = param1.readInteger();
         var_1598 = param1.readInteger();
         var_1859 = param1.readInteger();
         var_1204 = param1.readString();
         var_1862 = param1.readInteger();
         var_1541 = param1.readBoolean();
         var_1860 = param1.readInteger();
         var_1085 = param1.readInteger();
         var_1863 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_571.push(_loc4_);
            _loc3_++;
         }
         var_1861 = new RoomThumbnailData(param1);
         var_1546 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_1859;
      }
      
      public function get roomName() : String
      {
         return var_621;
      }
      
      public function get userCount() : int
      {
         return var_1598;
      }
      
      public function get score() : int
      {
         return var_1860;
      }
      
      public function get eventCreationTime() : String
      {
         return var_1863;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1541;
      }
      
      public function get tags() : Array
      {
         return var_571;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1546;
      }
      
      public function get event() : Boolean
      {
         return var_660;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_571 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1085;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_1862;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_1861;
      }
      
      public function get doorMode() : int
      {
         return var_1543;
      }
      
      public function get flatId() : int
      {
         return var_381;
      }
      
      public function get description() : String
      {
         return var_1204;
      }
   }
}
