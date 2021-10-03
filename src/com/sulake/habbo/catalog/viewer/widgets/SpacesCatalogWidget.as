package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class SpacesCatalogWidget extends CatalogWidget implements ICatalogWidget, IGetImageListener
   {
      
      private static const const_172:String = "landscape";
      
      private static const const_171:String = "floor";
      
      private static const const_170:String = "wallpaper";
       
      
      private var var_1182:String = "default";
      
      private var var_1075:Array;
      
      private var var_885:BitmapData = null;
      
      private var var_214:int = 0;
      
      private var var_590:int = 0;
      
      private var var_1181:String = "1.1";
      
      private var var_1629:int = -1;
      
      private var var_1630:int = -1;
      
      private var var_704:Array;
      
      private var var_591:int = 0;
      
      private var var_886:BitmapData = null;
      
      private var var_277:int = 0;
      
      private var var_592:int = 0;
      
      private var var_278:int = 0;
      
      private var var_241:int = 0;
      
      private var _activeWallpaperPatterns:Array;
      
      private var _floorType:String = "default";
      
      private var var_705:Array;
      
      private var var_1074:Array;
      
      private var var_242:int = 0;
      
      private var var_175:XML;
      
      private var var_1076:Array;
      
      private var var_276:int = 0;
      
      public function SpacesCatalogWidget(param1:IWindowContainer)
      {
         var_1076 = [];
         _activeWallpaperPatterns = [];
         var_1075 = [];
         var_705 = [];
         var_1074 = [];
         var_704 = [];
         super(param1);
      }
      
      private function setRoomImage(param1:BitmapData, param2:BitmapData) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         var _loc3_:Point = new Point(param1.width / 2 + 4 + 19,param1.height / 2 - param2.height / 2 - 24 + 10);
         var _loc4_:BitmapData = new BitmapData(param1.width,param1.height,param1.transparent);
         _loc4_.copyPixels(param1,param1.rect,new Point(0,0),null,null,true);
         _loc4_.copyPixels(param2,param2.rect,_loc3_,null,null,true);
         var _loc5_:IBitmapWrapperWindow = window.getChildByName("catalog_floor_preview_example") as IBitmapWrapperWindow;
         if(_loc5_ != null)
         {
            if(_loc5_.bitmap == null)
            {
               _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height,true,16777215);
            }
            _loc5_.bitmap.fillRect(_loc5_.bitmap.rect,16777215);
            _loc6_ = (_loc5_.width - _loc4_.width) / 2;
            _loc7_ = (_loc5_.height - _loc4_.height) / 2;
            _loc5_.bitmap.copyPixels(_loc4_,_loc4_.rect,new Point(_loc6_,_loc7_),null,null,true);
            _loc5_.invalidate();
         }
      }
      
      private function changeColor(param1:String, param2:int) : void
      {
         switch(param1)
         {
            case const_170:
               var_214 += param2;
               if(var_214 < 0)
               {
                  if(var_592 > 0)
                  {
                     var_214 = var_592 - 1;
                  }
                  else
                  {
                     var_214 = 0;
                  }
               }
               if(var_214 >= var_592)
               {
                  var_214 = 0;
               }
               break;
            case const_171:
               var_241 += param2;
               if(var_241 < 0)
               {
                  if(var_591 > 0)
                  {
                     var_241 = var_591 - 1;
                  }
                  else
                  {
                     var_241 = 0;
                  }
               }
               if(var_241 >= var_591)
               {
                  var_241 = 0;
               }
               break;
            case const_172:
               var_242 += param2;
               if(var_242 < 0)
               {
                  if(var_590 > 0)
                  {
                     var_242 = var_590 - 1;
                  }
                  else
                  {
                     var_242 = 0;
                  }
               }
               if(var_242 >= var_590)
               {
                  var_242 = 0;
               }
         }
      }
      
      override public function init() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:Boolean = false;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         super.init();
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("configuration_catalog_spaces") as XmlAsset;
         if(_loc1_ != null)
         {
            var_175 = _loc1_.content as XML;
            for each(_loc2_ in page.offers)
            {
               _loc4_ = _loc2_.productContainer.firstProduct;
               _loc5_ = _loc2_.localizationId;
               _loc6_ = _loc5_.split(" ")[0];
               _loc7_ = _loc5_.split(" ")[1];
               _loc8_ = false;
               switch(_loc4_.furnitureData.name)
               {
                  case "floor":
                     for each(_loc9_ in var_175.floors.pattern)
                     {
                        var_705.push(String(_loc9_.@id));
                        var_1075.push(_loc2_);
                     }
                     break;
                  case "wallpaper":
                     for each(_loc10_ in var_175.walls.pattern)
                     {
                        if(_loc10_.@id == _loc7_)
                        {
                           _activeWallpaperPatterns.push(_loc7_);
                           _loc8_ = true;
                        }
                     }
                     if(_loc8_)
                     {
                        var_1076.push(_loc2_);
                     }
                     else
                     {
                        Logger.log("[SpacesCatalogWidget] Could not find wallpaper pattern configuration! " + [_loc2_.localizationId,_loc4_.furnitureData.name]);
                     }
                     break;
                  case "landscape":
                     for each(_loc11_ in var_175.landscapes.pattern)
                     {
                        if(_loc11_.@id == _loc7_)
                        {
                           var_704.push(_loc7_);
                           _loc8_ = true;
                        }
                     }
                     if(_loc8_)
                     {
                        var_1074.push(_loc2_);
                     }
                     else
                     {
                        Logger.log("[SpacesCatalogWidget] Could not find landscape pattern configuration! " + [_loc2_.localizationId,_loc4_.furnitureData.name]);
                     }
                     break;
                  default:
                     Logger.log("[SpacesCatalogWidget] : " + _loc4_.furnitureData.name);
                     break;
               }
            }
            _loc3_ = 0;
            while(_loc3_ < _window.numChildren)
            {
               _loc12_ = _window.getChildAt(_loc3_);
               if(_loc12_ is IButtonWindow)
               {
                  _loc12_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onClick);
               }
               _loc3_++;
            }
            changePattern(const_170,0);
            changePattern(const_172,0);
            changePattern(const_171,0);
            updateConfiguration();
            retrieveSpacesPreview();
            return;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         switch(param1)
         {
            case var_1630:
               var_885 = param2;
               break;
            case var_1629:
               var_886 = param2;
         }
         if(var_885 != null && var_886 != null)
         {
            setRoomImage(var_885,var_886);
         }
      }
      
      private function updateConfiguration() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc2_:String = "null";
         for each(_loc1_ in var_175.walls.pattern)
         {
            if(_loc1_.@id == _loc2_)
            {
               if(var_214 >= 0)
               {
                  _loc9_ = _loc1_.children()[var_214];
                  if(_loc9_ != null)
                  {
                     var_1182 = _loc9_.@id;
                  }
               }
            }
         }
         _loc3_ = var_1076[var_277];
         _loc4_ = (page.viewer.catalog as HabboCatalog).localization;
         if(_loc3_ != null)
         {
            _loc10_ = _window.findChildByName("ctlg_wall_price") as ITextWindow;
            if(_loc10_ != null)
            {
               _loc10_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc3_.priceInCredits));
            }
         }
         var _loc5_:String = "null";
         for each(_loc1_ in var_175.floors.pattern)
         {
            if(_loc1_.@id == _loc5_)
            {
               _loc11_ = _loc1_.children()[var_241];
               if(_loc11_ != null)
               {
                  _floorType = _loc11_.@id;
               }
            }
         }
         _loc6_ = var_1075[var_278];
         if(_loc6_ != null)
         {
            _loc12_ = _window.findChildByName("ctlg_floor_price") as ITextWindow;
            if(_loc12_ != null)
            {
               _loc12_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc6_.priceInCredits));
            }
         }
         var _loc7_:String = "null";
         for each(_loc1_ in var_175.landscapes.pattern)
         {
            if(_loc1_.@id == _loc7_)
            {
               _loc13_ = _loc1_.children()[var_242];
               if(_loc13_ != null)
               {
                  var_1181 = _loc13_.@id;
               }
            }
         }
         _loc8_ = var_1074[var_276];
         if(_loc8_ != null)
         {
            _loc14_ = _window.findChildByName("ctlg_landscape_price") as ITextWindow;
            if(_loc14_ != null)
            {
               _loc14_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc8_.priceInCredits));
            }
         }
      }
      
      private function changePattern(param1:String, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         switch(param1)
         {
            case const_170:
               var_277 += param2;
               if(var_277 < 0)
               {
                  var_277 = -1;
               }
               if(var_277 == _activeWallpaperPatterns.length)
               {
                  var_277 = 0;
               }
               var_214 = 0;
               var_592 = 0;
               _loc5_ = "null";
               for each(_loc8_ in var_175.walls.pattern)
               {
                  if(_loc8_.@id == _loc5_)
                  {
                     var_592 = _loc8_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_wall_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_wall_color_next") as IButtonWindow;
               if(var_592 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
               break;
            case const_171:
               var_278 += param2;
               if(var_278 < 0)
               {
                  var_278 = -1;
               }
               if(var_278 >= var_705.length)
               {
                  var_278 = 0;
               }
               var_241 = 0;
               var_591 = 0;
               _loc6_ = "null";
               for each(_loc9_ in var_175.floors.pattern)
               {
                  if(_loc9_.@id == _loc6_)
                  {
                     var_591 = _loc9_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_floor_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_floor_color_next") as IButtonWindow;
               if(var_591 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
               break;
            case const_172:
               var_276 += param2;
               if(var_276 < 0)
               {
                  var_276 = -1;
               }
               if(var_276 >= var_704.length)
               {
                  var_276 = 0;
               }
               var_242 = 0;
               var_590 = 0;
               _loc7_ = "null";
               for each(_loc10_ in var_175.landscapes.pattern)
               {
                  if(_loc10_.@id == _loc7_)
                  {
                     var_590 = _loc10_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_landscape_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_landscape_color_next") as IButtonWindow;
               if(var_590 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
         }
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:IWindow = param1.target as IWindow;
         if(_loc2_ == null)
         {
            return;
         }
         switch(_loc2_.name)
         {
            case "ctlg_wall_pattern_prev":
               changePattern(const_170,-1);
               break;
            case "ctlg_wall_pattern_next":
               changePattern(const_170,1);
               break;
            case "ctlg_wall_color_prev":
               changeColor(const_170,-1);
               break;
            case "ctlg_wall_color_next":
               changeColor(const_170,1);
               break;
            case "ctlg_buy_wall":
               _loc3_ = var_1076[var_277];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page,var_1182);
               }
               break;
            case "ctlg_floor_pattern_prev":
               changePattern(const_171,-1);
               break;
            case "ctlg_floor_pattern_next":
               changePattern(const_171,1);
               break;
            case "ctlg_floor_color_prev":
               changeColor(const_171,-1);
               break;
            case "ctlg_floor_color_next":
               changeColor(const_171,1);
               break;
            case "ctlg_buy_floor":
               _loc3_ = var_1075[var_278];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page,_floorType);
               }
               break;
            case "ctlg_landscape_pattern_next":
               changePattern(const_172,-1);
               break;
            case "ctlg_landscape_pattern_prev":
               changePattern(const_172,1);
               break;
            case "ctlg_landscape_color_prev":
               changeColor(const_172,-1);
               break;
            case "ctlg_landscape_color_next":
               changeColor(const_172,1);
               break;
            case "ctlg_buy_landscape":
               _loc3_ = var_1074[var_276];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page,var_1181);
               }
               break;
            default:
               Logger.log("Spaces, unknown button: " + _loc2_.name);
         }
         updateConfiguration();
         retrieveSpacesPreview();
      }
      
      private function retrieveSpacesPreview() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:ImageResult = page.viewer.roomEngine.getRoomImage(_floorType,var_1182,var_1181,64,this,"window_romantic_wide");
         var _loc3_:ImageResult = page.viewer.roomEngine.getGenericRoomObjectImage("window_romantic_wide","",new Vector3d(180,0,0),64,this,"window_romantic_wide");
         if(_loc2_ != null && _loc3_ != null)
         {
            var_1630 = _loc2_.id;
            var_1629 = _loc3_.id;
            _loc4_ = _loc2_.data as BitmapData;
            _loc5_ = _loc3_.data as BitmapData;
            if(_loc4_ != null && _loc5_ != null)
            {
               var_885 = _loc4_;
               var_886 = _loc5_;
               setRoomImage(_loc4_,_loc5_);
            }
         }
      }
   }
}
