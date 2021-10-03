package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_608:String = "me_menu_settings_view";
      
      private static const const_724:int = 10;
      
      public static const const_587:String = "me_menu_effects_view";
      
      public static const const_101:String = "me_menu_top_view";
      
      public static const const_1220:String = "me_menu_rooms_view";
      
      public static const const_832:String = "me_menu_dance_moves_view";
      
      public static const const_251:String = "me_menu_my_clothes_view";
       
      
      private var var_1640:Boolean = false;
      
      private var _isAnimating:Boolean = false;
      
      private var var_69:IEventDispatcher;
      
      private var var_1637:int = 0;
      
      private var var_1641:Boolean = false;
      
      private var var_243:Boolean = false;
      
      private var var_1639:int = 0;
      
      private var var_1638:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_504:Boolean = false;
      
      private var var_96:ClubPromoView;
      
      private var var_1078:int = 0;
      
      private var var_888:Point;
      
      private var var_40:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher = null)
      {
         super(param1,param2,param3);
         var_888 = new Point(0,0);
         var_69 = param4;
         changeView(const_101);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_621,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_716,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_508,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_569,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_310,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_692,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_421,onShowAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_818,onHideAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_208,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_212,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_566,onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_216,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_279,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_99,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_408,onTutorialEvent);
         super.registerUpdateEvents(param1);
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!_isAnimating)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_504;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_243)
         {
            return;
         }
         if(var_40.window.name == const_608)
         {
            (var_40 as MeMenuSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1078 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_243 && var_40.window.name == const_251))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_709);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_621,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_716,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_508,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_569,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_310,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_208,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_212,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_566,onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_692,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_421,onShowAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_818,onHideAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_216,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_279,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_408,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_99,onTutorialEvent);
      }
      
      override public function dispose() : void
      {
         hide();
         var_69 = null;
         if(var_40 != null)
         {
            var_40.dispose();
            var_40 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_1640;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_1638 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onHideAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_96 != null)
         {
            var_96.dispose();
            var_96 = null;
         }
         updateSize();
      }
      
      public function get isDancing() : Boolean
      {
         return var_1641;
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_408:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_243 + " view: " + var_40.window.name);
               if(var_243 != true || var_40.window.name != const_101)
               {
                  return;
               }
               (var_40 as MeMenuMainView).setIconAssets("clothes_icon",const_101,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_99:
               hide();
         }
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_513);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_40 != null)
         {
            _mainContainer.removeChild(var_40.window);
            var_40.dispose();
            var_40 = null;
         }
         var_243 = false;
         var_69.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1638 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_1637;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_504 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_504 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = var_1078 > 0;
         var_1078 = param1.daysLeft;
         var_1637 = param1.periodsLeft;
         var_1639 = param1.pastPeriods;
         var_1640 = param1.allowClubDances;
         if(_loc2_ != param1.daysLeft > 0)
         {
            if(var_40 != null)
            {
               changeView(var_40.window.name);
            }
         }
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1150,HabboWindowStyle.const_878,HabboWindowParam.const_39,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_1641 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_40 != null && var_40.window.name != const_251)
         {
            hide();
         }
      }
      
      private function onShowAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(var_40 != null && var_40.window.name == const_251)
         {
            if(param1.promoMode == RoomWidgetAvatarEditorUpdateEvent.const_938)
            {
               var_96 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_1123);
            }
            else
            {
               var_96 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_472);
            }
            _loc2_ = _mainContainer.getChildByName(var_40.window.name);
            if(_loc2_ != null)
            {
               var_96.window.x = _loc2_.width + const_724;
               _mainContainer.addChild(var_96.window);
               _mainContainer.width = var_96.window.x + var_96.window.width;
            }
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_504 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_504 = true;
            }
         }
         if(var_40 != null && var_40.window.name == const_587)
         {
            (var_40 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_1639;
      }
      
      public function get habboClubDays() : int
      {
         return var_1078;
      }
      
      public function updateSize() : void
      {
         if(var_40 != null)
         {
            var_888.x = var_40.window.width + 10;
            var_888.y = var_40.window.height;
            var_40.window.x = 5;
            var_40.window.y = 0;
            _mainContainer.width = var_888.x;
            _mainContainer.height = var_888.y;
            if(var_96 != null)
            {
               _mainContainer.width = var_96.window.x + var_96.window.width + const_724;
            }
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_243 = !var_243;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_243 = false;
               break;
            default:
               return;
         }
         if(var_243)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_40 != null && var_40.window.name == const_251)
         {
            if(var_96 != null)
            {
               var_96.dispose();
               var_96 = null;
            }
            changeView(const_101);
         }
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         if(var_96 != null)
         {
            var_96.dispose();
            var_96 = null;
         }
         switch(param1)
         {
            case const_101:
               _loc2_ = new MeMenuMainView();
               var_69.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_587:
               _loc2_ = new MeMenuEffectsView();
               var_69.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_832:
               _loc2_ = new MeMenuDanceView();
               var_69.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_251:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1220:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_608:
               _loc2_ = new MeMenuSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_40 != null)
            {
               _mainContainer.removeChild(var_40.window);
               var_40.dispose();
               var_40 = null;
            }
            var_40 = _loc2_;
            var_40.init(this,param1);
         }
         updateSize();
      }
      
      private function show() : void
      {
         changeView(const_101);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_552);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_243 = true;
      }
   }
}
