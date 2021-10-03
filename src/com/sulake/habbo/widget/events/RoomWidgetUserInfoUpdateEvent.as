package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_213:String = "RWUIUE_PEER";
      
      public static const const_216:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1332:String = "BOT";
      
      public static const const_827:int = 2;
      
      public static const const_1274:int = 0;
      
      public static const const_896:int = 3;
       
      
      private var var_1086:String = "";
      
      private var var_2082:Boolean = false;
      
      private var var_1727:int = 0;
      
      private var var_1649:int = 0;
      
      private var var_2076:Boolean = false;
      
      private var var_1083:String = "";
      
      private var var_2078:Boolean = false;
      
      private var _respectLeft:int = 0;
      
      private var var_2074:Boolean = true;
      
      private var var_971:int = 0;
      
      private var var_2077:Boolean = false;
      
      private var var_1224:Boolean = false;
      
      private var var_2081:Boolean = false;
      
      private var var_1651:int = 0;
      
      private var var_2080:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_262:Array;
      
      private var var_1222:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1725:int = 0;
      
      private var var_2079:Boolean = false;
      
      private var var_2075:int = 0;
      
      private var var_1650:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_262 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1649;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1649 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_2082;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_2074;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_2074 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_2078 = param1;
      }
      
      public function get motto() : String
      {
         return var_1086;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_2077 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1224;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1086 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_2079;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1650;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1224 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_2080;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1651 = param1;
      }
      
      public function get badges() : Array
      {
         return var_262;
      }
      
      public function get amIController() : Boolean
      {
         return var_2076;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_2076 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_2079 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_2075 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1650 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1083 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_2078;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_2077;
      }
      
      public function get carryItem() : int
      {
         return var_1651;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1222;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1222 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         _respectLeft = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_2075;
      }
      
      public function get realName() : String
      {
         return var_1083;
      }
      
      public function set webID(param1:int) : void
      {
         var_1725 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_262 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_2081 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_2080 = param1;
      }
      
      public function get respectLeft() : int
      {
         return _respectLeft;
      }
      
      public function get webID() : int
      {
         return var_1725;
      }
      
      public function set groupId(param1:int) : void
      {
         var_971 = param1;
      }
      
      public function get xp() : int
      {
         return var_1727;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_2082 = param1;
      }
      
      public function get groupId() : int
      {
         return var_971;
      }
      
      public function get canTrade() : Boolean
      {
         return var_2081;
      }
      
      public function set xp(param1:int) : void
      {
         var_1727 = param1;
      }
   }
}
