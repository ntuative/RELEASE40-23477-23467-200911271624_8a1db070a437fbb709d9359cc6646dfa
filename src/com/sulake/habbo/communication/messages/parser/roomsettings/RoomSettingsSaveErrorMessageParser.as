package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1471:int = 9;
      
      public static const const_1395:int = 4;
      
      public static const const_1461:int = 1;
      
      public static const const_1214:int = 10;
      
      public static const const_1459:int = 2;
      
      public static const const_1283:int = 7;
      
      public static const const_1163:int = 11;
      
      public static const const_1425:int = 3;
      
      public static const const_1136:int = 8;
      
      public static const const_1162:int = 5;
      
      public static const const_1445:int = 6;
      
      public static const const_1234:int = 12;
       
      
      private var var_1815:String;
      
      private var _roomId:int;
      
      private var var_1077:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1815;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1077 = param1.readInteger();
         var_1815 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1077;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
