package com.sulake.habbo.session
{
   public class HabboGroupDetails
   {
       
      
      private var _id:int = -1;
      
      private var var_621:String = "";
      
      private var var_1244:String = "";
      
      private var _name:String = "";
      
      private var _roomId:int = -1;
      
      private var var_1204:String = "";
      
      public function HabboGroupDetails(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function set badgeId(param1:String) : void
      {
         var_1244 = param1;
      }
      
      public function get roomName() : String
      {
         return var_621;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set roomName(param1:String) : void
      {
         var_621 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get badgeId() : String
      {
         return var_1244;
      }
      
      public function dispose() : void
      {
         _id = -1;
         var_1244 = "";
         _name = "";
         var_1204 = "";
         _roomId = -1;
         var_621 = "";
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set id(param1:int) : void
      {
         _id = param1;
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
