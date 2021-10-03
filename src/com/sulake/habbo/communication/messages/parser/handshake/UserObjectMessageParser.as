package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_542:String;
      
      private var var_2156:String;
      
      private var var_2152:int;
      
      private var var_2155:int;
      
      private var var_1090:String;
      
      private var var_1083:String;
      
      private var _name:String;
      
      private var var_834:int;
      
      private var _respectLeft:int;
      
      private var var_2153:int;
      
      private var var_1829:int;
      
      private var var_2154:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2155;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1083;
      }
      
      public function get customData() : String
      {
         return this.var_2156;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_834;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2152;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2154;
      }
      
      public function get figure() : String
      {
         return this.var_542;
      }
      
      public function get respectTotal() : int
      {
         return this.var_1829;
      }
      
      public function get sex() : String
      {
         return this.var_1090;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_542 = param1.readString();
         this.var_1090 = param1.readString();
         this.var_2156 = param1.readString();
         this.var_1083 = param1.readString();
         this.var_2153 = param1.readInteger();
         this.var_2154 = param1.readString();
         this.var_2152 = param1.readInteger();
         this.var_2155 = param1.readInteger();
         this.var_1829 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_834 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2153;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
   }
}
