if(match_pixel)
{
	var camera_id = view_camera[0];
	var view_width = camera_get_view_width(camera_id);
	var view_height = camera_get_view_height(camera_id);
	display_set_gui_size(view_width, view_height);
}