extends Node
#Para usar un script global se debe declarar en Configuracion de Proyecto->Autoload

var player_initial_map_position = Vector2(80, 460)
var player_door_map_position = Vector2.ZERO
var scene_to_back = ""
var player_facing_direction = 1 #orientacion del player
var gameFinalCondition = 1 #1 gana 2 pierde
var triviaCorrectAnswers = 0 #controlo que haya respondido bien la trivia para ganar el powerup
var player_life # vida actual del player
const player_max_life = 200 #vida maxima del player
var enemyScoreCounter = 0 #cuento cuantos puntos obtiene el player
var timer = true #variable que me indica si el tiempo de juego sigue activo
var timer_pause = false #variable para pausar el tiempo del juego
var timer_min=0 #variable que guarda el tiempo transcurrido en minutos
var timer_sec=0 #variable que guarda el tiempo transcurrido en segundos
var timer_mil=0 #variable que guarda el tiempo transcurrido en milisegundos
var trivia_check = false #variable que se usa para no permitir el acceso ilimitado al hall de la trivia

func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventKey and event.scancode == KEY_R:#si presiono R reinicio el juego
		get_tree().change_scene("res://Scenes/Levels/Level.tscn")
