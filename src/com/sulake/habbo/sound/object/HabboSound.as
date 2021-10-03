package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_918:SoundChannel = null;
      
      private var var_742:Boolean;
      
      private var var_919:Sound = null;
      
      private var var_610:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_919 = param1;
         var_919.addEventListener(Event.COMPLETE,onComplete);
         var_610 = 1;
         var_742 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_742;
      }
      
      public function stop() : Boolean
      {
         var_918.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_742 = false;
         var_918 = var_919.play(0);
         this.volume = var_610;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_610;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_918.position;
      }
      
      public function get length() : Number
      {
         return var_919.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_610 = param1;
         if(var_918 != null)
         {
            var_918.soundTransform = new SoundTransform(var_610);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_742 = true;
      }
   }
}
