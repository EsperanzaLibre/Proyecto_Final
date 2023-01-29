extends Node2D

onready var player = $Player
onready var levelInfo = $LevelInfo

func _save_data():
	#funcion que guarda la info del player en el nivel
	var data = levelInfo.get_data("PlayerInfo")#+levelName)#persisto la info del level
	data["PlayerInfo"] = {
		"Level": player.get_parent().name,
		"PosX" : player.position.x,
		"PosY" : player.position.y
	}
	levelInfo.save_data("PlayerInfo")#+levelName)
	
func _load_data():
	#funcion que carga la info del player del nivel
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


