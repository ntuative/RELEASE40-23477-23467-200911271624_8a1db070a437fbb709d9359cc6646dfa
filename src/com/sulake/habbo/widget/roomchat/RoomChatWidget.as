package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.ICoreUpdateReceiver;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChatSelectAvatarMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class RoomChatWidget extends RoomWidgetBase implements ICoreUpdateReceiver
   {
      
      private static const const_760:int = 10;
      
      private static const const_487:int = 25;
      
      private static const const_1073:int = 6000;
      
      private static const const_1071:int = 9;
      
      private static const const_761:int = 4000;
      
      private static const const_1072:int = 3;
      
      private static const const_88:int = 18;
      
      private static const const_1060:int = 25;
      
      private static const const_1070:int = 1;
      
      private static const const_271:int = 9;
      
      private static const const_485:int = 8;
      
      private static const const_337:int = 0;
      
      private static const const_486:int = (const_485 + const_337) * const_88 + const_88;
       
      
      private var var_816:Number = 1;
      
      private var _disposed:Boolean = false;
      
      private var var_554:int = 18;
      
      private var var_339:IItemListWindow;
      
      private var var_670:int = 0;
      
      private var var_42:IWindowContainer;
      
      private var _isAnimating:Boolean = false;
      
      private var var_157:int;
      
      private var var_2020:int = 0;
      
      private var var_1252:Boolean = false;
      
      private var var_141:IWindowContainer;
      
      private var _itemList:Array;
      
      private var var_37:RoomChatHistoryViewer;
      
      private var var_2019:int = 150;
      
      private var var_478:Number = 1;
      
      private var var_71:Array;
      
      private var var_230:Array;
      
      private var var_668:int = 0;
      
      private var var_2021:int;
      
      private var var_669:Point;
      
      private var var_1463:Number = 0;
      
      private var var_41:Component = null;
      
      public function RoomChatWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager, param5:int, param6:Component)
      {
         _itemList = new Array();
         var_71 = new Array();
         var_230 = new Array();
         var_669 = new Point();
         var_157 = const_486 + const_271;
         super(param1,param2,param3);
         var_2021 = param5;
         var_42 = param1.createWindow("chat_container","",HabboWindowType.const_53,HabboWindowStyle.const_38,HabboWindowParam.const_34,new Rectangle(0,0,200,var_157 + RoomChatHistoryPulldown.const_68),null,0) as IWindowContainer;
         var_42.background = true;
         var_42.color = 33554431;
         var_42.tags.push("room_widget_chat");
         var_339 = param1.createWindow("chat_contentlist","",HabboWindowType.const_881,HabboWindowStyle.const_39,0 | 0 | 0,new Rectangle(0,0,200,var_157),null,0) as IItemListWindow;
         var_42.addChild(var_339);
         var_141 = param1.createWindow("chat_active_content","",HabboWindowType.const_53,HabboWindowStyle.const_39,HabboWindowParam.const_64,new Rectangle(0,0,200,var_157),null,0) as IWindowContainer;
         var_339.addListItem(var_141);
         var_37 = new RoomChatHistoryViewer(this,param1,var_42,param2);
         var_2019 = int(param4.getKey("chat.history.item.max.count","150"));
         var _loc7_:Boolean = int(param4.getKey("chat.history.disabled","0")) == 1 ? true : false;
         if(var_37 != null)
         {
            var_37.disabled = _loc7_;
         }
         if(param6 != null)
         {
            var_41 = param6;
            var_41.registerUpdateReceiver(this,1);
         }
      }
      
      public function onPulldownCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(var_37 != null)
         {
            var_37.hideHistoryViewer();
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetChatUpdateEvent.const_635,onChatMessage);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_234,onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_675,onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_639,onRoomViewUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function get mainWindow() : IWindow
      {
         return var_42;
      }
      
      public function onItemMouseOver(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      public function resetArea() : void
      {
         if(var_37 == null)
         {
            return;
         }
         animationStop();
         var_157 = const_486 + const_271;
         var_42.height = var_157 + var_37.pulldownBarHeight;
         var_339.width = 0 - 0;
         var_339.height = var_157;
         var_141.width = 0 - 0;
         if(historyViewerActive())
         {
            var_141.height = getTotalContentHeight() + const_271;
         }
         else
         {
            var_141.height = var_157;
         }
         var_339.scrollV = 1;
         if(!historyViewerActive())
         {
            var_37.containerResized(var_42.rectangle);
         }
         purgeItems();
         alignItems();
      }
      
      public function resizeContainerToLowestItem() : void
      {
         var _loc4_:* = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc4_ = _itemList[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_71.length)
         {
            _loc4_ = var_71[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc1_ += const_487;
         _loc1_ = _loc1_ < 0 ? 0 : int(_loc1_);
         var _loc3_:int = var_42.rectangle.bottom;
         stretchAreaBottomTo(var_42.rectangle.top + _loc1_);
         _loc3_ -= var_42.rectangle.bottom;
         if(Math.abs(_loc3_) < RoomChatHistoryViewer.const_905)
         {
            resetArea();
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc4_ = _itemList[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_71.length)
         {
            _loc4_ = var_71[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         var_1252 = true;
      }
      
      private function processBuffer() : void
      {
         if(_isAnimating)
         {
            return;
         }
         if(false)
         {
            return;
         }
         while(var_71.length > const_1070 || historyViewerActive() && false)
         {
            activateItemFromBuffer();
         }
         var _loc1_:Boolean = false;
         if(false)
         {
            _loc1_ = true;
         }
         else
         {
            _loc1_ = checkLastItemAllowsAdding(var_71[0]);
         }
         if(_loc1_)
         {
            activateItemFromBuffer();
            var_670 = getTimer() + const_761;
         }
         else
         {
            if(false && false)
            {
               var_554 = getItemSpacing(_itemList["-1"],var_71[0]);
            }
            else
            {
               var_554 = const_88;
            }
            animationStart();
         }
      }
      
      private function setChatItemLocHorizontal(param1:RoomChatItem) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         if(param1 == null || var_37 == null)
         {
            return;
         }
         var _loc2_:Number = (param1.senderX + var_669.x) * var_816;
         var _loc3_:Number = _loc2_ - param1.width / 2;
         var _loc4_:Number = _loc3_ + param1.width;
         var _loc5_:Number = 0 - const_760;
         var _loc6_:Number = 0 + const_760 - 0;
         var _loc7_:Boolean = _loc3_ >= _loc5_ && _loc3_ <= _loc6_;
         var _loc8_:Boolean = _loc4_ >= _loc5_ && _loc4_ <= _loc6_;
         if(_loc7_ && _loc8_)
         {
            _loc9_ = _loc3_;
            _loc10_ = _loc9_;
         }
         else if(_loc2_ >= 0)
         {
            _loc9_ = _loc6_ - param1.width;
         }
         else
         {
            _loc9_ = _loc5_;
         }
         param1.x = _loc9_ + 0 + var_42.x;
         if(_loc2_ < _loc5_ || _loc2_ > _loc6_)
         {
            param1.hidePointer();
         }
         else
         {
            param1.setPointerOffset(_loc3_ - _loc9_);
         }
      }
      
      public function onItemMouseOut(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      private function checkLastItemAllowsAdding(param1:RoomChatItem) : Boolean
      {
         if(false)
         {
            return true;
         }
         var _loc2_:RoomChatItem = _itemList["-1"];
         if(param1 == null || _loc2_ == null)
         {
            return false;
         }
         if(_loc2_.view == null)
         {
            return true;
         }
         if(var_141.rectangle.bottom - (var_141.y + _loc2_.y + _loc2_.height) <= getItemSpacing(_loc2_,param1))
         {
            return false;
         }
         return true;
      }
      
      public function mouseUp() : void
      {
         var _loc1_:Number = var_42.rectangle.bottom - 0;
         if(_loc1_ < const_486)
         {
            if(_loc1_ <= var_157 + var_42.y)
            {
               if(historyViewerActive())
               {
                  hideHistoryViewer();
               }
               resetArea();
               return;
            }
         }
         if(var_1252 && !historyViewerActive())
         {
            resetArea();
            var_1252 = false;
         }
      }
      
      private function getFreeItemId() : String
      {
         return "chat_" + var_2021.toString() + "_item_" + (var_2020++).toString();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         while(false)
         {
            _loc1_ = var_230.shift();
         }
         var_37.dispose();
         var_37 = null;
         while(false)
         {
            _loc1_ = _itemList.shift();
            _loc1_.dispose();
         }
         while(false)
         {
            _loc1_ = var_71.shift();
            _loc1_.dispose();
         }
         var_42.dispose();
         if(var_41 != null)
         {
            var_41.removeUpdateReceiver(this);
            var_41 = null;
         }
         super.dispose();
         _disposed = true;
      }
      
      private function animationStop() : void
      {
         _isAnimating = false;
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetChatUpdateEvent.const_635,onChatMessage);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_234,onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_675,onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_639,onRoomViewUpdate);
      }
      
      public function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(var_37 != null)
         {
            var_37.beginDrag(param1.stageY,true);
         }
      }
      
      private function alignItems() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(var_37 == null)
         {
            return;
         }
         _loc1_ = -1;
         while(_loc1_ >= 0)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemLocHorizontal(_loc2_);
               setChatItemLocVertical(_loc2_);
            }
            _loc1_--;
         }
         _loc1_ = 0;
         while(_loc1_ < _itemList.length)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemRenderable(_loc2_);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < var_71.length)
         {
            _loc2_ = var_71[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemLocHorizontal(_loc2_);
            }
            _loc1_++;
         }
      }
      
      private function onChatMessage(param1:RoomWidgetChatUpdateEvent) : void
      {
         var _loc2_:RoomChatItem = new RoomChatItem(this,windowManager,assets,getFreeItemId(),localizations);
         _loc2_.define(param1);
         if(var_816 != 1)
         {
            _loc2_.senderX /= var_816;
         }
         _loc2_.senderX -= 0;
         setChatItemLocHorizontal(_loc2_);
         var_71.push(_loc2_);
         processBuffer();
      }
      
      private function setChatItemLocVertical(param1:RoomChatItem) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 != null)
         {
            _loc2_ = _itemList.indexOf(param1);
            _loc3_ = !!historyViewerActive() ? 0 : Number(var_478);
            if(_loc2_ == -1)
            {
               param1.y = getAreaBottom() - (_loc3_ + 1) * const_88 - const_271;
            }
            else
            {
               _loc4_ = _itemList[_loc2_ + 1].aboveLevels;
               if(_loc4_ < 2)
               {
                  param1.y = _itemList[_loc2_ + 1].y - getItemSpacing(param1,_itemList[_loc2_ + 1]);
               }
               else
               {
                  param1.y = _itemList[_loc2_ + 1].y - _loc4_ * const_88;
               }
            }
         }
      }
      
      public function disableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_71.length)
         {
            _loc1_ = var_71[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
      }
      
      private function animationStart() : void
      {
         if(_isAnimating)
         {
            return;
         }
         selectItemsToMove();
         _isAnimating = true;
      }
      
      public function hideHistoryViewer() : void
      {
         if(var_37 != null)
         {
            var_37.hideHistoryViewer();
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(getTimer() > var_670 && var_670 > 0)
         {
            var_670 = -1;
            animationStart();
         }
         if(_isAnimating)
         {
            _loc2_ = param1 / const_1060 * const_1072;
            if(_loc2_ + var_668 > var_554)
            {
               _loc2_ = var_554 - var_668;
            }
            if(_loc2_ > 0)
            {
               moveItemsUp(_loc2_);
               var_668 += _loc2_;
            }
            if(var_668 >= var_554)
            {
               var_554 = const_88;
               var_668 = 0;
               animationStop();
               processBuffer();
               var_670 = getTimer() + const_761;
            }
         }
         if(var_37 != null)
         {
            var_37.update(param1);
         }
      }
      
      public function getTotalContentHeight() : int
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc3_];
            if(_loc1_ != null)
            {
               if(_loc3_ == 0)
               {
                  _loc2_ += const_88;
               }
               else
               {
                  _loc2_ += getItemSpacing(_itemList[_loc3_ - 1],_loc1_);
               }
               _loc2_ += (_loc1_.aboveLevels - 1) * const_88;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function onRoomViewUpdate(param1:RoomWidgetRoomViewUpdateEvent) : void
      {
         var _loc2_:Rectangle = param1.rect;
         if(param1.scale > 0)
         {
            if(var_1463 == 0)
            {
               var_1463 = param1.scale;
            }
            else
            {
               var_816 = param1.scale / var_1463;
            }
         }
         if(param1.positionDelta != null)
         {
            var_669.x += param1.positionDelta.x / var_816;
            var_669.y += param1.positionDelta.y / var_816;
         }
         if(param1.rect != null)
         {
            if(var_37 == null)
            {
               return;
            }
            var_42.x = _loc2_.x;
            var_42.y = _loc2_.y;
            var_42.width = _loc2_.width;
            var_42.height = var_157 + var_37.pulldownBarHeight;
            var_339.width = 0 - 0;
            var_339.height = var_157;
            var_339.x = var_42.x;
            var_339.y = var_42.y;
            var_141.width = 0 - 0;
            var_141.height = var_157;
            if(historyViewerActive())
            {
               reAlignItemsToHistoryContent();
            }
            var_37.containerResized(var_42.rectangle,true);
         }
         alignItems();
      }
      
      private function getAreaBottom() : Number
      {
         if(historyViewerActive())
         {
            return var_141.height;
         }
         return var_157 + var_42.y;
      }
      
      private function purgeItems() : void
      {
         var _loc2_:* = null;
         if(historyViewerActive())
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         while(_itemList.length > var_2019)
         {
            _loc2_ = _itemList.shift();
            _loc3_ = var_230.indexOf(_loc2_);
            if(_loc3_ > -1)
            {
               var_230.splice(_loc3_,1);
            }
            if(_loc2_.view != null)
            {
               var_141.removeChild(_loc2_.view);
               _loc2_.hideView();
            }
            _loc2_.dispose();
            _loc2_ = null;
         }
         var _loc4_:Boolean = false;
         _loc1_ = 0;
         for(; _loc1_ < _itemList.length; _loc1_++)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               if(_loc2_.y > -const_487)
               {
                  _loc4_ = true;
               }
               _loc2_.aboveLevels = 1;
               if(_loc2_.view != null)
               {
                  _loc3_ = var_230.indexOf(_loc2_);
                  if(_loc3_ > -1)
                  {
                     var_230.splice(_loc3_,1);
                  }
                  var_141.removeChild(_loc2_.view);
                  _loc2_.hideView();
               }
               continue;
               break;
            }
         }
         if(false)
         {
            _loc4_ = true;
         }
         if(getTotalContentHeight() > const_88 && !_loc4_ && !historyViewerActive())
         {
            if(var_37 != null)
            {
               stretchAreaBottomTo(var_42.y);
               alignItems();
               if(!historyViewerActive())
               {
                  var_37.showHistoryViewer();
               }
               if(!historyViewerVisible())
               {
                  var_37.visible = true;
               }
            }
         }
         else if(historyViewerVisible())
         {
            var_37.visible = false;
         }
      }
      
      public function stretchAreaBottomBy(param1:Number) : void
      {
         var _loc2_:Number = var_42.rectangle.bottom + param1 - 0;
         stretchAreaBottomTo(_loc2_);
      }
      
      private function activateItemFromBuffer() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(false)
         {
            return;
         }
         if(historyViewerMinimized())
         {
            resetArea();
            hideHistoryViewer();
         }
         if(!checkLastItemAllowsAdding(var_71[0]))
         {
            selectItemsToMove();
            moveItemsUp(getItemSpacing(_itemList["-1"],var_71[0]));
            if(!checkLastItemAllowsAdding(var_71[0]))
            {
               var_141.height += const_88;
               if(var_37 != null)
               {
                  var_37.containerResized(var_42.rectangle);
               }
            }
         }
         _loc1_ = var_71.shift();
         if(_loc1_ != null)
         {
            _loc1_.renderView();
            _loc2_ = _loc1_.view;
            if(_loc2_ != null)
            {
               var_141.addChild(_loc2_);
               _loc1_.timestamp = new Date().time;
               _itemList.push(_loc1_);
               _loc3_ = 0;
               if(false)
               {
                  _loc3_ = _itemList["-2"].screenLevel;
                  if(historyViewerActive())
                  {
                     _loc1_.screenLevel = _loc3_ + 1;
                  }
                  else
                  {
                     _loc1_.screenLevel = _loc3_ + Math.max(var_478,1);
                  }
               }
               else
               {
                  _loc1_.screenLevel = 100;
               }
               _loc1_.aboveLevels = var_478;
               if(_loc1_.aboveLevels > const_485 + const_337 + 2)
               {
                  _loc1_.aboveLevels = const_485 + const_337 + 2;
               }
               var_478 = 0;
               setChatItemLocHorizontal(_loc1_);
               setChatItemLocVertical(_loc1_);
               setChatItemRenderable(_loc1_);
            }
         }
      }
      
      public function stretchAreaBottomTo(param1:Number) : void
      {
         var _loc2_:int = var_42.context.getDesktopWindow().height - 0;
         param1 = Math.min(param1,_loc2_);
         var_157 = param1 - 0;
         var_42.height = var_157 + RoomChatHistoryPulldown.const_68;
         if(var_37 != null)
         {
            var_37.containerResized(var_42.rectangle);
         }
      }
      
      public function onItemMouseClick(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
         if(param5.shiftKey)
         {
            if(var_37 != null)
            {
               var_37.toggleHistoryViewer();
            }
            return;
         }
         var _loc6_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_291,param1,param2);
         messageListener.processWidgetMessage(_loc6_);
         var _loc7_:RoomWidgetChatSelectAvatarMessage = new RoomWidgetChatSelectAvatarMessage(RoomWidgetChatSelectAvatarMessage.const_492,param1,param3,param4);
         messageListener.processWidgetMessage(_loc7_);
      }
      
      private function selectItemsToMove() : void
      {
         var _loc4_:* = null;
         if(_isAnimating)
         {
            return;
         }
         purgeItems();
         var_230 = new Array();
         var _loc1_:int = new Date().time;
         var _loc2_:int = 0;
         if(false)
         {
            var_478 = 1;
            return;
         }
         if(historyViewerActive())
         {
            return;
         }
         ++var_478;
         var _loc3_:int = -1;
         while(_loc3_ >= 0)
         {
            _loc4_ = _itemList[_loc3_];
            if(_loc4_.view != null)
            {
               if(_loc4_.screenLevel > const_337 || _loc4_.screenLevel == _loc2_ - 1 || _loc1_ - _loc4_.timestamp >= const_1073)
               {
                  _loc4_.timestamp = _loc1_;
                  _loc2_ = _loc4_.screenLevel;
                  --_loc4_.screenLevel;
                  var_230.push(_loc4_);
               }
            }
            _loc3_--;
         }
      }
      
      public function enableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_71.length)
         {
            _loc1_ = var_71[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
      }
      
      public function reAlignItemsToHistoryContent() : void
      {
         if(historyViewerActive())
         {
            var_141.height = getTotalContentHeight() + const_271;
            alignItems();
         }
      }
      
      private function setChatItemRenderable(param1:RoomChatItem) : void
      {
         if(param1 != null)
         {
            if(param1.y < -const_487)
            {
               if(param1.view != null)
               {
                  var_141.removeChild(param1.view);
                  param1.hideView();
               }
            }
            else if(param1.view == null)
            {
               param1.renderView();
               if(param1.view != null)
               {
                  var_141.addChild(param1.view);
               }
            }
         }
      }
      
      private function historyViewerMinimized() : Boolean
      {
         return true;
      }
      
      private function moveItemsUp(param1:int) : void
      {
         var _loc3_:Boolean = false;
         if(var_230 == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc4_:int = -1;
         var _loc5_:int = -1;
         while(_loc5_ >= 0)
         {
            _loc2_ = var_230[_loc5_];
            if(_loc2_ != null)
            {
               if(_loc4_ == -1)
               {
                  _loc4_ = _itemList.indexOf(_loc2_);
               }
               else
               {
                  _loc4_++;
               }
               _loc3_ = true;
               if(historyViewerActive())
               {
                  if(_loc2_.y - param1 + _loc2_.height < 0)
                  {
                     _loc3_ = false;
                  }
               }
               if(_loc4_ > 0)
               {
                  if(_itemList[_loc4_ - 1].view != null)
                  {
                     if(_loc2_.y - param1 - _itemList[_loc4_ - 1].y < getItemSpacing(_itemList[_loc4_ - 1],_loc2_))
                     {
                        _loc3_ = false;
                     }
                  }
               }
               if(_loc3_)
               {
                  _loc2_.y -= param1;
               }
            }
            _loc5_--;
         }
      }
      
      private function historyViewerActive() : Boolean
      {
         return var_37 == null ? false : Boolean(var_37.active);
      }
      
      private function getItemSpacing(param1:RoomChatItem, param2:RoomChatItem) : Number
      {
         if(param1.checkOverlap(param2.x,param1.y,param2.width,param2.height))
         {
            return const_88;
         }
         return const_1071;
      }
      
      public function onItemMouseDown(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
         if(historyViewerVisible())
         {
            return;
         }
         if(var_37 != null)
         {
            var_37.beginDrag(param5.stageY);
         }
      }
      
      private function historyViewerVisible() : Boolean
      {
         return var_37 == null ? false : Boolean(var_37.visible);
      }
   }
}
