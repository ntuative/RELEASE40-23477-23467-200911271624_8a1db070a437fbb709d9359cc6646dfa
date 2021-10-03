package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1389:GarbageMonitor = null;
      
      private var var_1172:int = 0;
      
      private var var_1069:Boolean = false;
      
      private var var_1616:String = "";
      
      private var var_1390:String = "";
      
      private var var_330:Number = 0;
      
      private var var_1173:int = 10;
      
      private var var_2183:Array;
      
      private var var_577:int = 0;
      
      private var var_1171:int = 60;
      
      private var var_942:int = 0;
      
      private var var_941:int = 0;
      
      private var var_1617:String = "";
      
      private var var_1849:Number = 0;
      
      private var var_1170:int = 1000;
      
      private var var_1847:Boolean = true;
      
      private var var_1848:Number = 0.15;
      
      private var var_175:IHabboConfigurationManager = null;
      
      private var var_1613:String = "";
      
      private var var_1174:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2183 = [];
         super();
         var_1390 = Capabilities.version;
         var_1616 = Capabilities.os;
         var_1069 = Capabilities.isDebugger;
         var_1613 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1389 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1172 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1389.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1389.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_330;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1171 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1390;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_941;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1170)
         {
            ++var_942;
            _loc3_ = true;
         }
         else
         {
            ++var_577;
            if(var_577 <= 1)
            {
               var_330 = param1;
            }
            else
            {
               _loc4_ = Number(var_577);
               var_330 = var_330 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1172 > var_1171 * 1000 && var_1174 < var_1173)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_330);
            _loc5_ = true;
            if(var_1847 && var_1174 > 0)
            {
               _loc6_ = differenceInPercents(var_1849,var_330);
               if(_loc6_ < var_1848)
               {
                  _loc5_ = false;
               }
            }
            var_1172 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_1849 = var_330;
               if(sendReport())
               {
                  ++var_1174;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1173 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1170 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1613,var_1390,var_1616,var_1617,var_1069,_loc4_,_loc3_,var_941,var_330,var_942);
            _connection.send(_loc1_);
            var_941 = 0;
            var_330 = 0;
            var_577 = 0;
            var_942 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_175 = param1;
         var_1171 = int(var_175.getKey("performancetest.interval","60"));
         var_1170 = int(var_175.getKey("performancetest.slowupdatelimit","1000"));
         var_1173 = int(var_175.getKey("performancetest.reportlimit","10"));
         var_1848 = Number(var_175.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_1847 = Boolean(int(var_175.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
