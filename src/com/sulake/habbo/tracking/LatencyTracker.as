package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer;
   import com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LatencyTracker
   {
       
      
      private var var_159:Array;
      
      private var _state:Boolean = false;
      
      private var var_1484:int = 0;
      
      private var var_1483:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_481:Map;
      
      private var var_2064:int = 0;
      
      private var var_1482:int = 0;
      
      private var var_175:IHabboConfigurationManager;
      
      private var var_1260:int = 0;
      
      private var _connection:IConnection;
      
      private var var_1485:int = 0;
      
      public function LatencyTracker()
      {
         super();
      }
      
      public function update(param1:uint) : void
      {
         if(!_state)
         {
            return;
         }
         if(getTimer() - var_1484 > var_1483)
         {
            testLatency();
         }
      }
      
      private function testLatency() : void
      {
         var_1484 = getTimer();
         var_481.add(var_1260,var_1484);
         _connection.send(new LatencyPingRequestMessageComposer(var_1260));
         ++var_1260;
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function init() : void
      {
         if(var_175 == null || _communication == null || _connection == null)
         {
            return;
         }
         var_1483 = int(var_175.getKey("latencytest.interval"));
         var_1485 = int(var_175.getKey("latencytest.report.index"));
         var_2064 = int(var_175.getKey("latencytest.report.delta"));
         _communication.addHabboConnectionMessageEvent(new LatencyPingResponseMessageEvent(onPingResponse));
         if(var_1483 < 1)
         {
            return;
         }
         var_481 = new Map();
         var_159 = new Array();
         _state = true;
      }
      
      private function onPingResponse(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         if(var_481 == null || var_159 == null)
         {
            return;
         }
         var _loc2_:LatencyPingResponseMessageParser = (param1 as LatencyPingResponseMessageEvent).getParser();
         var _loc3_:int = var_481.getValue(_loc2_.requestId);
         var_481.remove(_loc2_.requestId);
         var _loc4_:int = getTimer() - _loc3_;
         var_159.push(_loc4_);
         if(var_159.length == var_1485 && var_1485 > 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < var_159.length)
            {
               _loc5_ += var_159[_loc8_];
               _loc8_++;
            }
            _loc9_ = _loc5_ / 0;
            _loc8_ = 0;
            while(_loc8_ < var_159.length)
            {
               if(var_159[_loc8_] < _loc9_ * 2)
               {
                  _loc6_ += var_159[_loc8_];
                  _loc7_++;
               }
               _loc8_++;
            }
            if(_loc7_ == 0)
            {
               var_159 = [];
               return;
            }
            _loc10_ = _loc6_ / _loc7_;
            if(Math.abs(_loc9_ - var_1482) > var_2064 || var_1482 == 0)
            {
               var_1482 = _loc9_;
               _loc11_ = new LatencyPingReportMessageComposer(_loc9_,_loc10_,var_159.length);
               _connection.send(_loc11_);
            }
            var_159 = [];
         }
      }
      
      public function dispose() : void
      {
         _state = false;
         var_175 = null;
         _communication = null;
         _connection = null;
         if(var_481 != null)
         {
            var_481.dispose();
            var_481 = null;
         }
         var_159 = null;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_175 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
