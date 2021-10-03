package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllerData;
   import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;
   
   public class RoomSettingsDataMessageParser implements IMessageParser
   {
       
      
      private var var_110:RoomSettingsData;
      
      public function RoomSettingsDataMessageParser()
      {
         super();
      }
      
      public function get data() : RoomSettingsData
      {
         return var_110;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_110 = new RoomSettingsData();
         var_110.roomId = param1.readInteger();
         var_110.name = param1.readString();
         var_110.description = param1.readString();
         var_110.doorMode = param1.readInteger();
         var_110.categoryId = param1.readInteger();
         var_110.maximumVisitors = param1.readInteger();
         var_110.maximumVisitorsLimit = param1.readInteger();
         var_110.showOwnerName = param1.readInteger() == 1 ? true : false;
         var_110.allowFurniMoving = param1.readInteger() == 1 ? true : false;
         var_110.allowTrading = param1.readInteger() == 1 ? true : false;
         var_110.tags = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_110.tags.push(param1.readString());
            _loc3_++;
         }
         var_110.controllers = [];
         var _loc4_:int = param1.readInteger();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            var_110.controllers.push(new FlatControllerData(param1));
            _loc5_++;
         }
         var_110.controllerCount = param1.readInteger();
         var_110.allowPets = param1.readInteger() == 1 ? true : false;
         return true;
      }
      
      public function flush() : Boolean
      {
         var_110 = null;
         return true;
      }
   }
}
