package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class IssuePickFailedMessageParser implements IMessageParser
   {
       
      
      private var var_1778:String;
      
      private var var_1779:int;
      
      private var var_1780:int;
      
      public function IssuePickFailedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1780 = param1.readInteger();
         var_1779 = param1.readInteger();
         var_1778 = param1.readString();
         return true;
      }
      
      public function get issueId() : int
      {
         return var_1780;
      }
      
      public function get pickerUserId() : int
      {
         return var_1779;
      }
      
      public function get method_2() : String
      {
         return var_1778;
      }
   }
}
