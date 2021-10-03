package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_1764:XML;
      
      private var var_1365:ITextWindow;
      
      private var var_1364:ITextWindow;
      
      private var var_1766:XML;
      
      private var var_743:IWindowContainer;
      
      private var var_2172:ITextWindow;
      
      private var var_1767:String = "";
      
      private var var_2228:IButtonWindow;
      
      private var var_1765:XML;
      
      private var var_1363:ITextWindow;
      
      private var var_1768:XML;
      
      private var var_744:IButtonWindow;
      
      private var var_168:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_302:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1766) as IWindowContainer;
               break;
            case Offer.const_463:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1768) as IWindowContainer;
               break;
            case Offer.const_412:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1764) as IWindowContainer;
               break;
            case Offer.const_708:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1765) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_743 != null)
            {
               _window.removeChild(var_743);
               var_743.dispose();
            }
            var_743 = _loc2_;
            _window.addChild(_loc2_);
            var_743.x = 0;
            var_743.y = 0;
         }
         var_1363 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1364 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1365 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2172 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_744 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_744 != null)
         {
            var_744.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_744.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_168 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_168,page,var_1767);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_1766 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_1768 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_1764 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_1765 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_945,method_7);
      }
      
      private function method_7(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_1767 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_168 = param1.offer;
         attachStub(var_168.priceType);
         if(var_1363 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_168.priceInCredits));
            var_1363.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1364 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_168.priceInPixels));
            var_1364.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1365 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_168.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_168.priceInPixels));
            var_1365.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_744 != null)
         {
            var_744.enable();
         }
      }
   }
}
