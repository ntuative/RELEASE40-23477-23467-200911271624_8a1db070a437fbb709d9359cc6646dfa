package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2188:Boolean;
      
      private var var_2190:int;
      
      private var var_2189:Boolean;
      
      private var var_1429:String;
      
      private var var_1083:String;
      
      private var var_1912:int;
      
      private var var_1909:String;
      
      private var var_2187:String;
      
      private var var_1910:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1912 = param1.readInteger();
         this.var_1429 = param1.readString();
         this.var_1909 = param1.readString();
         this.var_2188 = param1.readBoolean();
         this.var_2189 = param1.readBoolean();
         param1.readString();
         this.var_2190 = param1.readInteger();
         this.var_1910 = param1.readString();
         this.var_2187 = param1.readString();
         this.var_1083 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1083;
      }
      
      public function get avatarName() : String
      {
         return this.var_1429;
      }
      
      public function get avatarId() : int
      {
         return this.var_1912;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2188;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2187;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1910;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2189;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1909;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2190;
      }
   }
}
