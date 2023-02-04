tool
#El cambio de escena se hace gracias a este tutorial
#https://www.youtube.com/watch?v=tp1OiUEq3Pk

extends Area2D

export(String, FILE) var next_scene_path = ""
export(Vector2) var player_spawn_location = Vector2.ZERO
export(int) var player_direction


func _get_configuration_warning() -> String:
	if next_scene_path == "":
		return "Advertencia: next_scene_path debe estar configurada para que funcione el portal"
	else:
		return ""

func _on_Portal_body_entered(body):
	Global.player_initial_map_position = player_spawn_location
	Global.player_facing_direction = player_direction
	Global.triviaCorrectAnswers = 0 #vuelvo a cero el contador de respuestas correctas
	Global.enemyScoreCounter = 0
	Global.trivia_check = false
	Global.timer_min=5
	Global.timer_sec=0
	Global.timer_mil=0
	if get_tree().change_scene(next_scene_path) != OK:
		print ("Error: La escena no se pudo cargar")
		
