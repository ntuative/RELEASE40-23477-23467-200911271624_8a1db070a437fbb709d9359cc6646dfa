package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.logic.MovingObjectLogic;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import com.sulake.room.utils.XMLValidator;
   import flash.events.MouseEvent;
   
   public class FurnitureLogic extends MovingObjectLogic
   {
       
      
      private var var_869:Number = 0;
      
      private var var_578:Boolean = false;
      
      private var var_1510:Number = 0;
      
      private var var_1511:Number = 0;
      
      private var var_1037:Number = 0;
      
      private var var_867:Number = 0;
      
      private var var_868:Number = 0;
      
      private var var_221:Array;
      
      public function FurnitureLogic()
      {
         var_221 = [];
         super();
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc2_:IRoomObjectModelController = object.getModelController();
         var _loc3_:RoomObjectDataUpdateMessage = param1 as RoomObjectDataUpdateMessage;
         if(_loc3_ != null)
         {
            object.setState(_loc3_.state,0);
            if(_loc2_ != null)
            {
               _loc2_.setString(RoomObjectVariableEnum.const_128,_loc3_.data);
            }
            return;
         }
         var _loc4_:RoomObjectItemDataUpdateMessage = param1 as RoomObjectItemDataUpdateMessage;
         if(_loc4_ != null)
         {
            if(_loc2_ != null)
            {
               _loc2_.setString(RoomObjectVariableEnum.const_853,_loc4_.itemData);
            }
            return;
         }
         var_578 = false;
         super.processUpdateMessage(param1);
      }
      
      override public function initialize(param1:XML) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         if(param1 == null)
         {
            return;
         }
         var_867 = 0;
         var_868 = 0;
         var_869 = 0;
         var_221 = [];
         var _loc2_:XMLList = param1.model.dimensions;
         if(_loc2_.length() == 0)
         {
            return;
         }
         var _loc3_:XMLList = _loc2_.@x;
         if(_loc3_.length() == 1)
         {
            var_867 = Number(_loc3_);
         }
         _loc3_ = _loc2_.@y;
         if(_loc3_.length() == 1)
         {
            var_868 = Number(_loc3_);
         }
         _loc3_ = _loc2_.@z;
         if(_loc3_.length() == 1)
         {
            var_869 = Number(_loc3_);
         }
         var_1510 = var_867 / 2;
         var_1511 = var_868 / 2;
         _loc3_ = _loc2_.@centerZ;
         if(_loc3_.length() == 1)
         {
            var_1037 = Number(_loc3_);
         }
         else
         {
            var_1037 = var_869 / 2;
         }
         var _loc4_:XMLList = param1.model.directions.direction;
         var _loc5_:* = ["id"];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length())
         {
            _loc7_ = _loc4_[_loc6_];
            if(XMLValidator.checkRequiredAttributes(_loc7_,_loc5_))
            {
               _loc8_ = parseInt(_loc7_.@id);
               var_221.push(_loc8_);
            }
            _loc6_++;
         }
         var_221.sort(Array.NUMERIC);
         if(object == null || object.getModelController() == null)
         {
            return;
         }
         object.getModelController().setNumber(RoomObjectVariableEnum.const_272,var_867,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_449,var_868,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_617,var_869,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_1245,var_1510,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_1243,var_1511,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_970,var_1037,true);
         object.getModelController().setNumberArray(RoomObjectVariableEnum.const_691,var_221,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_161,1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_221 = null;
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(object == null)
         {
            return;
         }
         var _loc3_:* = null;
         switch(param1.type)
         {
            case MouseEvent.ROLL_OVER:
               if(!var_578)
               {
                  _loc3_ = object.getModel() as IRoomObjectModelController;
                  if(_loc3_ == null)
                  {
                     return;
                  }
                  _loc9_ = _loc3_.getString(RoomObjectVariableEnum.const_209);
                  if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
                  {
                     eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_275,_loc6_,_loc7_));
                  }
                  var_578 = true;
               }
               break;
            case MouseEvent.ROLL_OUT:
               if(var_578)
               {
                  _loc3_ = object.getModel() as IRoomObjectModelController;
                  if(_loc3_ == null)
                  {
                     return;
                  }
                  _loc9_ = _loc3_.getString(RoomObjectVariableEnum.const_209);
                  if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
                  {
                     eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_281,_loc6_,_loc7_));
                  }
                  var_578 = false;
               }
               break;
            case MouseEvent.DOUBLE_CLICK:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               _loc3_ = object.getModel() as IRoomObjectModelController;
               if(_loc3_ == null)
               {
                  return;
               }
               _loc9_ = _loc3_.getString(RoomObjectVariableEnum.const_209);
               if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_459,_loc6_,_loc7_));
               }
            case MouseEvent.CLICK:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc8_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_217,_loc6_,_loc7_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc8_);
               }
               _loc3_ = object.getModel() as IRoomObjectModelController;
               if(_loc3_ == null)
               {
                  return;
               }
               _loc9_ = _loc3_.getString(RoomObjectVariableEnum.const_209);
               if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_220,_loc6_,_loc7_));
               }
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc8_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_436,_loc6_,_loc7_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc8_);
               }
         }
      }
   }
}
