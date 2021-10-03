package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct
   {
       
      
      private var var_905:IID;
      
      private var var_364:uint;
      
      private var var_1102:IUnknown;
      
      private var var_1103:String;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_905 = param1;
         var_1103 = getQualifiedClassName(var_905);
         var_1102 = param2;
         var_364 = 0;
      }
      
      public function get iid() : IID
      {
         return var_905;
      }
      
      public function get references() : uint
      {
         return var_364;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_364) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1102;
      }
      
      public function get iis() : String
      {
         return var_1103;
      }
      
      public function reserve() : uint
      {
         return ++var_364;
      }
      
      public function dispose() : void
      {
         var_905 = null;
         var_1103 = null;
         var_1102 = null;
         var_364 = 0;
      }
   }
}
