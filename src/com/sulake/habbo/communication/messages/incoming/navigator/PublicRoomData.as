package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2054:int;
      
      private var var_2100:String;
      
      private var var_1926:int;
      
      private var _disposed:Boolean;
      
      private var var_2101:int;
      
      private var var_1986:String;
      
      private var var_1262:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1986 = param1.readString();
         var_2054 = param1.readInteger();
         var_1926 = param1.readInteger();
         var_2100 = param1.readString();
         var_2101 = param1.readInteger();
         var_1262 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_2101;
      }
      
      public function get worldId() : int
      {
         return var_1926;
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
      }
      
      public function get unitPropertySet() : String
      {
         return var_1986;
      }
      
      public function get unitPort() : int
      {
         return var_2054;
      }
      
      public function get castLibs() : String
      {
         return var_2100;
      }
      
      public function get nodeId() : int
      {
         return var_1262;
      }
   }
}
