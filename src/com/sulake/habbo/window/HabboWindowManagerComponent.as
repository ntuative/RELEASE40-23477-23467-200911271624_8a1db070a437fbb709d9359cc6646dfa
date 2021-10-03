package com.sulake.habbo.window
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.ICoreUpdateReceiver;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IIDProfiler;
   import com.sulake.core.runtime.IProfiler;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.Map;
   import com.sulake.core.utils.profiler.ProfilerAgentTask;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContext;
   import com.sulake.core.window.IWindowContextStateListener;
   import com.sulake.core.window.IWindowFactory;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.enum.MouseCursorType;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.graphics.ISkinContainer;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.graphics.SkinContainer;
   import com.sulake.core.window.graphics.WindowRenderer;
   import com.sulake.core.window.utils.INotify;
   import com.sulake.habbo.tracking.HabboErrorVariableEnum;
   import com.sulake.habbo.window.enum.HabboWindowTrackingEvent;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import com.sulake.habbo.window.utils.AlertDialog;
   import com.sulake.habbo.window.utils.AlertDialogWithLink;
   import com.sulake.habbo.window.utils.ConfirmDialog;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.habbo.window.utils.IAlertDialogWithLink;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import com.sulake.habbo.window.utils.ProfilerOutput;
   import com.sulake.iid.IIDCoreLocalizationManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class HabboWindowManagerComponent extends Component implements IHabboWindowManager, ICoreWindowManager, IWindowFactory, ICoreUpdateReceiver, IWindowContextStateListener
   {
      
      private static const const_336:uint = 3;
      
      private static var _instance:IHabboWindowManager;
      
      private static const const_1062:uint = 1;
       
      
      private var var_185:Stage;
      
      private var var_296:Array;
      
      private var var_2246:Array;
      
      private var var_359:IWindowContext;
      
      private var var_808:Array;
      
      private var var_984:Boolean = false;
      
      private var var_1238:ProfilerAgentTask;
      
      private var var_1237:IEventDispatcher;
      
      private var var_2245:uint = 0;
      
      private var var_1239:ProfilerAgentTask;
      
      private var var_1240:ProfilerOutput;
      
      private var var_661:IWindowRenderer;
      
      private var _localization:ICoreLocalizationManager;
      
      public function HabboWindowManagerComponent(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var _loc4_:* = null;
         super(param1,param2,param3);
         if(param1 is CoreComponent)
         {
            var_185 = CoreComponent(param1).root.stage;
            _instance = this;
            var_1237 = Component(param1).events;
            var_808 = new Array();
            _loc4_ = new Dictionary();
            _loc4_["null"] = null;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_frame_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_simple_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_frame_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_header_xml").content as XML;
            _loc4_["null"] = null;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_scrollbar_horizontal_xml").content as XML;
            _loc4_["null"] = null;
            _loc4_["null"] = null;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_thick_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_xml").content as XML;
            _loc4_["null"] = null;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_scrollbar_vertical_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_dropmenu_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_dropmenu_item_xml").content as XML;
            _loc4_["null"] = null;
            _loc4_["null"] = null;
            _loc4_["null"] = null;
            _loc4_["null"] = null;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_tab_button_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_tab_context_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_tooltip_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_scrollable_itemlist_vertical_xml").content as XML;
            var_808.push(_loc4_);
            _loc4_ = new Dictionary();
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_black_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_header_black_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_thick_black_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_black_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_black_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_black_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_dropmenu_black_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_dropmenu_item_black_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_tab_button_black_xml").content as XML;
            var_808.push(_loc4_);
            _loc4_ = new Dictionary();
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_thick_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_xml").content as XML;
            _loc4_["null"] = param3.getAssetByName("habbo_window_layout_tab_button_xml").content as XML;
            var_808.push(_loc4_);
            queueInterface(new IIDCoreLocalizationManager(),initialize);
            queueInterface(new IIDProfiler(),receiveProfilerInterface);
            return;
         }
         throw new Error("HabboWindowManagerComponent expects to be linked to CoreComponent!");
      }
      
      public static function getInstance() : IHabboWindowManager
      {
         return _instance;
      }
      
      public function getWindowByName(param1:String, param2:uint = 1) : IWindow
      {
         return var_296[param2].getDesktopWindow().getChildByName(param1);
      }
      
      private function onTestEvent(param1:Event, param2:IWindow) : void
      {
      }
      
      public function createWindow(param1:String, param2:String = "", param3:uint = 0, param4:uint = 0, param5:uint = 0, param6:Rectangle = null, param7:Function = null, param8:uint = 0, param9:uint = 1) : IWindow
      {
         return var_296[param9].create(param1,param2,param3,param4,param5,param6,param7,null,param8,null,null);
      }
      
      private function initialize(param1:IID, param2:IUnknown) : void
      {
         var _loc5_:* = null;
         var _loc7_:* = null;
         _localization = param2 as ICoreLocalizationManager;
         var _loc3_:XmlAsset = assets.getAssetByName("habbo_element_description_xml") as XmlAsset;
         var _loc4_:ISkinContainer = new SkinContainer(_loc3_.content as XML,assets);
         var_661 = new WindowRenderer(_loc4_);
         var_296 = new Array(const_336);
         var _loc6_:int = 0;
         while(_loc6_ < const_336)
         {
            _loc5_ = new WindowContext("layer_" + _loc6_,var_661,this,_localization,var_185,new Rectangle(0,0,var_185.stageWidth,var_185.stageHeight),this);
            var_296[_loc6_] = _loc5_;
            _loc6_++;
         }
         var_359 = var_296[const_1062];
         registerUpdateReceiver(this,0);
         _loc7_ = new Bitmap(assets.getAssetByName("habbo_cursor_link_png").content as BitmapData);
         var_359.getMouseCursor().defineCustomCursorType(MouseCursorType.const_320,_loc7_);
         _loc7_ = new Bitmap(assets.getAssetByName("habbo_cursor_drag_png").content as BitmapData);
         var_359.getMouseCursor().defineCustomCursorType(MouseCursorType.const_1154,_loc7_);
      }
      
      public function removeWindow(param1:String, param2:uint = 1) : void
      {
         var _loc3_:IDesktopWindow = var_296[param2].getDesktopWindow();
         var _loc4_:IWindow = _loc3_.getChildByName(param1);
         if(_loc4_ != null)
         {
            _loc4_.destroy();
         }
      }
      
      override public function dispose() : void
      {
         if(!_isDisposed)
         {
            removeUpdateReceiver(this);
            while(false)
            {
               IDisposable(var_296.pop()).dispose();
            }
            if(var_1240 != null)
            {
               var_1240.dispose();
               release(new IIDProfiler());
            }
            if(var_661)
            {
               var_661.dispose();
               var_661 = null;
            }
            super.dispose();
         }
      }
      
      public function getActiveWindow(param1:uint = 1) : IWindow
      {
         return var_296[param1].getDesktopWindow().getChildAt(var_359.getDesktopWindow().numChildren - 1);
      }
      
      private function receiveProfilerInterface(param1:IID, param2:IUnknown) : void
      {
         var _loc3_:* = null;
         if(var_1240 == null)
         {
            _loc3_ = param2 as IProfiler;
            if(_loc3_ != null)
            {
               var_1240 = new ProfilerOutput(_loc3_,this,var_661);
               var_1238 = new ProfilerAgentTask("Update","Event processing");
               _loc3_.getProfilerAgentForReceiver(this).addSubTask(var_1238);
               var_1239 = new ProfilerAgentTask("Redraw","Window rasterizer");
               _loc3_.getProfilerAgentForReceiver(this).addSubTask(var_1239);
               var_984 = true;
            }
         }
      }
      
      public function registerLocalizationParameter(param1:String, param2:String, param3:String, param4:String = "%") : void
      {
         _localization.registerParameter(param1,param2,param3,param4);
      }
      
      private function receiveLoggerInterface(param1:IID, param2:IUnknown) : void
      {
      }
      
      private function onCrashTest(param1:WindowMouseEvent) : void
      {
         Logger.log("CRASH!");
         null.background = true;
      }
      
      public function buildFromXML(param1:XML, param2:uint = 1, param3:Map = null) : IWindow
      {
         return getWindowContextLayer(param2).getWindowParser().parseAndConstruct(param1,null,param3);
      }
      
      public function confirm(param1:String, param2:String, param3:uint, param4:Function) : IConfirmDialog
      {
         var _loc5_:IAsset = assets.getAssetByName("habbo_window_confirm_xml");
         if(!_loc5_)
         {
            throw new Error("Failed to initialize aleret dialog; missing asset!");
         }
         var _loc6_:XML = _loc5_.content as XML;
         return new ConfirmDialog(this,_loc6_,param1,param2,param3,param4);
      }
      
      public function notify(param1:String, param2:String, param3:Function, param4:uint = 0) : INotify
      {
         var _loc5_:IAsset = assets.getAssetByName("habbo_window_alert_xml");
         if(!_loc5_)
         {
            throw new Error("Failed to initialize alert dialog; missing asset!");
         }
         var _loc6_:XML = _loc5_.content as XML;
         return new AlertDialog(this,_loc6_,param1,param2,param4,param3);
      }
      
      public function windowToXMLString(param1:IWindow) : String
      {
         return var_359.getWindowParser().windowToXMLString(param1);
      }
      
      public function alert(param1:String, param2:String, param3:uint, param4:Function) : IAlertDialog
      {
         var _loc5_:IAsset = assets.getAssetByName("habbo_window_alert_xml");
         if(!_loc5_)
         {
            throw new Error("Failed to initialize alert dialog; missing asset!");
         }
         var _loc6_:XML = _loc5_.content as XML;
         return new AlertDialog(this,_loc6_,param1,param2,param3,param4);
      }
      
      public function getWindowContextLayer(param1:uint) : IWindowContext
      {
         return var_296[param1];
      }
      
      public function alertWithLink(param1:String, param2:String, param3:String, param4:String, param5:uint, param6:Function) : IAlertDialogWithLink
      {
         var _loc7_:IAsset = assets.getAssetByName("habbo_window_alert_link_xml");
         if(!_loc7_)
         {
            throw new Error("Failed to initialize alert dialog; missing asset!");
         }
         var _loc8_:XML = _loc7_.content as XML;
         return new AlertDialogWithLink(this,_loc8_,param1,param2,param3,param4,param5,param6);
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(var_984)
         {
            var_1238.start();
         }
         if(WindowContext.var_851.length > 0)
         {
            var_1237.dispatchEvent(new Event(HabboWindowTrackingEvent.HABBO_WINDOW_TRACKING_EVENT_INPUT));
            _loc2_ = const_336 - 1;
            while(_loc2_ >= 0)
            {
               var_296[_loc2_].update(param1);
               _loc2_--;
            }
         }
         if(var_984)
         {
            var_1238.stop();
         }
         if(var_984)
         {
            var_1239.start();
         }
         var_1237.dispatchEvent(new Event(HabboWindowTrackingEvent.HABBO_WINDOW_TRACKING_EVENT_RENDER));
         _loc2_ = 0;
         while(_loc2_ < const_336)
         {
            var_296[_loc2_].render(param1);
            _loc2_++;
         }
         if(var_984)
         {
            var_1239.stop();
         }
         if(WindowContext.var_851.length > 0)
         {
            WindowContext.var_851.flush();
         }
         if(WindowContext.var_1274.length > 0)
         {
            WindowContext.var_1274.flush();
         }
         var_1237.dispatchEvent(new Event(HabboWindowTrackingEvent.HABBO_WINDOW_TRACKING_EVENT_SLEEP));
      }
      
      public function getLayoutByType(param1:uint, param2:uint) : XML
      {
         var _loc3_:Dictionary = var_808[param2] as Dictionary;
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:XML = _loc3_[param1] as XML;
         return _loc4_ == null ? var_808[0][param1] as XML : _loc4_;
      }
      
      public function destroy(param1:IWindow) : void
      {
         param1.destroy();
      }
      
      public function create(param1:String, param2:uint, param3:uint, param4:uint, param5:Rectangle, param6:Function = null, param7:String = "", param8:uint = 0, param9:Array = null, param10:IWindow = null, param11:Array = null) : IWindow
      {
         return var_359.create(param1,param7,param2,param3,param4,param5,param6,param10,param8,param11,param9);
      }
      
      public function mouseEventReceived(param1:String, param2:IWindow) : void
      {
         if(param2 != null)
         {
            if(param1 == MouseEvent.CLICK)
            {
               ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1138,new Date().getTime().toString());
               ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1250,param2.name + ": " + param2.toString());
            }
            else if(param1 == MouseEvent.MOUSE_UP)
            {
               ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1188,new Date().getTime().toString());
               ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1313,param2.name + ": " + param2.toString());
            }
         }
      }
   }
}
