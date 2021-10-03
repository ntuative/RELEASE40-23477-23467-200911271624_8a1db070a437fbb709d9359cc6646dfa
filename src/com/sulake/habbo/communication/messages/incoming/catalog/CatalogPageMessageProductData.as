package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_319:String = "e";
      
      public static const const_135:String = "i";
      
      public static const const_169:String = "s";
       
      
      private var var_871:String;
      
      private var var_1041:String;
      
      private var var_1042:int;
      
      private var var_1917:int;
      
      private var var_872:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1041 = param1.readString();
         var_1917 = param1.readInteger();
         var_871 = param1.readString();
         var_872 = param1.readInteger();
         var_1042 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_872;
      }
      
      public function get productType() : String
      {
         return var_1041;
      }
      
      public function get expiration() : int
      {
         return var_1042;
      }
      
      public function get furniClassId() : int
      {
         return var_1917;
      }
      
      public function get extraParam() : String
      {
         return var_871;
      }
   }
}
