package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_88:Number = 0;
      
      private var var_218:int = 0;
      
      private var var_1648:int = 0;
      
      private var var_2037:Number = 0;
      
      private var var_2036:Number = 0;
      
      private var var_2035:Number = 0;
      
      private var var_2039:Number = 0;
      
      private var var_2038:Boolean = false;
      
      private var var_89:Number = 0;
      
      private var _id:int = 0;
      
      private var var_195:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_195 = [];
         super();
         _id = param1;
         var_89 = param2;
         _y = param3;
         var_88 = param4;
         var_2039 = param5;
         var_218 = param6;
         var_1648 = param7;
         var_2037 = param8;
         var_2036 = param9;
         var_2035 = param10;
         var_2038 = param11;
         var_195 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_88;
      }
      
      public function get dir() : int
      {
         return var_218;
      }
      
      public function get localZ() : Number
      {
         return var_2039;
      }
      
      public function get isMoving() : Boolean
      {
         return var_2038;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1648;
      }
      
      public function get targetX() : Number
      {
         return var_2037;
      }
      
      public function get targetY() : Number
      {
         return var_2036;
      }
      
      public function get targetZ() : Number
      {
         return var_2035;
      }
      
      public function get x() : Number
      {
         return var_89;
      }
      
      public function get actions() : Array
      {
         return var_195.slice();
      }
   }
}
