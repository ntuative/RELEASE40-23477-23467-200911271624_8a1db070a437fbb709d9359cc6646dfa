package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1409:String;
      
      private var var_855:String;
      
      private var var_1410:String;
      
      private var var_1408:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1408 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1409 = _loc5_[0];
         var_1410 = _loc5_[1];
         _name = param2;
         var_855 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1409;
      }
      
      public function get languageCode() : String
      {
         return var_1408;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_855;
      }
      
      public function get encoding() : String
      {
         return var_1410;
      }
      
      public function get id() : String
      {
         return var_1408 + "_" + var_1409 + "." + var_1410;
      }
   }
}
