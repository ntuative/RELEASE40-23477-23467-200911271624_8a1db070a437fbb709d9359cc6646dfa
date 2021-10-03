package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2004:int;
      
      private var var_2001:int;
      
      private var var_972:String;
      
      private var var_1660:int;
      
      private var var_2005:String;
      
      private var var_2000:int;
      
      private var var_2002:int;
      
      private var _category:int;
      
      private var var_1999:int;
      
      private var var_1997:int;
      
      private var var_1998:int;
      
      private var var_2003:Boolean;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:Boolean, param12:int)
      {
         super();
         var_1660 = param1;
         var_972 = param2;
         var_2001 = param3;
         var_1998 = param4;
         _category = param5;
         var_2005 = param6;
         var_2000 = param7;
         var_2004 = param8;
         var_1997 = param9;
         var_2002 = param10;
         var_2003 = param11;
         var_1999 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1998;
      }
      
      public function get groupable() : Boolean
      {
         return var_2003;
      }
      
      public function get creationMonth() : int
      {
         return var_1997;
      }
      
      public function get roomItemID() : int
      {
         return var_2001;
      }
      
      public function get itemType() : String
      {
         return var_972;
      }
      
      public function get itemID() : int
      {
         return var_1660;
      }
      
      public function get itemSpecificData() : String
      {
         return var_2005;
      }
      
      public function get songID() : int
      {
         return var_1999;
      }
      
      public function get timeToExpiration() : int
      {
         return var_2000;
      }
      
      public function get creationYear() : int
      {
         return var_2002;
      }
      
      public function get creationDay() : int
      {
         return var_2004;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
