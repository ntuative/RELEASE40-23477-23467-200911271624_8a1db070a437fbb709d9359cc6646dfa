package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_542:String;
      
      private var var_1084:String;
      
      private var var_1086:String;
      
      private var var_1085:int;
      
      private var _gender:int;
      
      private var var_1083:String;
      
      private var _name:String;
      
      private var var_1087:Boolean;
      
      private var var_643:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this._gender = param1.readInteger();
         this.var_643 = param1.readBoolean();
         this.var_1087 = param1.readBoolean();
         this.var_542 = param1.readString();
         this.var_1085 = param1.readInteger();
         this.var_1086 = param1.readString();
         this.var_1084 = param1.readString();
         this.var_1083 = param1.readString();
      }
      
      public function get gender() : int
      {
         return _gender;
      }
      
      public function get realName() : String
      {
         return var_1083;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1086;
      }
      
      public function get categoryId() : int
      {
         return var_1085;
      }
      
      public function get online() : Boolean
      {
         return var_643;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1087;
      }
      
      public function get lastAccess() : String
      {
         return var_1084;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_542;
      }
   }
}
