package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_78:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_218:Vector3d = null;
      
      private var var_1856:int = 0;
      
      private var var_1966:String = null;
      
      private var _category:int = 0;
      
      private var var_1965:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         _id = param1;
         _category = param2;
         var_1965 = param3;
         var_78 = new Vector3d();
         var_78.assign(param4);
         var_218 = new Vector3d();
         var_218.assign(param5);
         var_1856 = param6;
         var_1966 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return var_78;
      }
      
      public function get typeId() : int
      {
         return var_1856;
      }
      
      public function get dir() : Vector3d
      {
         return var_218;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get instanceData() : String
      {
         return var_1966;
      }
      
      public function get operation() : String
      {
         return var_1965;
      }
      
      public function dispose() : void
      {
         var_78 = null;
         var_218 = null;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
