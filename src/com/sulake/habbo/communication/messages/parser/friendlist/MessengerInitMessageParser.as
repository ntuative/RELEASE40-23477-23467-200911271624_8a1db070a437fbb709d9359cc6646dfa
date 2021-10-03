package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2177:int;
      
      private var var_2175:int;
      
      private var var_2178:int;
      
      private var var_231:Array;
      
      private var var_2176:int;
      
      private var var_2179:int;
      
      private var var_313:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_313 = new Array();
         this.var_231 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2177;
      }
      
      public function get friends() : Array
      {
         return this.var_231;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2178;
      }
      
      public function get categories() : Array
      {
         return this.var_313;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2175;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2179;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2179 = param1.readInteger();
         this.var_2178 = param1.readInteger();
         this.var_2177 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_313.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_231.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2175 = param1.readInteger();
         this.var_2176 = param1.readInteger();
         return true;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2176;
      }
   }
}
