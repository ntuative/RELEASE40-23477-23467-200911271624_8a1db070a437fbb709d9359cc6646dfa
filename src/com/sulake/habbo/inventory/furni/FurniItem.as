package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1662:int;
      
      private var var_1837:Boolean;
      
      private var var_1838:int;
      
      private var var_1841:String;
      
      private var var_1839:Boolean = false;
      
      private var var_1840:int;
      
      private var var_415:int;
      
      private var var_972:String;
      
      private var var_1509:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1255:int;
      
      private var var_1842:Boolean;
      
      private var var_1836:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1662 = param1;
         var_972 = param2;
         _objId = param3;
         var_1255 = param4;
         var_1841 = param5;
         var_1837 = param6;
         var_1842 = param7;
         var_1840 = param8;
         var_1509 = param9;
         var_1838 = param10;
         var_415 = -1;
      }
      
      public function get songId() : int
      {
         return var_1838;
      }
      
      public function get iconCallbackId() : int
      {
         return var_415;
      }
      
      public function get expiryTime() : int
      {
         return var_1840;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_1836 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_1839 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_415 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1842;
      }
      
      public function get slotId() : String
      {
         return var_1509;
      }
      
      public function get classId() : int
      {
         return var_1255;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1837;
      }
      
      public function get stuffData() : String
      {
         return var_1841;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1662;
      }
      
      public function get isLocked() : Boolean
      {
         return var_1839;
      }
      
      public function get prevCallbackId() : int
      {
         return var_1836;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_972;
      }
   }
}
