tool
extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	_zoom_changed()

func _zoom_changed():
	material.set_shader_param("zoom", get_viewport().global_canvas_transform.y.y)

func _on_water_item_rect_changed():
	material.set_shader_param("scale", scale)
