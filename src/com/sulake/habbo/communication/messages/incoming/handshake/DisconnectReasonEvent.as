package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1222:String = "DisconnectReasonPeerConnectionLost";
      
      public static const const_985:String = "DisconnectReasonTimeout";
      
      public static const const_695:String = "DisconnectReasonDisconnected";
      
      public static const const_304:String = "DisconnectReasonBanned";
      
      public static const const_842:String = "DisconnectReasonLoggedOut";
      
      public static const const_785:String = "DisconnectReasonConcurrentLogin";
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : String
      {
         var _loc1_:int = (this.var_21 as DisconnectReasonParser).reason;
         switch(_loc1_)
         {
            case -1:
               return const_695;
            case 0:
               return const_695;
            case 1:
               return const_842;
            case 1009:
            case 2:
               return const_785;
            case 3:
               return const_985;
            case 4:
               return const_1222;
            default:
               return const_695;
         }
      }
   }
}
