package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_797:int = 4;
      
      public static const TYPE_PUBLIC_SPACE:int = 3;
      
      public static const const_660:int = 2;
      
      public static const const_929:int = 1;
       
      
      private var var_1679:String;
      
      private var _disposed:Boolean;
      
      private var var_1598:int;
      
      private var var_1681:Boolean;
      
      private var var_837:String;
      
      private var var_717:PublicRoomData;
      
      private var _index:int;
      
      private var var_1680:String;
      
      private var _type:int;
      
      private var var_1626:String;
      
      private var var_716:GuestRoomData;
      
      private var var_1678:String;
      
      private var var_1677:int;
      
      public function OfficialRoomEntryData(param1:int, param2:IMessageDataWrapper)
      {
         super();
         _index = param1;
         var_1679 = param2.readString();
         var_1678 = param2.readString();
         var_1681 = param2.readInteger() == 1;
         var_1680 = param2.readString();
         var_837 = param2.readString();
         var_1598 = param2.readInteger();
         _type = param2.readInteger();
         if(_type == const_929)
         {
            var_1626 = param2.readString();
         }
         else if(_type == TYPE_PUBLIC_SPACE)
         {
            var_717 = new PublicRoomData(param2);
         }
         else if(_type == const_660)
         {
            var_716 = new GuestRoomData(param2);
         }
         else if(_type == const_797)
         {
            var_1677 = param2.readInteger();
         }
      }
      
      public function get tag() : String
      {
         return var_1626;
      }
      
      public function get userCount() : int
      {
         return var_1598;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1681;
      }
      
      public function get picText() : String
      {
         return var_1680;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_929)
         {
            return 0;
         }
         if(this.type == const_660)
         {
            return this.var_716.maxUserCount;
         }
         if(this.type == TYPE_PUBLIC_SPACE)
         {
            return this.var_717.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_1678;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_716 != null)
         {
            this.var_716.dispose();
            this.var_716 = null;
         }
         if(this.var_717 != null)
         {
            this.var_717.dispose();
            this.var_717 = null;
         }
      }
      
      public function get popupCaption() : String
      {
         return var_1679;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_716;
      }
      
      public function get method_3() : String
      {
         return var_837;
      }
      
      public function get flatCategoryId() : int
      {
         return var_1677;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_717;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
