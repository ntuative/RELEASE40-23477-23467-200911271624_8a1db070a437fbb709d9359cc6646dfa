package com.sulake.habbo.avatar.legs
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.AvatarEditorGridItem;
   import com.sulake.habbo.avatar.common.CategoryData;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import flash.utils.Dictionary;
   
   public class LegsModel implements IAvatarEditorCategoryModel
   {
       
      
      private var var_313:Dictionary;
      
      private var _view:LegsView;
      
      private var _controller:HabboAvatarEditor;
      
      private var var_811:Boolean = false;
      
      private var _gender:String;
      
      public function LegsModel(param1:HabboAvatarEditor, param2:String = "")
      {
         super();
         _controller = param1;
         _gender = param2;
      }
      
      public function toggleItemSelection(param1:String, param2:int) : void
      {
         var _loc3_:CategoryData = var_313[param1];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:AvatarEditorGridItem = _loc3_.select(param2);
         _controller.figureData.savePartData(param1,_loc4_.id,_loc3_.currentColourId,true);
      }
      
      public function closingEditorView() : void
      {
         reset();
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(!var_811)
         {
            init();
         }
         return _view.getWindowContainer();
      }
      
      public function reset() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_313)
         {
            _loc1_.dispose();
         }
         var_313 = null;
         if(_view != null)
         {
            _view.dispose();
            _view = null;
         }
         var_811 = false;
      }
      
      private function init() : void
      {
         var_313 = new Dictionary();
         _view = new LegsView(this,controller.windowManager,controller.assets);
         updateView();
         var_811 = true;
      }
      
      public function categorySwitch(param1:String) : void
      {
         switch(param1)
         {
            case FigureData.const_126:
            case FigureData.const_160:
            case FigureData.const_140:
               initCategory(param1);
         }
      }
      
      public function get controller() : HabboAvatarEditor
      {
         return _controller;
      }
      
      public function updateView() : void
      {
         updateCategoryData(FigureData.const_126);
         updateCategoryData(FigureData.const_160);
         updateCategoryData(FigureData.const_140);
      }
      
      public function getCategoryContent(param1:String) : CategoryData
      {
         return var_313[param1];
      }
      
      public function dispose() : void
      {
         reset();
      }
      
      private function initCategory(param1:String) : void
      {
         var _loc2_:CategoryData = var_313[param1];
         if(_loc2_ == null)
         {
            var_313[param1] = _controller.generateDataContent(this,param1);
            updateCategoryData(param1);
         }
      }
      
      private function updateCategoryData(param1:String) : void
      {
         var _loc2_:int = _controller.figureData.getPartSetId(param1);
         var _loc3_:int = _controller.figureData.getColourId(param1);
         var _loc4_:CategoryData = var_313[param1];
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.selectItemWithId(_loc2_);
         _loc4_.selectColourWithId(_loc3_);
      }
      
      public function toggleColourSelection(param1:String, param2:int) : void
      {
         var _loc3_:CategoryData = var_313[param1];
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.selectColour(param2);
         _controller.figureData.savePartSetColourId(param1,_loc3_.currentColourId,true);
      }
   }
}
