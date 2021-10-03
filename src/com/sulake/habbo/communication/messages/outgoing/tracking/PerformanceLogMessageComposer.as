package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_942:int = 0;
      
      private var var_1069:int = 0;
      
      private var var_1616:String = "";
      
      private var var_941:int = 0;
      
      private var var_1617:String = "";
      
      private var var_1614:int = 0;
      
      private var var_1390:String = "";
      
      private var var_1615:int = 0;
      
      private var var_1612:int = 0;
      
      private var var_1613:String = "";
      
      private var var_1611:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1615 = param1;
         var_1613 = param2;
         var_1390 = param3;
         var_1616 = param4;
         var_1617 = param5;
         if(param6)
         {
            var_1069 = 1;
         }
         else
         {
            var_1069 = 0;
         }
         var_1614 = param7;
         var_1612 = param8;
         var_941 = param9;
         var_1611 = param10;
         var_942 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1615,var_1613,var_1390,var_1616,var_1617,var_1069,var_1614,var_1612,var_941,var_1611,var_942];
      }
      
      public function dispose() : void
      {
      }
   }
}
