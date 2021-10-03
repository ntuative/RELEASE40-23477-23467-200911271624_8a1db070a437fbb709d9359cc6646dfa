package com.sulake.habbo.avatar.geometry
{
   public class Node3D
   {
       
      
      private var var_1179:Vector3D;
      
      private var var_534:Vector3D;
      
      public function Node3D(param1:Number, param2:Number, param3:Number)
      {
         var_1179 = new Vector3D();
         super();
         var_534 = new Vector3D(param1,param2,param3);
      }
      
      public function get transformedLocation() : Vector3D
      {
         return var_1179;
      }
      
      public function get location() : Vector3D
      {
         return var_534;
      }
      
      public function applyTransform(param1:Matrix4x4) : void
      {
         var_1179 = param1.vectorMultiplication(var_534);
      }
   }
}
