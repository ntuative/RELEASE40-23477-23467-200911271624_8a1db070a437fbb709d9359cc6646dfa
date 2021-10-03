package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_531:int = 2;
      
      public static const const_781:int = 6;
      
      public static const const_636:int = 1;
      
      public static const const_626:int = 3;
      
      public static const const_849:int = 4;
      
      public static const const_509:int = 5;
       
      
      private var var_2033:String;
      
      private var var_922:int;
      
      private var var_1752:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_922 = param2;
         var_1752 = param3;
         var_2033 = param4;
      }
      
      public function get time() : String
      {
         return var_2033;
      }
      
      public function get senderId() : int
      {
         return var_922;
      }
      
      public function get messageText() : String
      {
         return var_1752;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
