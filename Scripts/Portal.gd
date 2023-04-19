tool
#El cambio de escena se hace gracias a este tutorial
#https://www.youtube.com/watch?v=tp1OiUEq3Pk

extends Area2D

export(String, FILE) var next_scene_path = ""
export(Vector2) var player_spawn_location = Vector2.ZERO
export(int) var player_direction
var validateLevel = false #valido si el nivel se puede pasar

func _get_configuration_warning() -> String:
	if next_scene_path == "":
		return "Advertencia: next_scene_path debe estar configurada para que funcione el portal"
	else:
		return ""

func _on_Portal_body_entered(body):
	checkValidate()
	if validateLevel:
		changeLevel()
		
func checkValidate():
	if Global.enemyScoreCounter < 150:
		Global._on_CreateFloatingTextButtonGlobal("Necesitas mas puntos para pasar", position.x, position.y,6, 3.0)
		validateLevel = false
	elif !Global.bossDefeat:
		Global._on_CreateFloatingTextButtonGlobal("No has vencido al jefe del nivel", position.x, position.y,6, 3.0)
		validateLevel = false
	else:
		validateLevel = true
	
func changeLevel():
	Global.player_initial_map_position = player_spawn_location
	Global.player_facing_direction = player_direction
	Global.triviaCorrectAnswers = 0 #vuelvo a cero el contador de respuestas correctas
	Global.enemyScoreCounter = 0
	Global.trivia_check = false
	Global.checkDialog = 3 #Valido para que desaparezcan los dialogo
	Global.timer_min=5
	Global.timer_sec=0
	Global.timer_mil=0
	#Global.level_number += 1
	if get_tree().change_scene(next_scene_path) != OK:
		print ("Error: La escena no se pudo cargar")
