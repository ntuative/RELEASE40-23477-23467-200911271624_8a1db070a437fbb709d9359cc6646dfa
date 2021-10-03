package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_123:String = "RSPE_VOTE_RESULT";
      
      public static const const_112:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1197:int = 0;
      
      private var var_970:String = "";
      
      private var var_649:Array;
      
      private var var_962:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_962 = [];
         var_649 = [];
         super(param1,param2,param7,param8);
         var_970 = param3;
         var_962 = param4;
         var_649 = param5;
         if(var_649 == null)
         {
            var_649 = [];
         }
         var_1197 = param6;
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
