package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_89;
         param1["bound_to_parent_rect"] = const_78;
         param1["child_window"] = const_930;
         param1["embedded_controller"] = const_284;
         param1["resize_to_accommodate_children"] = const_57;
         param1["input_event_processor"] = const_45;
         param1["internal_event_handling"] = const_642;
         param1["mouse_dragging_target"] = const_194;
         param1["mouse_dragging_trigger"] = const_325;
         param1["mouse_scaling_target"] = const_228;
         param1["mouse_scaling_trigger"] = const_383;
         param1["horizontal_mouse_scaling_trigger"] = const_199;
         param1["vertical_mouse_scaling_trigger"] = const_182;
         param1["observe_parent_input_events"] = const_831;
         param1["optimize_region_to_layout_size"] = const_358;
         param1["parent_window"] = const_808;
         param1["relative_horizontal_scale_center"] = const_164;
         param1["relative_horizontal_scale_fixed"] = const_120;
         param1["relative_horizontal_scale_move"] = const_277;
         param1["relative_horizontal_scale_strech"] = const_231;
         param1["relative_scale_center"] = const_862;
         param1["relative_scale_fixed"] = const_561;
         param1["relative_scale_move"] = const_971;
         param1["relative_scale_strech"] = const_865;
         param1["relative_vertical_scale_center"] = const_150;
         param1["relative_vertical_scale_fixed"] = const_107;
         param1["relative_vertical_scale_move"] = const_327;
         param1["relative_vertical_scale_strech"] = const_226;
         param1["on_resize_align_left"] = const_593;
         param1["on_resize_align_right"] = const_450;
         param1["on_resize_align_center"] = const_366;
         param1["on_resize_align_top"] = const_491;
         param1["on_resize_align_bottom"] = const_360;
         param1["on_resize_align_middle"] = const_468;
         param1["on_accommodate_align_left"] = const_867;
         param1["on_accommodate_align_right"] = const_344;
         param1["on_accommodate_align_center"] = const_672;
         param1["on_accommodate_align_top"] = const_933;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_722;
         param1["route_input_events_to_parent"] = const_393;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_910;
         param1["scalable_with_mouse"] = const_784;
         param1["reflect_horizontal_resize_to_parent"] = const_434;
         param1["reflect_vertical_resize_to_parent"] = const_470;
         param1["reflect_resize_to_parent"] = const_232;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
