package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1985:Date;
      
      private var var_1242:Boolean = false;
      
      private var _type:int;
      
      private var var_351:BitmapData;
      
      private var var_243:Boolean = false;
      
      private var var_1108:int;
      
      private var var_553:int = 1;
      
      private var var_985:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_351;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_553;
         if(var_553 < 0)
         {
            var_553 = 0;
         }
         var_985 = var_1108;
         var_243 = false;
         var_1242 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_985 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_243;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_351 = param1;
      }
      
      public function get duration() : int
      {
         return var_1108;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1242;
      }
      
      public function get effectsInInventory() : int
      {
         return var_553;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_351;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_243)
         {
            var_1985 = new Date();
         }
         var_243 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_553 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_243)
         {
            _loc1_ = var_985 - (new Date().valueOf() - var_1985.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_985;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1242 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1108 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
