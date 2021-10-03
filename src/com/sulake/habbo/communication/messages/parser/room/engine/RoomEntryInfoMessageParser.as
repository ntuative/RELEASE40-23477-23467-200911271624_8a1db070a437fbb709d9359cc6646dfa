package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1990:int;
      
      private var var_382:Boolean;
      
      private var var_1991:Boolean;
      
      private var var_813:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1991 = param1.readBoolean();
         if(var_1991)
         {
            var_1990 = param1.readInteger();
            var_382 = param1.readBoolean();
         }
         else
         {
            var_813 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_813 != null)
         {
            var_813.dispose();
            var_813 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_1990;
      }
      
      public function get owner() : Boolean
      {
         return var_382;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_1991;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_813;
      }
   }
}
