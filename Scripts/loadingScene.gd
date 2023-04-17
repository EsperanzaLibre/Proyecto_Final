extends Node
var loading_scene_menu = "res://Scenes/Levels/Level"+str(Global.level_number)+".tscn"#guardamos escena
var load_time = 3 #determinamos tiempo de duracion de la barra de progreso
onready var tween = $Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	tween.interpolate_property($ProgressBar,"value",0,100,load_time,Tween.TRANS_LINEAR,Tween.EASE_OUT)
	tween.start()

func _on_Tween_tween_all_completed():
	print(loading_scene_menu)
	print(Global.level_number)
	if loading_scene_menu != null:#en caso que sea null la escena determinada en esta variable aparece esta escena
		if Global.level_number < 5:
			get_tree().change_scene(loading_scene_menu)
			Global.level_number+=1
			Global.timer_pause = false
		else:
			get_tree().change_scene("res://Scenes/WinGame.tscn") #cargo la escena de ganador
	else:
		print("Error al cargar el nivel")
