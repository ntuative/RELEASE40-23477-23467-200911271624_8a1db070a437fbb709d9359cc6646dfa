package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1177:String = "WN_CREATED";
      
      public static const const_982:String = "WN_DISABLE";
      
      public static const const_847:String = "WN_DEACTIVATED";
      
      public static const const_934:String = "WN_OPENED";
      
      public static const const_841:String = "WN_CLOSED";
      
      public static const const_908:String = "WN_DESTROY";
      
      public static const const_1424:String = "WN_ARRANGED";
      
      public static const const_386:String = "WN_PARENT_RESIZED";
      
      public static const const_802:String = "WN_ENABLE";
      
      public static const const_886:String = "WN_RELOCATE";
      
      public static const const_774:String = "WN_FOCUS";
      
      public static const const_783:String = "WN_PARENT_RELOCATED";
      
      public static const const_349:String = "WN_PARAM_UPDATED";
      
      public static const const_678:String = "WN_PARENT_ACTIVATED";
      
      public static const const_258:String = "WN_RESIZED";
      
      public static const const_918:String = "WN_CLOSE";
      
      public static const const_776:String = "WN_PARENT_REMOVED";
      
      public static const const_229:String = "WN_CHILD_RELOCATED";
      
      public static const const_677:String = "WN_ENABLED";
      
      public static const const_256:String = "WN_CHILD_RESIZED";
      
      public static const const_815:String = "WN_MINIMIZED";
      
      public static const const_658:String = "WN_DISABLED";
      
      public static const const_196:String = "WN_CHILD_ACTIVATED";
      
      public static const const_446:String = "WN_STATE_UPDATED";
      
      public static const const_559:String = "WN_UNSELECTED";
      
      public static const const_380:String = "WN_STYLE_UPDATED";
      
      public static const const_1380:String = "WN_UPDATE";
      
      public static const const_443:String = "WN_PARENT_ADDED";
      
      public static const const_507:String = "WN_RESIZE";
      
      public static const const_694:String = "WN_CHILD_REMOVED";
      
      public static const const_1527:String = "";
      
      public static const const_953:String = "WN_RESTORED";
      
      public static const const_298:String = "WN_SELECTED";
      
      public static const const_861:String = "WN_MINIMIZE";
      
      public static const const_923:String = "WN_FOCUSED";
      
      public static const const_1241:String = "WN_LOCK";
      
      public static const const_283:String = "WN_CHILD_ADDED";
      
      public static const const_823:String = "WN_UNFOCUSED";
      
      public static const const_471:String = "WN_RELOCATED";
      
      public static const const_767:String = "WN_DEACTIVATE";
      
      public static const const_1246:String = "WN_CRETAE";
      
      public static const const_972:String = "WN_RESTORE";
      
      public static const const_293:String = "WN_ACTVATED";
      
      public static const const_1196:String = "WN_LOCKED";
      
      public static const const_352:String = "WN_SELECT";
      
      public static const const_817:String = "WN_MAXIMIZE";
      
      public static const const_964:String = "WN_OPEN";
      
      public static const const_630:String = "WN_UNSELECT";
      
      public static const const_1534:String = "WN_ARRANGE";
      
      public static const const_1295:String = "WN_UNLOCKED";
      
      public static const const_1507:String = "WN_UPDATED";
      
      public static const const_778:String = "WN_ACTIVATE";
      
      public static const const_1179:String = "WN_UNLOCK";
      
      public static const const_871:String = "WN_MAXIMIZED";
      
      public static const const_974:String = "WN_DESTROYED";
      
      public static const const_771:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1502,cancelable);
      }
   }
}
