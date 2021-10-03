package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_703;
         param1["bitmap"] = const_605;
         param1["border"] = const_613;
         param1["border_notify"] = const_1232;
         param1["button"] = const_458;
         param1["button_thick"] = const_629;
         param1["button_icon"] = const_1324;
         param1["button_group_left"] = const_581;
         param1["button_group_center"] = const_620;
         param1["button_group_right"] = const_515;
         param1["canvas"] = const_494;
         param1["checkbox"] = const_644;
         param1["closebutton"] = const_931;
         param1["container"] = const_312;
         param1["container_button"] = const_698;
         param1["display_object_wrapper"] = const_539;
         param1["dropmenu"] = const_403;
         param1["dropmenu_item"] = const_447;
         param1["frame"] = const_296;
         param1["frame_notify"] = const_1298;
         param1["header"] = const_721;
         param1["icon"] = const_840;
         param1["itemgrid"] = const_864;
         param1["itemgrid_horizontal"] = const_431;
         param1["itemgrid_vertical"] = const_682;
         param1["itemlist"] = const_866;
         param1["itemlist_horizontal"] = const_292;
         param1["itemlist_vertical"] = const_307;
         param1["maximizebox"] = const_1183;
         param1["menu"] = const_1223;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_932;
         param1["minimizebox"] = const_1160;
         param1["notify"] = const_1121;
         param1["null"] = const_376;
         param1["password"] = const_646;
         param1["radiobutton"] = const_633;
         param1["region"] = const_422;
         param1["restorebox"] = const_1111;
         param1["scaler"] = const_948;
         param1["scaler_horizontal"] = const_1287;
         param1["scaler_vertical"] = const_1262;
         param1["scrollbar_horizontal"] = const_357;
         param1["scrollbar_vertical"] = const_667;
         param1["scrollbar_slider_button_up"] = const_892;
         param1["scrollbar_slider_button_down"] = const_917;
         param1["scrollbar_slider_button_left"] = const_836;
         param1["scrollbar_slider_button_right"] = const_790;
         param1["scrollbar_slider_bar_horizontal"] = const_799;
         param1["scrollbar_slider_bar_vertical"] = const_913;
         param1["scrollbar_slider_track_horizontal"] = const_949;
         param1["scrollbar_slider_track_vertical"] = const_833;
         param1["scrollable_itemlist"] = const_1314;
         param1["scrollable_itemlist_vertical"] = const_350;
         param1["scrollable_itemlist_horizontal"] = const_977;
         param1["selector"] = const_495;
         param1["selector_list"] = const_519;
         param1["submenu"] = const_932;
         param1["tab_button"] = const_579;
         param1["tab_container_button"] = const_947;
         param1["tab_context"] = const_342;
         param1["tab_content"] = const_924;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_705;
         param1["input"] = const_657;
         param1["toolbar"] = const_1259;
         param1["tooltip"] = WINDOW_TYPE_TOOLTIP;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
