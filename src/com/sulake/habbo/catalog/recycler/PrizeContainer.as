package com.sulake.habbo.catalog.recycler
{
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   
   public class PrizeContainer extends PrizeGridItem
   {
       
      
      private var var_1683:String;
      
      private var var_2210:PrizeGridItem;
      
      private var var_1908:int;
      
      private var _furnitureData:IFurnitureData;
      
      private var var_1428:int;
      
      public function PrizeContainer(param1:String, param2:int, param3:IFurnitureData, param4:int)
      {
         super();
         var_1683 = param1;
         var_1428 = param2;
         _furnitureData = param3;
         var_1908 = param4;
      }
      
      public function get oddsLevelId() : int
      {
         return var_1908;
      }
      
      public function get productItemType() : String
      {
         return var_1683;
      }
      
      public function get title() : String
      {
         if(_furnitureData == null)
         {
            return "";
         }
         return _furnitureData.title;
      }
      
      public function get gridItem() : PrizeGridItem
      {
         return var_2210;
      }
      
      public function setIcon(param1:IRoomEngine) : void
      {
         initProductIcon(param1,_furnitureData.type,var_1428);
      }
      
      public function get productItemTypeId() : int
      {
         return var_1428;
      }
   }
}
