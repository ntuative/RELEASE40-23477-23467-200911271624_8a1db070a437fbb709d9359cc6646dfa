package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_617:IWindowContainer;
      
      private var var_914:ITextWindow;
      
      private var var_190:RoomSettingsCtrl;
      
      private var var_1129:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_440:Timer;
      
      private var var_1132:ITextWindow;
      
      private var var_324:IWindowContainer;
      
      private var var_1755:IWindowContainer;
      
      private var var_1753:ITextWindow;
      
      private var var_739:IWindowContainer;
      
      private var var_1355:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_621:ITextWindow;
      
      private var var_1354:IWindowContainer;
      
      private var var_1127:IWindowContainer;
      
      private var var_737:ITextWindow;
      
      private var var_913:ITextFieldWindow;
      
      private var var_283:IWindowContainer;
      
      private var var_736:ITextWindow;
      
      private var var_1357:IButtonWindow;
      
      private var var_915:ITextWindow;
      
      private var var_2171:int;
      
      private var var_1130:IContainerButtonWindow;
      
      private var var_738:IWindowContainer;
      
      private var var_1131:ITextWindow;
      
      private var var_1128:IContainerButtonWindow;
      
      private var var_1353:ITextWindow;
      
      private var var_1356:IButtonWindow;
      
      private var var_882:TagRenderer;
      
      private var var_1581:ITextWindow;
      
      private var var_325:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_618:ITextWindow;
      
      private var var_248:RoomThumbnailCtrl;
      
      private var var_1126:IContainerButtonWindow;
      
      private var var_1754:IWindowContainer;
      
      private var var_247:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_325 = new RoomEventViewCtrl(_navigator);
         var_190 = new RoomSettingsCtrl(_navigator,this,true);
         var_248 = new RoomThumbnailCtrl(_navigator);
         var_882 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_190);
         var_440 = new Timer(6000,1);
         var_440.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_190.active = true;
         this.var_325.active = false;
         this.var_248.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1355.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1356.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1354.visible = Util.hasVisibleChildren(var_1354);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_621.text = param1.roomName;
         var_621.height = NaN;
         _ownerName.text = param1.ownerName;
         var_737.text = param1.description;
         var_882.refreshTags(var_324,param1.tags);
         var_737.visible = false;
         if(param1.description != "")
         {
            var_737.height = NaN;
            var_737.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_324,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_324,"thumb_down",_loc3_,onThumbDown,0);
         var_1753.visible = _loc3_;
         var_736.visible = !_loc3_;
         var_1353.visible = !_loc3_;
         var_1353.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_324,"home",param2,null,0);
         _navigator.refreshButton(var_324,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_324,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_621.y,0);
         var_324.visible = true;
         var_324.height = Util.getLowestPoint(var_324);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_374,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1357.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1129.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1126.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1130.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1128.visible = _navigator.data.canEditRoomSettings && param1;
         var_1127.visible = Util.hasVisibleChildren(var_1127);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_440.reset();
         this.var_325.active = false;
         this.var_190.active = false;
         this.var_248.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_48,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this.var_440.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_440.reset();
         this.var_325.active = false;
         this.var_190.active = false;
         this.var_248.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_48,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_374,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_283);
         var_283.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_190.refresh(var_283);
         this.var_248.refresh(var_283);
         Util.moveChildrenToColumn(var_283,["room_details","room_buttons"],0,2);
         var_283.height = Util.getLowestPoint(var_283);
         var_283.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_913.setSelection(0,var_913.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_247);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_325.refresh(var_247);
         if(Util.hasVisibleChildren(var_247) && !this.var_248.active)
         {
            Util.moveChildrenToColumn(var_247,["event_details","event_buttons"],0,2);
            var_247.height = Util.getLowestPoint(var_247);
            var_247.visible = true;
         }
         else
         {
            var_247.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this.var_440.reset();
         this.var_325.active = true;
         this.var_190.active = false;
         this.var_248.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         var_440.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_914.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_914.height = NaN;
         var_1132.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1132.height = NaN;
         Util.moveChildrenToColumn(var_617,["public_space_name","public_space_desc"],var_914.y,0);
         var_617.visible = true;
         var_617.height = Math.max(86,Util.getLowestPoint(var_617));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","HabboNavigatorCom_hh_room_floatinggarden_png") == "true";
         if(_loc1_ && true && true && true)
         {
            var_738.visible = true;
            var_913.text = this.getEmbedData();
         }
         else
         {
            var_738.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_440.reset();
         this.var_190.load(param1);
         this.var_190.active = true;
         this.var_325.active = false;
         this.var_248.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_440.reset();
         this.var_190.active = false;
         this.var_325.active = false;
         this.var_248.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_64,false);
         _window.setParamFlag(HabboWindowParam.const_1294,true);
         var_283 = IWindowContainer(find("room_info"));
         var_324 = IWindowContainer(find("room_details"));
         var_617 = IWindowContainer(find("public_space_details"));
         var_1754 = IWindowContainer(find("owner_name_cont"));
         var_1755 = IWindowContainer(find("rating_cont"));
         var_1127 = IWindowContainer(find("room_buttons"));
         var_621 = ITextWindow(find("room_name"));
         var_914 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_737 = ITextWindow(find("room_desc"));
         var_1132 = ITextWindow(find("public_space_desc"));
         var_915 = ITextWindow(find("owner_caption"));
         var_736 = ITextWindow(find("rating_caption"));
         var_1753 = ITextWindow(find("rate_caption"));
         var_1353 = ITextWindow(find("rating_txt"));
         var_247 = IWindowContainer(find("event_info"));
         var_739 = IWindowContainer(find("event_details"));
         var_1354 = IWindowContainer(find("event_buttons"));
         var_1581 = ITextWindow(find("event_name"));
         var_618 = ITextWindow(find("event_desc"));
         var_1129 = IContainerButtonWindow(find("add_favourite_button"));
         var_1126 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1130 = IContainerButtonWindow(find("make_home_button"));
         var_1128 = IContainerButtonWindow(find("unmake_home_button"));
         var_1357 = IButtonWindow(find("room_settings_button"));
         var_1355 = IButtonWindow(find("create_event_button"));
         var_1356 = IButtonWindow(find("edit_event_button"));
         var_738 = IWindowContainer(find("embed_info"));
         var_1131 = ITextWindow(find("embed_info_txt"));
         var_913 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1129,onAddFavouriteClick);
         Util.setProcDirectly(var_1126,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1357,onRoomSettingsClick);
         Util.setProcDirectly(var_1130,onMakeHomeClick);
         Util.setProcDirectly(var_1128,onUnmakeHomeClick);
         Util.setProcDirectly(var_1355,onEventSettingsClick);
         Util.setProcDirectly(var_1356,onEventSettingsClick);
         Util.setProcDirectly(var_913,onEmbedSrcClick);
         _navigator.refreshButton(var_1129,"favourite",true,null,0);
         _navigator.refreshButton(var_1126,"favourite",true,null,0);
         _navigator.refreshButton(var_1130,"home",true,null,0);
         _navigator.refreshButton(var_1128,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_283,onHover);
         Util.setProcDirectly(var_247,onHover);
         var_915.width = var_915.textWidth;
         Util.moveChildrenToRow(var_1754,["owner_caption","owner_name"],var_915.x,var_915.y,3);
         var_736.width = var_736.textWidth;
         Util.moveChildrenToRow(var_1755,["rating_caption","rating_txt"],var_736.x,var_736.y,3);
         var_1131.height = NaN;
         Util.moveChildrenToColumn(var_738,["embed_info_txt","embed_src_txt"],var_1131.y,2);
         var_738.height = Util.getLowestPoint(var_738) + 5;
         var_2171 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1581.text = param1.eventName;
         var_618.text = param1.eventDescription;
         var_882.refreshTags(var_739,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_618.visible = false;
         if(param1.eventDescription != "")
         {
            var_618.height = NaN;
            var_618.y = Util.getLowestPoint(var_739) + 2;
            var_618.visible = true;
         }
         var_739.visible = true;
         var_739.height = Util.getLowestPoint(var_739);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_943,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
