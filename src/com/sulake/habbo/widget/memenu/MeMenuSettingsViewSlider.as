package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class MeMenuSettingsViewSlider
   {
       
      
      private var var_756:MeMenuSettingsView;
      
      private var var_2229:int;
      
      private var var_524:BitmapData;
      
      private var var_932:Number = 1;
      
      private var var_1385:int;
      
      private var var_630:Number = 0;
      
      private var _sliderContainer:IWindowContainer;
      
      private var var_523:BitmapData;
      
      public function MeMenuSettingsViewSlider(param1:MeMenuSettingsView, param2:IWindowContainer, param3:IAssetLibrary, param4:Number = 0, param5:Number = 1)
      {
         super();
         var_756 = param1;
         _sliderContainer = param2;
         var_630 = param4;
         var_932 = param5;
         storeAssets(param3);
         displaySlider();
      }
      
      private function method_8(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_381)
         {
            return;
         }
         var_756.saveVolume(getValue(param2.x),false);
      }
      
      private function displaySlider() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_sliderContainer == null)
         {
            return;
         }
         _loc2_ = _sliderContainer.findChildByName("slider_base") as IBitmapWrapperWindow;
         if(_loc2_ != null && var_523 != null)
         {
            _loc2_.bitmap = new BitmapData(var_523.width,var_523.height,true,16777215);
            _loc2_.bitmap.copyPixels(var_523,var_523.rect,new Point(0,0),null,null,true);
         }
         _loc1_ = _sliderContainer.findChildByName("slider_movement_area") as IWindowContainer;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.findChildByName("slider_button") as IBitmapWrapperWindow;
            if(_loc2_ != null && var_524 != null)
            {
               _loc2_.bitmap = new BitmapData(var_524.width,var_524.height,true,16777215);
               _loc2_.bitmap.copyPixels(var_524,var_524.rect,new Point(0,0),null,null,true);
               _loc2_.procedure = method_8;
               var_1385 = _loc1_.width - _loc2_.width;
            }
         }
      }
      
      private function storeAssets(param1:IAssetLibrary) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_base"));
         var_523 = BitmapData(_loc2_.content);
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_button"));
         var_524 = BitmapData(_loc2_.content);
      }
      
      public function set max(param1:Number) : void
      {
         var_932 = param1;
         setValue(var_756.volume);
      }
      
      public function dispose() : void
      {
         var_756 = null;
         _sliderContainer = null;
         var_523 = null;
         var_524 = null;
      }
      
      private function getSliderPosition(param1:Number) : int
      {
         return int(var_1385 * (Number(param1 - var_630) / (var_932 - var_630)));
      }
      
      public function set min(param1:Number) : void
      {
         var_630 = param1;
         setValue(var_756.volume);
      }
      
      public function setValue(param1:Number) : void
      {
         if(_sliderContainer == null)
         {
            return;
         }
         var _loc2_:IWindow = _sliderContainer.findChildByName("slider_button");
         if(_loc2_ != null)
         {
            _loc2_.x = getSliderPosition(param1);
         }
      }
      
      private function getValue(param1:Number) : Number
      {
         return param1 / var_1385 * (var_932 - var_630) + var_630;
      }
   }
}
