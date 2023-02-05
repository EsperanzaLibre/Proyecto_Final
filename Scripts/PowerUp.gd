extends Area2D

#export (int) var powerUpType

#onready var sprite = $AnimationPlayer/Sprite

func _ready():
	#sprite.frame = 0 #selecciono el frame a mostrar
	pass

func _on_PowerUp_body_entered(body):
	if body.is_in_group("Player"): #si el body es el player se destruye
		Global.player_life = 200
		#crear variable global para la vida del player
		Global._on_CreateFloatingTextButtonGlobal("LIFE!!!", position.x, position.y, 3, 1.0)
		queue_free()
