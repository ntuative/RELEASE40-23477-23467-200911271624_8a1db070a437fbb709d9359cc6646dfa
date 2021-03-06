package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_1813:int;
      
      private var var_1810:int;
      
      private var var_1812:int;
      
      private var _userName:String;
      
      private var var_1808:int;
      
      private var var_1809:int;
      
      private var var_1811:int;
      
      private var _userId:int;
      
      private var var_643:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_1809 = param1.readInteger();
         var_1808 = param1.readInteger();
         var_643 = param1.readBoolean();
         var_1812 = param1.readInteger();
         var_1810 = param1.readInteger();
         var_1813 = param1.readInteger();
         var_1811 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_1811;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_643;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1808;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_1810;
      }
      
      public function get cautionCount() : int
      {
         return var_1813;
      }
      
      public function get cfhCount() : int
      {
         return var_1812;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_1809;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
