package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1841:String;
      
      private var var_972:String;
      
      private var var_1954:Boolean;
      
      private var var_1662:int;
      
      private var var_1837:Boolean;
      
      private var var_1509:String = "";
      
      private var _category:int;
      
      private var var_1255:int;
      
      private var var_1842:Boolean;
      
      private var var_1838:int = -1;
      
      private var _objId:int;
      
      private var var_1840:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:int)
      {
         super();
         var_1662 = param1;
         var_972 = param2;
         _objId = param3;
         var_1255 = param4;
         _category = param5;
         var_1841 = param6;
         var_1954 = param7;
         var_1837 = param8;
         var_1842 = param9;
         var_1840 = param10;
      }
      
      public function get classId() : int
      {
         return var_1255;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_1954;
      }
      
      public function get stripId() : int
      {
         return var_1662;
      }
      
      public function get stuffData() : String
      {
         return var_1841;
      }
      
      public function get songId() : int
      {
         return var_1838;
      }
      
      public function setSongData(param1:String, param2:int) : void
      {
         var_1509 = param1;
         var_1838 = param2;
      }
      
      public function get expiryTime() : int
      {
         return var_1840;
      }
      
      public function get itemType() : String
      {
         return var_972;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get slotId() : String
      {
         return var_1509;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1842;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1837;
      }
   }
}
