package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1003:int = 80;
       
      
      private var var_443:Map;
      
      private var var_621:String = "";
      
      private var var_1144:Array;
      
      public function UserRegistry()
      {
         var_443 = new Map();
         var_1144 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_443.getValue(var_1144.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_621;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_443.getValue(param1) != null)
         {
            var_443.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_621);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_621 == "")
         {
            var_1144.push(param1);
         }
         var_443.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_443;
      }
      
      public function unregisterRoom() : void
      {
         var_621 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_443.length > const_1003)
         {
            _loc1_ = var_443.getKey(0);
            var_443.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_621 = param1;
         if(var_621 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
