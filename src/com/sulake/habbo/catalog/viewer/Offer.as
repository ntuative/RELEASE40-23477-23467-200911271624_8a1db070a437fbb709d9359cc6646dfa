package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_772:String = "price_type_none";
      
      public static const const_371:String = "pricing_model_multi";
      
      public static const const_302:String = "price_type_credits";
      
      public static const const_412:String = "price_type_credits_and_pixels";
      
      public static const const_395:String = "pricing_model_bundle";
      
      public static const const_406:String = "pricing_model_single";
      
      public static const const_708:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1152:String = "pricing_model_unknown";
      
      public static const const_463:String = "price_type_pixels";
       
      
      private var var_846:int;
      
      private var var_1267:int;
      
      private var var_845:int;
      
      private var var_406:String;
      
      private var var_564:String;
      
      private var var_2102:int;
      
      private var var_644:ICatalogPage;
      
      private var var_1268:String;
      
      private var var_405:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         var_1267 = param1.offerId;
         var_1268 = param1.localizationId;
         var_846 = param1.priceInCredits;
         var_845 = param1.priceInPixels;
         var_644 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(_loc4_.productType);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_406;
      }
      
      public function get page() : ICatalogPage
      {
         return var_644;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_2102 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_405;
      }
      
      public function get localizationId() : String
      {
         return var_1268;
      }
      
      public function get offerId() : int
      {
         return var_1267;
      }
      
      public function get priceInPixels() : int
      {
         return var_845;
      }
      
      public function dispose() : void
      {
         var_1267 = 0;
         var_1268 = "";
         var_846 = 0;
         var_845 = 0;
         var_644 = null;
         if(var_405 != null)
         {
            var_405.dispose();
            var_405 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_564;
      }
      
      public function get previewCallbackId() : int
      {
         return var_2102;
      }
      
      public function get priceInCredits() : int
      {
         return var_846;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_406 = const_406;
            }
            else
            {
               var_406 = const_371;
            }
         }
         else if(param1.length > 1)
         {
            var_406 = const_395;
         }
         else
         {
            var_406 = const_1152;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_406)
         {
            case const_406:
               var_405 = new SingleProductContainer(this,param1);
               break;
            case const_371:
               var_405 = new MultiProductContainer(this,param1);
               break;
            case const_395:
               var_405 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_406);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_846 > 0 && var_845 > 0)
         {
            var_564 = const_412;
         }
         else if(var_846 > 0)
         {
            var_564 = const_302;
         }
         else if(var_845 > 0)
         {
            var_564 = const_463;
         }
         else
         {
            var_564 = const_772;
         }
      }
   }
}
