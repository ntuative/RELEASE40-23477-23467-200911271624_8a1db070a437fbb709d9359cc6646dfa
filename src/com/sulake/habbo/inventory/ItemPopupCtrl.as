package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      private static const const_991:int = 100;
      
      private static const const_990:int = 200;
      
      private static const const_993:int = 180;
      
      public static const const_829:int = 1;
      
      public static const const_466:int = 2;
      
      private static const const_992:int = 250;
      
      private static const const_725:int = 5;
       
      
      private var var_506:BitmapData;
      
      private var var_279:Timer;
      
      private var var_23:IWindowContainer;
      
      private var var_603:BitmapData;
      
      private var var_280:Timer;
      
      private var var_75:IWindowContainer;
      
      private var var_1320:int = 2;
      
      private var _assets:IAssetLibrary;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         var_280 = new Timer(const_992,1);
         var_279 = new Timer(const_991,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         var_75 = param1;
         var_75.visible = false;
         _assets = param2;
         var_280.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_279.addEventListener(TimerEvent.TIMER,onHideTimer);
         var _loc3_:BitmapDataAsset = _assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_603 = _loc3_.content as BitmapData;
         }
         _loc3_ = _assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_506 = _loc3_.content as BitmapData;
         }
      }
      
      public function hide() : void
      {
         var_75.visible = false;
         var_279.reset();
         var_280.reset();
         if(var_23 != null)
         {
            var_23.removeChild(var_75);
         }
      }
      
      public function hideDelayed() : void
      {
         var_279.reset();
         var_280.reset();
         var_279.start();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         hide();
      }
      
      public function dispose() : void
      {
         if(var_280 != null)
         {
            var_280.removeEventListener(TimerEvent.TIMER,onDisplayTimer);
            var_280.stop();
            var_280 = null;
         }
         if(var_279 != null)
         {
            var_279.removeEventListener(TimerEvent.TIMER,onHideTimer);
            var_279.stop();
            var_279 = null;
         }
         _assets = null;
         var_75 = null;
         var_23 = null;
         var_506 = null;
         var_603 = null;
      }
      
      public function showDelayed() : void
      {
         var_279.reset();
         var_280.reset();
         var_280.start();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         show();
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(var_75 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(var_23 != null)
         {
            var_23.removeChild(var_75);
         }
         var_23 = param1;
         var_1320 = param4;
         var _loc5_:ITextWindow = ITextWindow(var_75.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = var_75.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_993,param3.width),Math.min(const_990,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (0 - _loc6_.width) / 2;
            var_75.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(var_75 == null || false)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(var_75.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_829:
               _loc2_.bitmap = var_603.clone();
               _loc2_.width = var_603.width;
               _loc2_.height = var_603.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = -1;
               break;
            case const_466:
               _loc2_.bitmap = var_506.clone();
               _loc2_.width = var_506.width;
               _loc2_.height = var_506.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = 1;
         }
         _loc2_.invalidate();
      }
      
      public function show() : void
      {
         var_279.reset();
         var_280.reset();
         if(var_23 == null)
         {
            return;
         }
         var_75.visible = true;
         var_23.addChild(var_75);
         refreshArrow(var_1320);
         switch(var_1320)
         {
            case const_829:
               var_75.x = 0 - const_725;
               break;
            case const_466:
               var_75.x = var_23.width + const_725;
         }
         var_75.y = (0 - 0) / 2;
      }
   }
}
