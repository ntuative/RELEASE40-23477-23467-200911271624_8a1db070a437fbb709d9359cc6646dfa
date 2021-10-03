package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1539:int;
      
      private var var_1569:int;
      
      private var var_1565:int;
      
      private var var_1687:int;
      
      private var _nutrition:int;
      
      private var var_1051:int;
      
      private var var_1688:int;
      
      private var var_1686:int;
      
      private var _energy:int;
      
      private var var_1567:int;
      
      private var var_1685:int;
      
      private var _ownerName:String;
      
      private var var_1564:int;
      
      public function PetInfo()
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
      
      public function set respect(param1:int) : void
      {
         var_1569 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1539 = param1;
      }
      
      public function get petId() : int
      {
         return var_1051;
      }
      
      public function get experienceMax() : int
      {
         return var_1686;
      }
      
      public function get nutritionMax() : int
      {
         return var_1687;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1688 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1564;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1051 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1685;
      }
      
      public function get respect() : int
      {
         return var_1569;
      }
      
      public function get levelMax() : int
      {
         return var_1688;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1686 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1565 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1687 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1564 = param1;
      }
      
      public function get experience() : int
      {
         return var_1565;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1685 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1567 = param1;
      }
      
      public function get age() : int
      {
         return var_1567;
      }
   }
}
