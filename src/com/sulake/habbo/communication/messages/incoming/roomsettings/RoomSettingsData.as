package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_351:int = 0;
      
      public static const const_119:int = 2;
      
      public static const const_167:int = 1;
      
      public static const const_501:Array = ["open","closed","password"];
       
      
      private var var_1936:int;
      
      private var var_1935:int;
      
      private var var_1542:Array;
      
      private var var_1546:Boolean;
      
      private var var_1204:String;
      
      private var var_1547:Boolean;
      
      private var var_1544:int;
      
      private var var_1543:int;
      
      private var var_1085:int;
      
      private var var_1545:Boolean;
      
      private var _roomId:int;
      
      private var var_1541:Boolean;
      
      private var _name:String;
      
      private var var_571:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_1544;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1544 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_571;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1546;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1541;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_1936 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1542 = param1;
      }
      
      public function set allowTrading(param1:Boolean) : void
      {
         var_1541 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_571 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_1935;
      }
      
      public function get categoryId() : int
      {
         return var_1085;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1546 = param1;
      }
      
      public function set showOwnerName(param1:Boolean) : void
      {
         var_1545 = param1;
      }
      
      public function set allowFurniMoving(param1:Boolean) : void
      {
         var_1547 = param1;
      }
      
      public function get controllerCount() : int
      {
         return var_1936;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1542;
      }
      
      public function get showOwnerName() : Boolean
      {
         return var_1545;
      }
      
      public function get allowFurniMoving() : Boolean
      {
         return var_1547;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1543 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_1935 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1543;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1085 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1204 = param1;
      }
      
      public function get description() : String
      {
         return var_1204;
      }
   }
}
