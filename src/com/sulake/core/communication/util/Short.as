package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_641:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_641 = new ByteArray();
         var_641.writeShort(param1);
         var_641.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_641.position = 0;
         if(false)
         {
            _loc1_ = var_641.readShort();
            var_641.position = 0;
         }
         return _loc1_;
      }
   }
}
