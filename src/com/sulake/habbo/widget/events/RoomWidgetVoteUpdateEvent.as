package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_123:String = "RWPUE_VOTE_RESULT";
      
      public static const const_112:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1197:int;
      
      private var var_970:String;
      
      private var var_649:Array;
      
      private var var_962:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_970 = param2;
         var_962 = param3;
         var_649 = param4;
         if(var_649 == null)
         {
            var_649 = [];
         }
         var_1197 = param5;
      }
      
      public function get votes() : Array
      {
         return var_649.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1197;
      }
      
      public function get question() : String
      {
         return var_970;
      }
      
      public function get choices() : Array
      {
         return var_962.slice();
      }
   }
}
