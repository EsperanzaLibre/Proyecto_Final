extends Area2D
#Escena que contiene la puerta de acceso a las trivias y de vuelta
#al escenario de donde venimos

onready var sprite = $Sprite
export(String, FILE) var next_scene_path = ""
export(Vector2) var player_spawn_location = Vector2.ZERO
export(int) var player_direction = 1
export (int) var doorType
var floaty_text_scene = preload("res://Scenes/FloatingText.tscn")
var hero_body = null

func _ready():
	sprite.frame = doorType #selecciono el frame a mostrar
	
func _physics_process(delta):
	if hero_body != null && Input.is_action_pressed("ui_up"):#si colisiono con el player entro al if
		#print(Global.trivia_check) #debug
		if Global.trivia_check == false: #pregunto si ya ingreso al hall de la trivia
			if Global.scene_to_back == "": #pregunto si la escena a volver esta vacia
				print("Entra al Hall de la trivia")
				print(Global.scene_to_back)
				Global.timer_pause = true #cuando ingresa al hall detengo el tiempo
				Global.player_door_map_position = self.global_position #tomo la posicion global de la puerta en el lvl
				Global.player_door_map_position.x += 40 #offset para que no salga encima de la puerta
				Global.player_initial_map_position = player_spawn_location #le paso la posicion al player
				Global.player_facing_direction = player_direction #le paso la direcion de flip
				Global.scene_to_back = "res://Scenes/Levels/"+get_tree().get_current_scene().get_name()+".tscn" #cargo la escena a donde debe regresar
				get_tree().change_scene(next_scene_path) #cambio de escena
			else:
				print("Sale del hall de la trivia")
				Global.show_text = true
				print(Global.scene_to_back)
				Global.player_initial_map_position = Global.player_door_map_position #asigno la posicion de la puerta al player
				get_tree().change_scene(Global.scene_to_back) #regreso a la escena anterior
				Global.trivia_check = true #cambio a true para que no intente entrar nuevamente
				Global.scene_to_back = "" #Libero la variable global
		else:
			if Global.show_text:
				Global._on_CreateFloatingTextButtonGlobal("Ya entro al hall en este nivel", position.x, position.y, 5, 3.0)
				Global.show_text = false

func _on_Door_body_entered(body):
	if body.is_in_group("Player"): #si el body esta en el grupo player entro al if
		hero_body = body
		print("Entra a la colision")

func _on_Door_body_exited(body):
		print("Sale de la colision")
		hero_body = null
