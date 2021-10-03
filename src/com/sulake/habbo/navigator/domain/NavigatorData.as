package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1368:int = 10;
       
      
      private var var_1473:NavigatorSettingsMessageParser;
      
      private var var_1259:int;
      
      private var var_2041:Boolean;
      
      private var var_2040:int;
      
      private var var_824:Dictionary;
      
      private var var_2196:int;
      
      private var var_2044:int;
      
      private var var_1912:int;
      
      private var var_313:Array;
      
      private var var_2043:int;
      
      private var var_1213:Array;
      
      private var var_561:PublicRoomShortData;
      
      private var var_402:RoomEventData;
      
      private var var_142:MsgWithRequestId;
      
      private var var_1940:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_2042:Boolean;
      
      private var var_203:GuestRoomData;
      
      private var var_674:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_313 = new Array();
         var_824 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_2040;
      }
      
      public function get eventMod() : Boolean
      {
         return var_2042;
      }
      
      public function startLoading() : void
      {
         this.var_674 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_2042 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_402 != null)
         {
            var_402.dispose();
         }
         var_402 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_142 != null && var_142 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_142 != null && var_142 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_142 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_203;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_561 = null;
         var_203 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_561 = param1.publicSpace;
            var_402 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(var_402 != null)
         {
            var_402.dispose();
            var_402 = null;
         }
         if(var_561 != null)
         {
            var_561.dispose();
            var_561 = null;
         }
         if(var_203 != null)
         {
            var_203.dispose();
            var_203 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_142 = param1;
         var_674 = false;
         if(var_1213 == null)
         {
            var_1213 = param1.topLevelNodes;
         }
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1473;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_142 = param1;
         var_674 = false;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function getCategoryByIndex(param1:int) : FlatCategory
      {
         if(var_313.length > param1)
         {
            return var_313[param1] as FlatCategory;
         }
         return null;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2196 = param1.limit;
         this.var_1259 = param1.favouriteRoomIds.length;
         this.var_824 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_824[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_142 as PopularRoomTagsData;
      }
      
      public function get categories() : Array
      {
         return var_313;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_561;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1912 = param1;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_2041;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_142 = param1;
         var_674 = false;
      }
      
      public function getCategoryIndexById(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < var_313.length)
         {
            if((var_313[_loc2_] as FlatCategory).nodeId == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_203 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_674;
      }
      
      public function set categories(param1:Array) : void
      {
         var_313 = param1;
      }
      
      public function get currentRoomRating() : int
      {
         return var_2044;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_2043;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1473 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_142 == null)
         {
            return;
         }
         var_142.dispose();
         var_142 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_402;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_824[param1] = !!param2 ? "yes" : null;
         var_1259 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_142 as OfficialRoomsData;
      }
      
      public function get topLevelNodes() : Array
      {
         return var_1213;
      }
      
      public function get avatarId() : int
      {
         return var_1912;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_142 != null && var_142 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_2041 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_2044 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1940 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_203 != null)
         {
            var_203.dispose();
         }
         var_203 = param1;
      }
      
      public function getCategoryById(param1:int) : FlatCategory
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_313)
         {
            if(_loc2_.nodeId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_203 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1473.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1259 >= var_2196;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_2043 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1940;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_203 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_2040 = param1;
      }
   }
}
