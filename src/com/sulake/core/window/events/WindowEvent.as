package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_300:String = "WE_CHILD_RESIZED";
      
      public static const const_1264:String = "WE_CLOSE";
      
      public static const const_1328:String = "WE_DESTROY";
      
      public static const const_253:String = "WE_CHANGE";
      
      public static const const_1202:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1437:String = "WE_PARENT_RESIZE";
      
      public static const const_81:String = "WE_UPDATE";
      
      public static const const_1272:String = "WE_MAXIMIZE";
      
      public static const const_375:String = "WE_DESTROYED";
      
      public static const const_779:String = "WE_UNSELECT";
      
      public static const const_1159:String = "WE_MAXIMIZED";
      
      public static const const_1537:String = "WE_UNLOCKED";
      
      public static const const_402:String = "WE_CHILD_REMOVED";
      
      public static const const_201:String = "WE_OK";
      
      public static const const_43:String = "WE_RESIZED";
      
      public static const const_1168:String = "WE_ACTIVATE";
      
      public static const const_263:String = "WE_ENABLED";
      
      public static const const_405:String = "WE_CHILD_RELOCATED";
      
      public static const const_1117:String = "WE_CREATE";
      
      public static const const_697:String = "WE_SELECT";
      
      public static const const_163:String = "";
      
      public static const const_1448:String = "WE_LOCKED";
      
      public static const const_1428:String = "WE_PARENT_RELOCATE";
      
      public static const const_1538:String = "WE_CHILD_REMOVE";
      
      public static const const_1402:String = "WE_CHILD_RELOCATE";
      
      public static const const_1485:String = "WE_LOCK";
      
      public static const const_303:String = "WE_FOCUSED";
      
      public static const const_604:String = "WE_UNSELECTED";
      
      public static const const_810:String = "WE_DEACTIVATED";
      
      public static const const_1326:String = "WE_MINIMIZED";
      
      public static const const_1526:String = "WE_ARRANGED";
      
      public static const const_1516:String = "WE_UNLOCK";
      
      public static const const_1521:String = "WE_ATTACH";
      
      public static const const_1198:String = "WE_OPEN";
      
      public static const const_1309:String = "WE_RESTORE";
      
      public static const const_1430:String = "WE_PARENT_RELOCATED";
      
      public static const const_1186:String = "WE_RELOCATE";
      
      public static const const_1500:String = "WE_CHILD_RESIZE";
      
      public static const const_1505:String = "WE_ARRANGE";
      
      public static const const_1305:String = "WE_OPENED";
      
      public static const const_1119:String = "WE_CLOSED";
      
      public static const const_1503:String = "WE_DETACHED";
      
      public static const const_1401:String = "WE_UPDATED";
      
      public static const const_1285:String = "WE_UNFOCUSED";
      
      public static const const_381:String = "WE_RELOCATED";
      
      public static const const_1296:String = "WE_DEACTIVATE";
      
      public static const const_188:String = "WE_DISABLED";
      
      public static const const_663:String = "WE_CANCEL";
      
      public static const const_537:String = "WE_ENABLE";
      
      public static const const_1097:String = "WE_ACTIVATED";
      
      public static const const_1239:String = "WE_FOCUS";
      
      public static const const_1528:String = "WE_DETACH";
      
      public static const const_1312:String = "WE_RESTORED";
      
      public static const const_1273:String = "WE_UNFOCUS";
      
      public static const const_55:String = "WE_SELECTED";
      
      public static const const_1323:String = "WE_PARENT_RESIZED";
      
      public static const const_1321:String = "WE_CREATED";
      
      public static const const_1440:String = "WE_ATTACHED";
      
      public static const const_1261:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1502:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1284:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1502 = param3;
         var_1284 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1284;
      }
      
      public function get related() : IWindow
      {
         return var_1502;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1284 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
