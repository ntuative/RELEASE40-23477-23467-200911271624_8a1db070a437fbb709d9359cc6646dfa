package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1458:String;
      
      private var var_1412:String;
      
      private var var_1000:String;
      
      private var var_366:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1458 = String(param1.@align);
         var_1000 = String(param1.@base);
         var_1412 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_366 = Number(_loc2_);
            if(var_366 > 1)
            {
               var_366 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1458;
      }
      
      public function get ink() : String
      {
         return var_1412;
      }
      
      public function get base() : String
      {
         return var_1000;
      }
      
      public function get isBlended() : Boolean
      {
         return var_366 != 1;
      }
      
      public function get blend() : Number
      {
         return var_366;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
