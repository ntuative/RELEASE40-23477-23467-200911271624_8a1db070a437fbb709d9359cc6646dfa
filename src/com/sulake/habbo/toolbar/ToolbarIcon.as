package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ToolbarIcon
   {
       
      
      private var var_456:ToolbarIconGroup;
      
      private var var_955:Boolean = false;
      
      private var var_1886:String;
      
      private var var_707:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_956:String = "-1";
      
      private var _window:IBitmapWrapperWindow;
      
      private var _state:String = "-1";
      
      private var var_102:IRegionWindow;
      
      private var _bitmapData:BitmapData;
      
      private var var_768:String;
      
      private var var_1756:int;
      
      private var var_639:Timer;
      
      private var var_1413:Array;
      
      private var var_954:ToolbarIconBouncer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_2186:Array;
      
      private var var_334:ToolbarBarMenuAnimator;
      
      private var var_388:ToolbarIconAnimator;
      
      private var var_532:Array;
      
      private var var_770:Array;
      
      private var var_769:String = "-1";
      
      private var var_2233:Boolean = true;
      
      private var var_953:Array;
      
      private var var_1190:Timer;
      
      private var var_1885:int;
      
      private var var_89:Number = 0;
      
      private var _y:Number = 0;
      
      public function ToolbarIcon(param1:ToolbarIconGroup, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IEventDispatcher, param6:ToolbarBarMenuAnimator)
      {
         var_532 = new Array();
         var_770 = new Array();
         var_2186 = new Array();
         var_954 = new ToolbarIconBouncer(0.8,1);
         super();
         var_456 = param1;
         _windowManager = param2;
         _assetLibrary = param3;
         var_768 = param4;
         _events = param5;
         var_334 = param6;
         var_1190 = new Timer(40,40);
         var_1190.addEventListener(TimerEvent.TIMER,updateBouncer);
         var_102 = param2.createWindow("TOOLBAR_ICON_" + param4 + "_REGION","",WindowType.const_422,HabboWindowStyle.const_39,HabboWindowParam.const_34,new Rectangle(0,0,1,1),onMouseEvent) as IRegionWindow;
         var_102.background = true;
         var_102.alphaTreshold = 0;
         var_102.visible = false;
         _window = IBitmapWrapperWindow(param2.createWindow("TOOLBAR_ICON_" + param4,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_39,HabboWindowParam.const_39,new Rectangle(0,0,1,1),onMouseEvent,0));
         var_102.addChild(_window);
         _window.addEventListener(WindowEvent.const_43,onWindowResized);
      }
      
      private function getStateObject(param1:String) : StateItem
      {
         return var_1413[var_953.indexOf(param1)];
      }
      
      public function get windowOffsetFromIcon() : Number
      {
         return var_1885;
      }
      
      public function get iconId() : String
      {
         return var_768;
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         updateRegion();
      }
      
      public function changePosition(param1:Number) : void
      {
         var_707 = param1;
         updateRegion();
      }
      
      public function setIcon(param1:Boolean = true) : void
      {
         exists = param1;
         setAnimator();
      }
      
      public function set state(param1:String) : void
      {
         _state = param1;
         exists = true;
         setAnimator();
         setTooltip();
      }
      
      private function updateRegion() : void
      {
         if(var_102 == null || _window == null)
         {
            return;
         }
         var_102.width = _window.width;
         var_102.height = _window.height;
         var _loc1_:Boolean = false;
         if(_loc1_)
         {
            var_89 = (0 - 0) / 2;
            _y = var_707 + (0 - 0) / 2;
         }
         else
         {
            var_89 = var_707 + (0 - 0) / 2;
            _y = (0 - 0) / 2;
         }
         var_102.x = var_89;
         var_102.y = _y;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_102 != null)
         {
            var_102.dispose();
            var_102 = null;
         }
         var_532 = null;
         var_770 = null;
         exists = false;
         _windowManager = null;
         _events = null;
         var_334 = null;
         var_388 = null;
         _bitmapData = null;
      }
      
      public function dockMenu(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(var_532.indexOf(param1) < 0)
         {
            var_532.push(param1);
            _loc4_ = new MenuSettingsItem(param1,param2,param3);
            var_770.push(_loc4_);
         }
      }
      
      private function onMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!var_955)
         {
            return;
         }
         var _loc3_:StateItem = getCurrentStateObject();
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(_events != null)
               {
                  _loc4_ = new HabboToolbarEvent(HabboToolbarEvent.const_62);
                  _loc4_.iconId = var_768;
                  _events.dispatchEvent(_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(false)
               {
                  if(_loc3_.hasStateOver)
                  {
                     state = _loc3_.stateOver;
                  }
                  else
                  {
                     state = var_956;
                  }
               }
               break;
            case WindowMouseEvent.const_28:
               if(false)
               {
                  if(_loc3_.hasDefaultState)
                  {
                     state = _loc3_.defaultState;
                  }
                  else
                  {
                     state = var_769;
                  }
               }
         }
      }
      
      public function docksMenu(param1:String) : Boolean
      {
         return var_532.indexOf(param1) > -1;
      }
      
      public function menuLockedToIcon(param1:String) : Boolean
      {
         if(!docksMenu(param1))
         {
            return false;
         }
         var _loc2_:MenuSettingsItem = var_770[var_532.indexOf(param1)];
         return _loc2_.lockToIcon;
      }
      
      public function set exists(param1:Boolean) : void
      {
         var_955 = param1;
         if(var_102 != null)
         {
            var_102.visible = var_955;
         }
      }
      
      private function setTooltip() : void
      {
         if(var_102 == null)
         {
            return;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && _loc1_.tooltip != null)
         {
            var_102.toolTipCaption = "${toolbar.icon.tooltip." + _loc1_.tooltip + "}";
         }
         else
         {
            var_102.toolTipCaption = "${toolbar.icon.tooltip." + var_1886.toLowerCase() + "}";
         }
         var_102.toolTipDelay = 100;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Number, param4:String, param5:Point) : void
      {
         if(var_334 != null)
         {
            var_334.animateWindowIn(this,param1,param2,var_768,param3,param4,getMenuYieldList(param1));
         }
      }
      
      private function updateAnimator(param1:Event) : void
      {
         if(var_388 != null && _window != null)
         {
            var_388.update(_window);
            if(var_388.hasNextState())
            {
               state = var_388.nextState;
            }
         }
      }
      
      public function defineFromXML(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_1413 = new Array();
         var_953 = new Array();
         var_1886 = param1.@id;
         var_1885 = int(param1.@window_offset_from_icon);
         var_1756 = int(param1.@window_margin);
         var _loc2_:XMLList = param1.elements("state");
         if(_loc2_.length() > 0)
         {
            if(param1.attribute("state_over").length() > 0)
            {
               var_956 = param1.@state_over;
            }
            if(param1.attribute("state_default").length() > 0)
            {
               var_769 = param1.@state_default;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length())
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new StateItem(_loc4_,param1.@id.toLowerCase());
               var_953.push(_loc5_.id);
               var_1413.push(_loc5_);
               if(_loc3_ == 0)
               {
                  if(var_956 == "-1")
                  {
                     var_956 = _loc5_.id;
                  }
                  if(var_769 == "-1")
                  {
                     var_769 = _loc5_.id;
                  }
               }
               _loc3_++;
            }
         }
         _state = var_769;
      }
      
      public function setIconBitmapData(param1:BitmapData = null) : void
      {
         exists = true;
         _bitmapData = param1;
         setAnimator();
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_334 != null)
         {
            var_334.hideWindow(param1,param2,var_768,param3);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_334 != null)
         {
            var_334.positionWindow(this,param1,param2,var_768,param3,getMenuYieldList(param1));
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer, param3:String) : void
      {
         if(var_334 != null)
         {
            var_334.animateWindowOut(this,param1,param2,param3);
         }
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get exists() : Boolean
      {
         return var_955;
      }
      
      private function updateBouncer(param1:Event) : void
      {
         if(var_954 != null && _window != null)
         {
            var_954.update();
            _window.y = var_954.location;
         }
      }
      
      private function setAnimator() : void
      {
         if(var_639 != null)
         {
            var_639.stop();
            var_639 = null;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && var_955)
         {
            if(_loc1_.frames == null)
            {
               return;
            }
            var_388 = new ToolbarIconAnimator(_loc1_,_assetLibrary,_window,var_89,_y,_bitmapData);
            if(false)
            {
               var_639 = new Timer(_loc1_.timer);
               var_639.addEventListener(TimerEvent.TIMER,updateAnimator);
               var_639.start();
            }
            if(_loc1_.bounce)
            {
               var_954.reset(-7);
               var_1190.reset();
               var_1190.start();
            }
         }
         else
         {
            var_388 = null;
            _window.bitmap = null;
         }
      }
      
      public function get windowMargin() : Number
      {
         return var_1756 + var_456.windowMargin;
      }
      
      private function getCurrentStateObject() : StateItem
      {
         return getStateObject(_state);
      }
      
      public function get window() : IWindow
      {
         return var_102;
      }
      
      public function get x() : Number
      {
         return var_89;
      }
      
      private function getMenuYieldList(param1:String) : Array
      {
         if(!docksMenu(param1))
         {
            return null;
         }
         var _loc2_:MenuSettingsItem = var_770[var_532.indexOf(param1)];
         return _loc2_.yieldList;
      }
      
      public function get group() : ToolbarIconGroup
      {
         return var_456;
      }
   }
}
