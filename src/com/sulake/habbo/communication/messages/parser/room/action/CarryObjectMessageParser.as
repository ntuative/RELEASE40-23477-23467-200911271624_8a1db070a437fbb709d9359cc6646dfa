package com.sulake.habbo.communication.messages.parser.room.action
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CarryObjectMessageParser implements IMessageParser
   {
       
      
      private var _userId:int = 0;
      
      private var var_972:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1205:String;
      
      public function CarryObjectMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         _userId = param1.readInteger();
         var_972 = param1.readInteger();
         if(var_972 > 0)
         {
            var_1205 = param1.readString();
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         _roomId = 0;
         _roomCategory = 0;
         _userId = 0;
         var_972 = 0;
         var_1205 = "";
         return true;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get itemType() : int
      {
         return var_972;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get itemName() : String
      {
         return var_1205;
      }
   }
}
