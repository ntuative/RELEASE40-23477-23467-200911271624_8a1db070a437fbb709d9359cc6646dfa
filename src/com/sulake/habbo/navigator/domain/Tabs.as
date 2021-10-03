package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_681:int = 6;
      
      public static const const_183:int = 5;
      
      public static const const_650:int = 2;
      
      public static const const_295:int = 9;
      
      public static const const_249:int = 4;
      
      public static const const_257:int = 2;
      
      public static const const_649:int = 4;
      
      public static const const_187:int = 8;
      
      public static const const_710:int = 7;
      
      public static const const_267:int = 3;
      
      public static const const_274:int = 1;
      
      public static const const_198:int = 5;
      
      public static const const_363:int = 12;
      
      public static const const_321:int = 1;
      
      public static const const_399:int = 11;
      
      public static const const_641:int = 3;
      
      public static const const_1540:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_404:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_404 = new Array();
         var_404.push(new Tab(_navigator,const_274,const_363,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_377));
         var_404.push(new Tab(_navigator,const_257,const_321,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_377));
         var_404.push(new Tab(_navigator,const_249,const_399,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_673));
         var_404.push(new Tab(_navigator,const_267,const_183,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_377));
         var_404.push(new Tab(_navigator,const_198,const_187,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_662));
         setSelectedTab(const_274);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_404)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_404)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_404)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_249;
      }
      
      public function get tabs() : Array
      {
         return var_404;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
