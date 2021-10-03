package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import com.sulake.core.window.graphics.WindowRedrawFlag;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.Iterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class ItemListController extends WindowController implements IItemListWindow
   {
       
      
      protected var _container:IWindowContainer;
      
      protected var _spacing:int = 0;
      
      protected var var_72:Number;
      
      protected var var_2202:Number = 0;
      
      protected var var_487:Boolean = false;
      
      protected var var_2203:Number = 0;
      
      protected var var_488:Number;
      
      protected var var_1029:Boolean = false;
      
      protected var var_489:Number;
      
      protected var var_183:Boolean = false;
      
      protected var var_95:Number;
      
      protected var var_1283:Boolean = false;
      
      protected var _horizontal:Boolean = false;
      
      protected var var_689:Boolean = true;
      
      public function ItemListController(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:WindowContext, param7:Rectangle, param8:IWindow, param9:Function = null, param10:Array = null, param11:Array = null, param12:uint = 0)
      {
         var_488 = 0;
         var_489 = 0;
         var_95 = 0;
         var_72 = 0;
         param5 |= 0;
         _horizontal = param3 == WindowType.const_292;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12);
         var _loc13_:Rectangle = new Rectangle(0,0,width,height);
         _container = _context.create("_CONTAINER","",WindowType.const_312,WindowStyle.const_247,0 | 0 | 0 | 0,_loc13_,null,this,0,null,[WindowController.INTERNAL_CHILD_TAG,WindowController.EXCLUDE_CHILD_TAG]) as IWindowContainer;
         _container.addEventListener(WindowEvent.const_43,containerEventHandler);
         _container.addEventListener(WindowEvent.const_402,containerEventHandler);
         _container.addEventListener(WindowEvent.const_300,containerEventHandler);
         _container.addEventListener(WindowEvent.const_405,containerEventHandler);
         resizeOnItemUpdate = var_1029;
      }
      
      public function swapListItemsAt(param1:int, param2:int) : void
      {
         _container.swapChildrenAt(param1,param2);
         updateScrollAreaRegion();
      }
      
      public function get visibleRegion() : Rectangle
      {
         return new Rectangle(var_488 * maxScrollH,var_489 * maxScrollV,width,height);
      }
      
      public function get maxScrollH() : int
      {
         var _loc1_:int = var_95 - width;
         return _loc1_ < 0 ? 0 : int(_loc1_);
      }
      
      public function get scrollH() : Number
      {
         return var_488;
      }
      
      override public function dispose() : void
      {
         _container.removeEventListener(WindowEvent.const_43,containerEventHandler);
         _container.removeEventListener(WindowEvent.const_402,containerEventHandler);
         _container.removeEventListener(WindowEvent.const_300,containerEventHandler);
         _container.removeEventListener(WindowEvent.const_405,containerEventHandler);
         super.dispose();
      }
      
      public function get maxScrollV() : int
      {
         var _loc1_:int = var_72 - height;
         return _loc1_ < 0 ? 0 : int(_loc1_);
      }
      
      public function get scrollV() : Number
      {
         return var_489;
      }
      
      public function set scrollH(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         if(param1 != var_488)
         {
            var_488 = param1;
            _container.x = -var_488 * maxScrollH;
            _context.invalidate(_container,visibleRegion,WindowRedrawFlag.const_70);
         }
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         _loc1_.push(new PropertyStruct("spacing",_spacing,PropertyStruct.const_83,_spacing != 0));
         _loc1_.push(new PropertyStruct("auto_arrange_items",var_689,PropertyStruct.const_58,var_689 != true));
         _loc1_.push(new PropertyStruct("scale_to_fit_items",var_487,PropertyStruct.const_58,var_487 != false));
         _loc1_.push(new PropertyStruct("resize_on_item_update",var_1029,PropertyStruct.const_58,var_1029 != false));
         return _loc1_;
      }
      
      public function get scrollStepH() : Number
      {
         return !!_horizontal ? Number(0 / numListItems) : Number(0);
      }
      
      public function setListItemIndex(param1:IWindow, param2:int) : void
      {
         _container.setChildIndex(param1,param2);
      }
      
      public function get scrollStepV() : Number
      {
         return !!_horizontal ? 0 : Number(0 / numListItems);
      }
      
      public function groupListItemsWithID(param1:uint, param2:Array, param3:Boolean = false) : uint
      {
         return _container.groupChildrenWithID(param1,param2,param3);
      }
      
      public function get spacing() : int
      {
         return _spacing;
      }
      
      public function set scrollV(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         if(param1 != var_489)
         {
            var_489 = param1;
            _container.y = -var_489 * maxScrollV;
            _context.invalidate(_container,visibleRegion,WindowRedrawFlag.const_70);
         }
      }
      
      public function set scrollStepH(param1:Number) : void
      {
         var_2202 = Math.max(param1,0);
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc2_:uint = param1.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_] as PropertyStruct;
            switch(_loc3_.key)
            {
               case "spacing":
                  spacing = _loc3_.value as int;
                  break;
               case "scale_to_fit_items":
                  scaleToFitItems = _loc3_.value as Boolean;
                  break;
               case "resize_on_item_update":
                  resizeOnItemUpdate = _loc3_.value as Boolean;
                  break;
               case "auto_arrange_items":
                  var_689 = _loc3_.value as Boolean;
                  break;
            }
            _loc4_++;
         }
         super.properties = param1;
      }
      
      public function addListItemAt(param1:IWindow, param2:uint) : IWindow
      {
         param1 = _container.addChildAt(param1,param2);
         updateScrollAreaRegion();
         return param1;
      }
      
      public function get iterator() : IIterator
      {
         return new Iterator(this);
      }
      
      public function groupListItemsWithTag(param1:String, param2:Array, param3:Boolean = false) : uint
      {
         return _container.groupChildrenWithTag(param1,param2,param3);
      }
      
      public function swapListItems(param1:IWindow, param2:IWindow) : void
      {
         _container.swapChildren(param1,param2);
         updateScrollAreaRegion();
      }
      
      public function set scaleToFitItems(param1:Boolean) : void
      {
         var_487 = param1;
         updateScrollAreaRegion();
      }
      
      public function set scrollStepV(param1:Number) : void
      {
         var_2203 = Math.max(param1,0);
      }
      
      public function get scrollableRegion() : Rectangle
      {
         return _container.rectangle.clone();
      }
      
      private function containerEventHandler(param1:Event) : void
      {
         switch(param1.type)
         {
            case WindowEvent.const_402:
               updateScrollAreaRegion();
               break;
            case WindowEvent.const_300:
               if(!var_1283)
               {
                  updateScrollAreaRegion();
               }
               break;
            case WindowEvent.const_405:
               updateScrollAreaRegion();
               break;
            case WindowEvent.const_43:
               dispatchEvent(new WindowEvent(WindowEvent.const_43,this,null));
               break;
            default:
               Logger.log("ItemListController::containerEventHandler(" + param1.type + ")");
         }
      }
      
      public function removeListItem(param1:IWindow) : IWindow
      {
         param1 = _container.removeChild(param1);
         updateScrollAreaRegion();
         return param1;
      }
      
      public function arrangeListItems() : void
      {
         updateScrollAreaRegion();
      }
      
      public function get lastListItem() : IWindow
      {
         return numListItems > 0 ? getListItemAt(numListItems - 1) : null;
      }
      
      public function removeListItemAt(param1:int) : IWindow
      {
         return _container.removeChildAt(param1);
      }
      
      public function set spacing(param1:int) : void
      {
         if(param1 != _spacing)
         {
            _spacing = param1;
            updateScrollAreaRegion();
         }
      }
      
      public function addListItem(param1:IWindow) : IWindow
      {
         var_183 = true;
         if(_horizontal)
         {
            param1.x = var_95 + (numListItems > 0 ? _spacing : 0);
            var_95 = param1.rectangle.right;
            _container.width = var_95;
         }
         else
         {
            if(autoArrangeItems)
            {
               param1.y = var_72 + (numListItems > 0 ? _spacing : 0);
               var_72 = param1.rectangle.bottom;
            }
            else
            {
               var_72 = Math.max(var_72,param1.rectangle.bottom);
            }
            _container.height = var_72;
         }
         param1 = _container.addChild(param1);
         var_183 = false;
         return param1;
      }
      
      public function set autoArrangeItems(param1:Boolean) : void
      {
         var_689 = param1;
         updateScrollAreaRegion();
      }
      
      public function getListItemByID(param1:uint) : IWindow
      {
         return _container.getChildByID(param1);
      }
      
      public function set resizeOnItemUpdate(param1:Boolean) : void
      {
         var_1029 = param1;
         if(_container)
         {
            if(_horizontal)
            {
               _container.setParamFlag(WindowParam.const_434,param1);
            }
            else
            {
               _container.setParamFlag(WindowParam.const_470,param1);
            }
         }
      }
      
      public function get firstListItem() : IWindow
      {
         return numListItems > 0 ? getListItemAt(0) : null;
      }
      
      protected function updateScrollAreaRegion() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(var_689 && !var_183 && _container)
         {
            var_183 = true;
            _loc1_ = 0;
            if(_horizontal)
            {
               var_95 = 0;
               var_72 = var_22.height;
               _loc4_ = 0;
               while(_loc4_ < _loc1_)
               {
                  _loc2_ = _container.getChildAt(_loc4_);
                  if(_loc2_.visible)
                  {
                     _loc2_.x = var_95;
                     var_95 += _loc2_.width + _spacing;
                     if(var_487)
                     {
                        _loc3_ = _loc2_.height + _loc2_.y;
                        var_72 = _loc3_ > var_72 ? Number(_loc3_) : Number(var_72);
                     }
                  }
                  _loc4_++;
               }
               if(_loc1_ > 0)
               {
                  var_95 -= _spacing;
               }
            }
            else
            {
               var_95 = var_22.width;
               var_72 = 0;
               _loc4_ = 0;
               while(_loc4_ < _loc1_)
               {
                  _loc2_ = _container.getChildAt(_loc4_);
                  if(_loc2_.visible)
                  {
                     _loc2_.y = var_72;
                     var_72 += _loc2_.height + _spacing;
                     if(var_487)
                     {
                        _loc3_ = _loc2_.width + _loc2_.x;
                        var_95 = _loc3_ > var_95 ? Number(_loc3_) : Number(var_95);
                     }
                  }
                  _loc4_++;
               }
               if(_loc1_ > 0)
               {
                  var_72 -= _spacing;
               }
            }
            if(var_488 > 0)
            {
               if(var_95 <= var_22.width)
               {
                  scrollH = 0;
               }
               else
               {
                  _container.x = -(var_488 * maxScrollH);
               }
            }
            if(var_489 > 0)
            {
               if(var_72 <= var_22.height)
               {
                  scrollV = 0;
               }
               else
               {
                  _container.y = -(var_489 * maxScrollV);
               }
            }
            _container.height = var_72;
            _container.width = var_95;
            var_183 = false;
         }
      }
      
      public function getListItemByName(param1:String) : IWindow
      {
         return _container.getChildByName(param1);
      }
      
      public function removeListItems() : void
      {
         var_183 = true;
         while(numListItems > 0)
         {
            _container.removeChildAt(0);
         }
         var_183 = false;
         updateScrollAreaRegion();
      }
      
      public function get scaleToFitItems() : Boolean
      {
         return var_487;
      }
      
      override protected function cloneChildWindows(param1:WindowController) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < numListItems)
         {
            IItemListWindow(param1).addListItem(getListItemAt(_loc2_).clone());
            _loc2_++;
         }
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         var _loc3_:Boolean = super.update(param1,param2);
         switch(param2.type)
         {
            case WindowNotifyEvent.const_386:
               break;
            case WindowNotifyEvent.const_507:
               var_1283 = true;
               break;
            case WindowNotifyEvent.const_258:
               if(!var_487)
               {
                  if(_horizontal)
                  {
                     _container.height = var_22.height;
                  }
                  else
                  {
                     _container.width = var_22.width;
                  }
               }
               updateScrollAreaRegion();
               var_1283 = false;
               break;
            case MouseEvent.MOUSE_WHEEL:
               if(_horizontal)
               {
                  scrollH -= MouseEvent(param2).delta * 0.01;
               }
               else
               {
                  scrollV -= MouseEvent(param2).delta * 0.01;
               }
               _loc3_ = true;
         }
         return _loc3_;
      }
      
      public function get autoArrangeItems() : Boolean
      {
         return var_689;
      }
      
      public function getListItemIndex(param1:IWindow) : int
      {
         return _container.getChildIndex(param1);
      }
      
      public function get resizeOnItemUpdate() : Boolean
      {
         return var_1029;
      }
      
      public function getListItemAt(param1:uint) : IWindow
      {
         return _container.getChildAt(param1);
      }
      
      public function get numListItems() : int
      {
         return _container != null ? 0 : 0;
      }
      
      public function destroyListItems() : void
      {
         var_183 = true;
         while(numListItems > 0)
         {
            _container.removeChildAt(0).destroy();
         }
         var_183 = false;
         updateScrollAreaRegion();
      }
   }
}
