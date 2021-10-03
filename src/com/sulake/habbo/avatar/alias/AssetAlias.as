package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_890:Boolean;
      
      private var _name:String;
      
      private var var_2028:String;
      
      private var var_889:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_2028 = String(param1.@link);
         var_889 = Boolean(parseInt(param1.@fliph));
         var_890 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_889;
      }
      
      public function get flipV() : Boolean
      {
         return var_890;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_2028;
      }
   }
}
