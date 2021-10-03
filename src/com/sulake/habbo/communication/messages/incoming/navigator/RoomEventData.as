package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1581:String;
      
      private var var_381:int;
      
      private var var_1582:String;
      
      private var var_1580:String;
      
      private var var_1585:int;
      
      private var var_1583:String;
      
      private var var_1584:int;
      
      private var var_571:Array;
      
      private var var_955:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_571 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_955 = false;
            return;
         }
         this.var_955 = true;
         var_1585 = int(_loc2_);
         var_1582 = param1.readString();
         var_381 = int(param1.readString());
         var_1584 = param1.readInteger();
         var_1581 = param1.readString();
         var_1580 = param1.readString();
         var_1583 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_571.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_1584;
      }
      
      public function get eventName() : String
      {
         return var_1581;
      }
      
      public function get eventDescription() : String
      {
         return var_1580;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_1582;
      }
      
      public function get tags() : Array
      {
         return var_571;
      }
      
      public function get creationTime() : String
      {
         return var_1583;
      }
      
      public function get exists() : Boolean
      {
         return var_955;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_1585;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
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
      
      public function get flatId() : int
      {
         return var_381;
      }
   }
}
