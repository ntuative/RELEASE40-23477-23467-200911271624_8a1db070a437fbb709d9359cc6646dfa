package com.sulake.habbo.communication
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.ICoreCommunicationManager;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.connection.IConnectionStateListener;
   import com.sulake.core.communication.enum.ConnectionType;
   import com.sulake.core.communication.messages.IMessageConfiguration;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.protocol.IProtocol;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.communication.enum.HabboConnectionType;
   import com.sulake.habbo.communication.enum.HabboProtocolType;
   import com.sulake.habbo.communication.protocol.WedgieProtocol;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.tracking.HabboErrorVariableEnum;
   import com.sulake.iid.IIDCoreCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HabboCommunicationManager extends Component implements IHabboCommunicationManager, IConnectionStateListener
   {
       
      
      private var var_654:int = 0;
      
      private var var_46:String = "";
      
      private var var_1068:Timer;
      
      private var var_211:Array;
      
      private var var_1608:Boolean = false;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var var_950:IMessageConfiguration;
      
      private const const_1543:int = 5;
      
      private var var_310:int = -1;
      
      private var var_588:ICoreCommunicationManager;
      
      private var var_881:int = 0;
      
      private var var_1609:Boolean = false;
      
      private var var_1610:Boolean = false;
      
      private var _connection:IConnection;
      
      public function HabboCommunicationManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_950 = new HabboMessages();
         var_211 = [];
         var_1068 = new Timer(100,1);
         super(param1,param2,param3);
         this.queueInterface(new IIDCoreCommunicationManager(),onCoreCommunicationManagerInit);
         this.queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationInit);
      }
      
      public function get port() : int
      {
         if(var_310 < 0 || var_310 >= var_211.length)
         {
            return 0;
         }
         return var_211[var_310];
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] Security Error: " + param1.text);
         ErrorReportStorage.addDebugData("Communication Security Error","SecurityError on connect: " + param1.text + ". Port was " + var_211[var_310]);
         tryNextPort();
      }
      
      private function onConfigurationReady(param1:Event = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         Logger.log("Habbo Communication Manager: init based on configuration: " + _habboConfiguration);
         if(_habboConfiguration == null)
         {
            Core.crash("Received configuration ready event but configuration was null",CoreComponent.const_904);
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigReady","Configuration Exists");
            var_211 = [];
            var_46 = _habboConfiguration.getKey("connection.info.host","fused37-public-proxy-1.hotel.varoke.net");
            _loc2_ = _habboConfiguration.getKey("connection.info.port","25001");
            _loc3_ = _loc2_.split(",");
            for each(_loc4_ in _loc3_)
            {
               var_211.push(parseInt(_loc4_.replace(" ","")));
            }
            ErrorReportStorage.addDebugData("CommunicationConfigReady","Configured Host: " + var_46);
            Logger.log("Connection Host: " + var_46);
            Logger.log("Connection Ports: " + var_211);
            Logger.log("Habbo Connection Info:" + _connection);
            var_1609 = true;
            if(var_1610)
            {
               nextPort();
            }
         }
      }
      
      public function messageReceived(param1:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1153,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1252,param1);
      }
      
      private function nextPort() : void
      {
         var _loc1_:* = null;
         ErrorReportStorage.addDebugData("NextPort","NextPort called");
         ++var_310;
         if(var_310 >= var_211.length)
         {
            ++var_881;
            if(var_881 >= const_1543)
            {
               if(var_1608)
               {
                  return;
               }
               var_1608 = true;
               _loc1_ = this.context as CoreComponent;
               if(_loc1_ != null)
               {
                  _loc1_.error("Connection failed to host " + var_46 + " ports " + var_211,true,CoreComponent.const_556);
                  return;
               }
               throw new Error("Connection failed to host " + var_46 + " ports " + var_211);
            }
            ErrorReportStorage.addDebugData("ConnectionRetry","Connection retry " + var_881);
            var_310 = 0;
         }
         _connection.init(var_46,var_211[var_310]);
      }
      
      public function initConnection(param1:String) : void
      {
         ErrorReportStorage.addDebugData("CommunicationInitConnection","Init Connection Called");
         switch(param1)
         {
            case HabboConnectionType.const_259:
               if(_habboConfiguration == null)
               {
                  Core.crash("Tried to connect to proxy but configuration was null",CoreComponent.const_556);
                  return;
               }
               if(_connection == null)
               {
                  Core.crash("Tried to connect to proxy but connection was null",CoreComponent.const_556);
                  return;
               }
               var_1610 = true;
               if(var_1609)
               {
                  nextPort();
               }
               break;
            default:
               Logger.log("Unknown Habbo Connection Type: " + param1);
         }
      }
      
      private function onTryNextPort(param1:TimerEvent) : void
      {
         var_1068.stop();
         nextPort();
      }
      
      public function get mode() : int
      {
         return var_654;
      }
      
      public function addHabboConnectionMessageEvent(param1:IMessageEvent) : void
      {
         return var_588.addConnectionMessageEvent(HabboConnectionType.const_259,param1);
      }
      
      public function connectionInit(param1:String, param2:int) : void
      {
         ErrorReportStorage.addDebugData("Connection","Connected with " + var_881 + " retries");
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1197,param1);
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1099,String(param2));
      }
      
      public function habboWebLogin(param1:String, param2:String) : IHabboWebLogin
      {
         var _loc3_:String = "";
         _loc3_ = _habboConfiguration.getKey("url.prefix",_loc3_);
         _loc3_ = _loc3_.replace("http://","");
         _loc3_ = _loc3_.replace("https://","");
         return new HabboWebLogin(param1,param2,_loc3_);
      }
      
      public function messageSent(param1:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1304,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1248,param1);
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] IO Error: " + param1.text);
         switch(param1.type)
         {
            case IOErrorEvent.IO_ERROR:
               break;
            case IOErrorEvent.DISK_ERROR:
               break;
            case IOErrorEvent.NETWORK_ERROR:
               break;
            case IOErrorEvent.VERIFY_ERROR:
         }
         ErrorReportStorage.addDebugData("Communication IO Error","IOError " + param1.type + " on connect: " + param1.text + ". Port was " + var_211[var_310]);
         tryNextPort();
      }
      
      public function set mode(param1:int) : void
      {
         var_654 = param1;
      }
      
      private function onCoreCommunicationManagerInit(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:* = null;
         Logger.log("Habbo Communication Manager: Core Communication Manager found:: " + [param1,param2]);
         if(param2 != null)
         {
            var_588 = param2 as ICoreCommunicationManager;
            var_588.connectionStateListener = this;
            var_588.registerProtocolType(HabboProtocolType.const_891,WedgieProtocol);
            _connection = var_588.createConnection(HabboConnectionType.const_259,ConnectionType.const_937);
            _loc3_ = var_588.getProtocolInstanceOfType(HabboProtocolType.const_891);
            _connection.registerMessageClasses(var_950);
            _connection.protocol = _loc3_;
            _connection.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
            _connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
         }
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Received");
            _habboConfiguration = param2 as IHabboConfigurationManager;
            (_habboConfiguration as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationReady);
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config NOT received");
         }
      }
      
      private function tryNextPort() : void
      {
         var_1068.addEventListener(TimerEvent.TIMER,onTryNextPort);
         var_1068.start();
      }
      
      public function getHabboMainConnection(param1:Function) : IConnection
      {
         return var_588.queueConnection(HabboConnectionType.const_259,param1);
      }
   }
}
