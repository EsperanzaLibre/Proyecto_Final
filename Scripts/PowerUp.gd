extends Area2D

#export (int) var powerUpType

#onready var sprite = $AnimationPlayer/Sprite

var floaty_text_scene = preload("res://Scenes/FloatingText.tscn")
func _ready():
	#sprite.frame = 0 #selecciono el frame a mostrar
	pass

func _on_PowerUp_body_entered(body):
	if body.is_in_group("Player"): #si el body es el player se destruye
		Global.player_life = 200
		#Global.player_max_life = body.playerLife
		#crear variable global para la vida del player
		_on_CreateFloatingTextButton("LIFE!!!", position.x, position.y)
		queue_free()

func _on_CreateFloatingTextButton(text, x, y): #texto flotante para mostrar los diferentes mensajes
	var floaty_text = floaty_text_scene.instance()
	
	floaty_text.typeText = 3 #color del texto
	floaty_text.position = Vector2(x, y) #posiciona el texto flotante donde esta el nodo generador
	floaty_text.velocity = Vector2(rand_range(-50, 50), -100) #velocidad de movimiento
	floaty_text.modulate = Color(rand_range(0.7, 1), rand_range(0.7, 1), rand_range(0.7, 1), 1.0)
	
	floaty_text.text = text #texto a mostrar
		
	get_parent().add_child(floaty_text)
