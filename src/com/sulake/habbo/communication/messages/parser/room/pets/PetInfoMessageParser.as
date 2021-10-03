package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1567:int;
      
      private var var_542:String;
      
      private var var_1539:int;
      
      private var var_1569:int;
      
      private var var_1565:int;
      
      private var var_1568:int;
      
      private var _nutrition:int;
      
      private var var_1051:int;
      
      private var var_1562:int;
      
      private var var_1563:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1564:int;
      
      private var var_1566:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1539;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_1568;
      }
      
      public function flush() : Boolean
      {
         var_1051 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_1562;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_1563;
      }
      
      public function get maxNutrition() : int
      {
         return var_1566;
      }
      
      public function get figure() : String
      {
         return var_542;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1569;
      }
      
      public function get petId() : int
      {
         return var_1051;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1051 = param1.readInteger();
         _name = param1.readString();
         var_1539 = param1.readInteger();
         var_1562 = param1.readInteger();
         var_1565 = param1.readInteger();
         var_1563 = param1.readInteger();
         _energy = param1.readInteger();
         var_1568 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_1566 = param1.readInteger();
         var_542 = param1.readString();
         var_1569 = param1.readInteger();
         var_1564 = param1.readInteger();
         _ownerName = param1.readString();
         var_1567 = param1.readInteger();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1565;
      }
      
      public function get ownerId() : int
      {
         return var_1564;
      }
      
      public function get age() : int
      {
         return var_1567;
      }
   }
}
