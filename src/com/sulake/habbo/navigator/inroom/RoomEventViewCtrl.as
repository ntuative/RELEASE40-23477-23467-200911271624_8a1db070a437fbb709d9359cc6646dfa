package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CancelEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.EditEventMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.TextFieldManager;
   import com.sulake.habbo.navigator.Util;
   
   public class RoomEventViewCtrl
   {
       
      
      private var _window:IWindowContainer;
      
      private var _eventNameInput:TextFieldManager;
      
      private var _active:Boolean;
      
      private var var_1729:IButtonWindow;
      
      private var var_1113:IButtonWindow;
      
      private var var_1344:ITextWindow;
      
      private var var_725:TextFieldManager;
      
      private var var_1345:ITextWindow;
      
      private var var_727:TextFieldManager;
      
      private var _navigator:HabboNavigator;
      
      private var var_612:TextFieldManager;
      
      private var var_1346:IWindowContainer;
      
      private var var_1728:ITextWindow;
      
      private var var_1114:IButtonWindow;
      
      private var var_726:IDropMenuWindow;
      
      private var var_1115:IButtonWindow;
      
      public function RoomEventViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
      }
      
      private function endEdit() : void
      {
         _active = false;
         _navigator.roomInfoViewCtrl.reload();
      }
      
      public function get active() : Boolean
      {
         return this._active;
      }
      
      public function set active(param1:Boolean) : void
      {
         this._active = param1;
      }
      
      private function getTagFromEvent(param1:RoomEventData, param2:int) : String
      {
         var _loc3_:String = param1.tags[param2 - 1];
         return _loc3_ == null ? "" : _loc3_;
      }
      
      private function getInput(param1:String) : ITextFieldWindow
      {
         return ITextFieldWindow(_window.findChildByName(param1));
      }
      
      private function clearErrors() : void
      {
         _eventNameInput.clearErrors();
         var_612.clearErrors();
         var_725.clearErrors();
         var_727.clearErrors();
      }
      
      private function onEditButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = _navigator.data.roomEventData.eventType;
         var _loc4_:String = _eventNameInput.getText();
         var _loc5_:String = var_612.getText();
         var _loc6_:Array = new Array();
         addTag(_loc6_,var_725.getText());
         addTag(_loc6_,var_727.getText());
         if(!isMandatoryFieldsFilled())
         {
            return;
         }
         _navigator.send(new EditEventMessageComposer(_loc3_,_loc4_,_loc5_,_loc6_));
         endEdit();
      }
      
      private function editEvent(param1:RoomEventData) : void
      {
         var_726.visible = false;
         var_1346.visible = true;
         var_1728.text = _navigator.getText("roomevent_type_" + param1.eventType);
         _eventNameInput.setText(param1.eventName);
         var_612.setText(param1.eventDescription);
         var_725.setText(getTagFromEvent(param1,1));
         var_727.setText(getTagFromEvent(param1,2));
         var_1113.visible = false;
         var_1115.visible = true;
         var_1114.visible = true;
         var_1345.visible = false;
         var_1344.visible = true;
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
      
      private function onCreateButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = getEventType();
         var _loc4_:String = _eventNameInput.getText();
         var _loc5_:String = var_612.getText();
         var _loc6_:Array = new Array();
         addTag(_loc6_,var_725.getText());
         addTag(_loc6_,var_727.getText());
         if(!isMandatoryFieldsFilled())
         {
            return;
         }
         _navigator.send(new CreateEventMessageComposer(_loc3_,_loc4_,_loc5_,_loc6_));
         endEdit();
      }
      
      private function getEventType() : int
      {
         var _loc1_:int = 0;
         return _loc1_ + 1;
      }
      
      private function addTag(param1:Array, param2:String) : void
      {
         if(param2 != "")
         {
            param1.push(param2);
         }
      }
      
      private function prepareWindow(param1:IWindowContainer) : void
      {
         if(_window == null)
         {
            _window = IWindowContainer(_navigator.getXmlWindow("iro_event_settings"));
            var_1346 = IWindowContainer(find("event_type_disabled_cont"));
            var_1728 = ITextWindow(find("event_type_disabled_text"));
            var_1345 = ITextWindow(find("create_caption"));
            var_1344 = ITextWindow(find("edit_caption"));
            var_1113 = IButtonWindow(find("create_button"));
            var_1115 = IButtonWindow(find("edit_button"));
            var_1729 = IButtonWindow(find("cancel_button"));
            var_1114 = IButtonWindow(find("end_button"));
            var_726 = IDropMenuWindow(find("event_type"));
            prepareEventTypes();
            Util.setProcDirectly(var_1113,onCreateButtonClick);
            Util.setProcDirectly(var_1115,onEditButtonClick);
            Util.setProcDirectly(var_1114,onEndButtonClick);
            Util.setProcDirectly(var_1729,onCancelButtonClick);
            _eventNameInput = new TextFieldManager(_navigator,getInput("event_name"),25);
            var_612 = new TextFieldManager(_navigator,getInput("event_desc"),100);
            var_725 = new TextFieldManager(_navigator,getInput("event_tag_1"),25);
            var_727 = new TextFieldManager(_navigator,getInput("event_tag_2"),25);
            param1.addChild(_window);
         }
      }
      
      public function refresh(param1:IWindowContainer) : void
      {
         if(!_active)
         {
            return;
         }
         prepareWindow(param1);
         clearErrors();
         var _loc2_:RoomEventData = _navigator.data.roomEventData;
         if(_loc2_ == null)
         {
            createEvent();
         }
         else
         {
            editEvent(_loc2_);
         }
         _window.visible = true;
      }
      
      private function onEndButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new CancelEventMessageComposer());
         endEdit();
      }
      
      private function prepareEventTypes() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc3_:int = 1;
         while(_loc3_ < 100)
         {
            _loc4_ = "roomevent_type_" + _loc3_;
            _loc5_ = _navigator.getText(_loc4_);
            if(_loc5_ == null || _loc5_ == _loc4_)
            {
               break;
            }
            _loc1_.push(_loc5_);
            _loc3_++;
         }
         var_726.populate(_loc1_);
      }
      
      private function isMandatoryFieldsFilled() : Boolean
      {
         this.clearErrors();
         if(!_eventNameInput.checkMandatory(_navigator.getText("navigator.eventsettings.nameerr")))
         {
            return false;
         }
         if(!var_612.checkMandatory(_navigator.getText("navigator.eventsettings.descerr")))
         {
            return false;
         }
         return true;
      }
      
      private function onCancelButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         endEdit();
      }
      
      private function createEvent() : void
      {
         var_726.visible = true;
         var_1346.visible = false;
         var_1113.visible = true;
         var_1115.visible = false;
         var_1114.visible = false;
         var_612.goBackToInitialState();
         _eventNameInput.goBackToInitialState();
         var_725.goBackToInitialState();
         var_727.goBackToInitialState();
         var_726.selection = 0;
         var_1345.visible = true;
         var_1344.visible = false;
      }
   }
}
