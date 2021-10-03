package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_594:String = "Rectangle";
      
      public static const const_58:String = "Boolean";
      
      public static const const_612:String = "Number";
      
      public static const const_83:String = "int";
      
      public static const const_222:String = "String";
      
      public static const const_498:String = "Point";
      
      public static const const_939:String = "Array";
      
      public static const const_1201:String = "uint";
      
      public static const const_348:String = "hex";
      
      public static const const_860:String = "Map";
       
      
      private var var_538:String;
      
      private var var_173:Object;
      
      private var var_2191:Boolean;
      
      private var _type:String;
      
      private var var_1916:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         var_538 = param1;
         var_173 = param2;
         _type = param3;
         var_1916 = param4;
         var_2191 = param3 == const_860 || param3 == const_939 || param3 == const_498 || param3 == const_594;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function toString() : String
      {
         switch(_type)
         {
            case const_348:
               return "0x" + uint(var_173).toString(16);
            case const_58:
               return Boolean(var_173) == true ? "true" : "HabboNavigatorCom_hh_room_floatinggarden_png";
            case const_498:
               return "Point(" + Point(var_173).x + ", " + Point(var_173).y + ")";
            case const_594:
               return "Rectangle(" + Rectangle(var_173).x + ", " + Rectangle(var_173).y + ", " + Rectangle(var_173).width + ", " + Rectangle(var_173).height + ")";
            default:
               return String(value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(_type)
         {
            case const_860:
               _loc3_ = var_173 as Map;
               _loc1_ = "<var key=\"" + var_538 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_939:
               _loc4_ = var_173 as Array;
               _loc1_ = "<var key=\"" + var_538 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_498:
               _loc5_ = var_173 as Point;
               _loc1_ = "<var key=\"" + var_538 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_83 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_83 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_594:
               _loc6_ = var_173 as Rectangle;
               _loc1_ = "<var key=\"" + var_538 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_83 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_83 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_83 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_83 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_348:
               _loc1_ = "<var key=\"" + var_538 + "\" value=\"" + "0x" + uint(var_173).toString(16) + "\" type=\"" + _type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + var_538 + "\" value=\"" + var_173 + "\" type=\"" + _type + "\" />";
         }
         return _loc1_;
      }
      
      public function get value() : Object
      {
         return var_173;
      }
      
      public function get valid() : Boolean
      {
         return var_1916;
      }
      
      public function get key() : String
      {
         return var_538;
      }
   }
}
