package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_1059:int = 0;
       
      
      private var var_78:Vector3d;
      
      private var _updateID:uint;
      
      private var _type:String = "";
      
      private var _visualization:IRoomObjectVisualization;
      
      private var var_91:RoomObjectModel;
      
      private var var_358:IRoomObjectEventHandler;
      
      private var var_1301:Vector3d;
      
      private var var_1586:int = 0;
      
      private var _id:int;
      
      private var var_1302:Vector3d;
      
      private var var_218:Vector3d;
      
      private var var_419:Array;
      
      public function RoomObject(param1:int, param2:uint)
      {
         super();
         _id = param1;
         var_78 = new Vector3d();
         var_218 = new Vector3d();
         var_1301 = new Vector3d();
         var_1302 = new Vector3d();
         var_419 = new Array(param2);
         var _loc3_:Number = param2 - 1;
         while(_loc3_ >= 0)
         {
            var_419[_loc3_] = 0;
            _loc3_--;
         }
         var_91 = new RoomObjectModel();
         _visualization = null;
         var_358 = null;
         _updateID = 0;
         var_1586 = var_1059++;
      }
      
      public function getInstanceId() : int
      {
         return var_1586;
      }
      
      public function getId() : int
      {
         return _id;
      }
      
      public function getUpdateID() : uint
      {
         return _updateID;
      }
      
      public function dispose() : void
      {
         var_78 = null;
         var_218 = null;
         if(var_91 != null)
         {
            var_91.dispose();
            var_91 = null;
         }
         var_419 = null;
         setVisualization(null);
         setEventHandler(null);
      }
      
      public function getType() : String
      {
         return _type;
      }
      
      public function getLocation() : IVector3d
      {
         var_1301.assign(var_78);
         return var_1301;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_78.x != param1.x || var_78.y != param1.y || var_78.z != param1.z)
         {
            var_78.x = param1.x;
            var_78.y = param1.y;
            var_78.z = param1.z;
            ++_updateID;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_218.x != param1.x || var_218.y != param1.y || var_218.z != param1.z)
         {
            var_218.x = (param1.x % 360 + 360) % 360;
            var_218.y = (param1.y % 360 + 360) % 360;
            var_218.z = (param1.z % 360 + 360) % 360;
            ++_updateID;
         }
      }
      
      public function setType(param1:String) : void
      {
         _type = param1;
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return var_358;
      }
      
      public function getDirection() : IVector3d
      {
         var_1302.assign(var_218);
         return var_1302;
      }
      
      public function setState(param1:int, param2:uint) : Boolean
      {
         if(param2 < var_419.length)
         {
            if(var_419[param2] != param1)
            {
               var_419[param2] = param1;
               ++_updateID;
            }
            return true;
         }
         return false;
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == var_358)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = var_358;
         if(_loc2_ != null)
         {
            var_358 = null;
            _loc2_.object = null;
         }
         var_358 = param1;
         if(var_358 != null)
         {
            var_358.object = this;
         }
      }
      
      public function getState(param1:uint) : int
      {
         if(param1 < var_419.length)
         {
            return var_419[param1];
         }
         return -1;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != _visualization)
         {
            if(_visualization != null)
            {
               _visualization.dispose();
            }
            _visualization = param1;
            if(_visualization != null)
            {
               _visualization.object = this;
            }
         }
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return _visualization;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return var_91;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return var_91;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return getEventHandler();
      }
   }
}
