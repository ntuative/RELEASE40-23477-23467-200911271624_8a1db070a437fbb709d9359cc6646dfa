package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_122:DisplayObject;
      
      private var var_2199:uint;
      
      private var var_844:IWindowToolTipAgentService;
      
      private var var_841:IWindowMouseScalingService;
      
      private var var_359:IWindowContext;
      
      private var var_842:IWindowFocusManagerService;
      
      private var var_840:IWindowMouseListenerService;
      
      private var var_843:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2199 = 0;
         var_122 = param2;
         var_359 = param1;
         var_843 = new WindowMouseDragger(param2);
         var_841 = new WindowMouseScaler(param2);
         var_840 = new WindowMouseListener(param2);
         var_842 = new FocusManager(param2);
         var_844 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_841;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_842;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_844;
      }
      
      public function dispose() : void
      {
         if(var_843 != null)
         {
            var_843.dispose();
            var_843 = null;
         }
         if(var_841 != null)
         {
            var_841.dispose();
            var_841 = null;
         }
         if(var_840 != null)
         {
            var_840.dispose();
            var_840 = null;
         }
         if(var_842 != null)
         {
            var_842.dispose();
            var_842 = null;
         }
         if(var_844 != null)
         {
            var_844.dispose();
            var_844 = null;
         }
         var_359 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_840;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_843;
      }
   }
}
