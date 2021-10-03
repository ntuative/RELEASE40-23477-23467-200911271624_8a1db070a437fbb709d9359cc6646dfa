package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1200:String = "F";
      
      public static const const_960:String = "M";
       
      
      private var var_89:Number = 0;
      
      private var var_542:String = "";
      
      private var var_1726:int = 0;
      
      private var var_1722:String = "";
      
      private var var_1723:int = 0;
      
      private var var_1727:int = 0;
      
      private var var_1721:String = "";
      
      private var var_1090:String = "";
      
      private var _id:int = 0;
      
      private var var_188:Boolean = false;
      
      private var var_218:int = 0;
      
      private var var_1724:String = "";
      
      private var _name:String = "";
      
      private var var_1725:int = 0;
      
      private var _y:Number = 0;
      
      private var var_88:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_88;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_218;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_188)
         {
            var_218 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_188)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_1726;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_188)
         {
            var_1723 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_1724;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_188)
         {
            var_1721 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_188)
         {
            var_1724 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_188)
         {
            var_1727 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_188)
         {
            var_542 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_188)
         {
            var_1726 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_188)
         {
            var_1090 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1723;
      }
      
      public function get groupID() : String
      {
         return var_1721;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_188)
         {
            var_1725 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_188)
         {
            var_1722 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_188 = true;
      }
      
      public function get sex() : String
      {
         return var_1090;
      }
      
      public function get figure() : String
      {
         return var_542;
      }
      
      public function get webID() : int
      {
         return var_1725;
      }
      
      public function get custom() : String
      {
         return var_1722;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_188)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_188)
         {
            var_88 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_188)
         {
            var_89 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_89;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1727;
      }
   }
}
