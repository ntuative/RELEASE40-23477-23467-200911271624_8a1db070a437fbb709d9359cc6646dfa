package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_1980:Boolean;
      
      private var var_1454:Array;
      
      private var var_1983:Boolean;
      
      private var var_1984:Boolean;
      
      private var var_1979:Boolean;
      
      private var var_158:Array;
      
      private var var_1982:Boolean;
      
      private var var_1977:Boolean;
      
      private var var_1455:Array;
      
      private var var_1978:Boolean;
      
      private var var_1981:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_1981;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_1980;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_1983;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_1982;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_1977;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1454;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_158 = [];
         var_1454 = [];
         _roomMessageTemplates = [];
         var_1455 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_158.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1454.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1455.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_1982 = param1.readBoolean();
         var_1979 = param1.readBoolean();
         var_1983 = param1.readBoolean();
         var_1984 = param1.readBoolean();
         var_1981 = param1.readBoolean();
         var_1977 = param1.readBoolean();
         var_1980 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_1978 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_1984;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1455;
      }
      
      public function get issues() : Array
      {
         return var_158;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_1978;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_1979;
      }
   }
}
