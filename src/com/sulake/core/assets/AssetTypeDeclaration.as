package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1517:Class;
      
      private var var_1518:Class;
      
      private var var_1519:String;
      
      private var var_1044:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_1519 = param1;
         var_1518 = param2;
         var_1517 = param3;
         if(rest == null)
         {
            var_1044 = new Array();
         }
         else
         {
            var_1044 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_1517;
      }
      
      public function get assetClass() : Class
      {
         return var_1518;
      }
      
      public function get mimeType() : String
      {
         return var_1519;
      }
      
      public function get fileTypes() : Array
      {
         return var_1044;
      }
   }
}
