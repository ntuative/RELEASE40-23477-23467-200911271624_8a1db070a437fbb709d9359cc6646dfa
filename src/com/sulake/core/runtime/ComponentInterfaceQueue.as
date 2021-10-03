package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1062:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_698:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1062 = param1;
         var_698 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_698;
      }
      
      public function get identifier() : IID
      {
         return var_1062;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1062 = null;
            while(false)
            {
               var_698.pop();
            }
            var_698 = null;
         }
      }
   }
}
