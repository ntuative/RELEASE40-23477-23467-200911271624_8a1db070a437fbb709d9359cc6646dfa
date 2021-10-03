package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModMessageMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class SendMsgsCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1395:String;
      
      private var var_1180:int;
      
      private var var_786:IDropMenuWindow;
      
      private var var_55:ModerationManager;
      
      private var var_377:ITextFieldWindow;
      
      private var var_58:IFrameWindow;
      
      private var var_288:Boolean = true;
      
      public function SendMsgsCtrl(param1:ModerationManager, param2:int, param3:String)
      {
         super();
         var_55 = param1;
         var_1180 = param2;
         var_1395 = param3;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_303)
         {
            return;
         }
         if(!var_288)
         {
            return;
         }
         var_377.text = "";
         var_288 = false;
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_58;
      }
      
      private function onSendMessageButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending message...");
         if(var_288 || false)
         {
            var_55.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return;
         }
         var_55.connection.send(new ModMessageMessageComposer(var_1180,var_377.text));
         this.dispose();
      }
      
      public function getId() : String
      {
         return var_1395;
      }
      
      private function prepareMsgSelect(param1:IDropMenuWindow) : void
      {
         Logger.log("MSG TEMPLATES: " + var_55.initMsg.messageTemplates.length);
         param1.populate(var_55.initMsg.messageTemplates);
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      private function onSelectTemplate(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_55)
         {
            return;
         }
         var _loc3_:String = var_55.initMsg.messageTemplates["null"];
         if(_loc3_ != null)
         {
            var_288 = false;
            var_377.text = _loc3_;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_58 != null)
         {
            var_58.destroy();
            var_58 = null;
         }
         var_786 = null;
         var_377 = null;
         var_55 = null;
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function show() : void
      {
         var_58 = IFrameWindow(var_55.getXmlWindow("send_msgs"));
         var_58.caption = "Msg To: " + var_1395;
         var_58.findChildByName("send_message_but").procedure = onSendMessageButton;
         var_377 = ITextFieldWindow(var_58.findChildByName("message_input"));
         var_377.procedure = onInputClick;
         var_786 = IDropMenuWindow(var_58.findChildByName("msgTemplatesSelect"));
         prepareMsgSelect(var_786);
         var_786.procedure = onSelectTemplate;
         var _loc1_:IWindow = var_58.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_58.visible = true;
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1318;
      }
   }
}
