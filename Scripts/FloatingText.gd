extends Position2D

#creditos:
#escena de texto flotante obtenida de
#https://github.com/johnnygossdev/tutorials/tree/master/floating-text
#aunque fue modificada la mayoría del codigo se mantiene original

onready var tween = $Tween

var velocity = Vector2(50, -100)
var gravity = Vector2(0, 1)
var mass = 200
var typeText
var time_to_show

var text setget set_text, get_text

func _ready():
	tween.interpolate_property(self, "modulate", 
		Color(modulate.r, modulate.g, modulate.b, modulate.a), 
		Color(modulate.r, modulate.g, modulate.b, 0.0),
		0.3, Tween.TRANS_LINEAR, Tween.EASE_OUT, 0.7)
	
	tween.interpolate_property(self, "scale", 
		Vector2(0, 0), 
		Vector2(2.0, 2.0),
		time_to_show/3, Tween.TRANS_QUART, Tween.EASE_OUT)
	
	tween.interpolate_property(self, "scale", 
		Vector2(2.0, 2.0), 
		Vector2(0.4, 0.4),
		time_to_show, Tween.TRANS_LINEAR, Tween.EASE_OUT, 0.6)
	
	match typeText: #opcion de cambio de color de fuente y borde de fuente
		1: 
			$Label.add_color_override("font_color", "1816f7")
			$Label.add_color_override("font_outline_modulate", "f7064f")
		2: 
			$Label.add_color_override("font_color", "f79a16")
			$Label.add_color_override("font_outline_modulate", "3bf706")
		3: 
			$Label.add_color_override("font_color", "2f9907")
			$Label.add_color_override("font_outline_modulate", "a606f7")
		4: 
			$Label.add_color_override("font_color", "da0909")
			$Label.add_color_override("font_outline_modulate", "443d8e")
		5: 
			$Label.add_color_override("font_color", "09dad1")
			$Label.add_color_override("font_outline_modulate", "090bda")
		
	tween.interpolate_callback(self, 1.0, "destroy")
	tween.start()

func _process(delta):
	velocity += gravity * mass * delta
	position +=  velocity * delta

func set_text(new_text):
	$Label.text = str(new_text)

func get_text():
	return $Label.text

func destroy():
	queue_free()

