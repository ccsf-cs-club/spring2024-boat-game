extends Camera2D
class_name Camera

@export var base_width : float = 1920

func _ready():
	adjust_camera_zoom()
	# getting viewport and connecting to size_changed signal!!!
	# Calls our function when signal emits something!
	get_viewport().size_changed.connect(adjust_camera_zoom)

func adjust_camera_zoom():
	var current_width : float = get_viewport().size.x
	var zoom_factor : float = current_width / base_width
	zoom = 4 * Vector2(zoom_factor, zoom_factor)
	# print(current_width, " ", zoom)

func _input(event:InputEvent):
	if Input.is_action_pressed("SCROLL_UP"):
		base_width /= 1.1
	
	if Input.is_action_pressed("SCROLL_DOWN"):
		base_width *= 1.1
	
	adjust_camera_zoom()

