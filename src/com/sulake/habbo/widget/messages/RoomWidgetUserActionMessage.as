package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_529:String = "RWUAM_RESPECT_USER";
      
      public static const const_600:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_585:String = "RWUAM_START_TRADING";
      
      public static const const_653:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_689:String = "RWUAM_WHISPER_USER";
      
      public static const const_575:String = "RWUAM_IGNORE_USER";
      
      public static const const_582:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_533:String = "RWUAM_BAN_USER";
      
      public static const const_571:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_359:String = "RWUAM_KICK_USER";
      
      public static const const_534:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_679:String = " RWUAM_RESPECT_PET";
      
      public static const const_439:String = "RWUAM_KICK_BOT";
      
      public static const const_1208:String = "RWUAM_TRAIN_PET";
      
      public static const const_489:String = "RWUAM_PICKUP_PET";
      
      public static const const_499:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_558:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
