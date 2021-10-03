package com.sulake.habbo.communication.messages.outgoing.friendlist
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class SendRoomInviteMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_1376:String;
      
      private var var_715:Array;
      
      public function SendRoomInviteMessageComposer(param1:String)
      {
         var_715 = new Array();
         super();
         this.var_1376 = param1;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(this.var_715.length);
         var _loc2_:int = 0;
         while(_loc2_ < this.var_715.length)
         {
            _loc1_.push(this.var_715[_loc2_]);
            _loc2_++;
         }
         _loc1_.push(this.var_1376);
         return _loc1_;
      }
      
      public function dispose() : void
      {
         this.var_715 = null;
      }
      
      public function addInvitedFriend(param1:int) : void
      {
         this.var_715.push(param1);
      }
   }
}
