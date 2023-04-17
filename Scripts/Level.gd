extends Node2D

onready var player_life_bar = $UI/Hud/HeroIcon/HeroLifeBar
onready var enemy_score = $UI/Hud/Score
onready var life_counter = $UI/Hud/LifeCounter
onready var area_dead = $Floor/AreaDead
onready var door = $Door
onready var ui = $UI
onready var dialog = $Dialog

func _ready():
	player_life_bar.max_value = Global.player_max_life #configuro la vida maxima posible
	if Global.timer_pause == false: #si es falso el nivel inicia
		print("Entra en ready false")
		Global.checkDialog = 3 #Valido para que desaparezcan los dialogo
		ui.visible=false
		dialog.visible = true
		Global.player_life = Global.player_max_life
		Global.bossDefeat = false #el level inicia con el jefe vivo
		Global.timer_min = 5 #si el level inicia se coloca el tiempo inicial
		Global.timer_sec = 0
		Global.timer_mil = 0
	else:
		print("Entra en ready true")
		ui.visible=true
		dialog.visible = false
		#Global.timer_pause = false #si es verdadero el nivel viene de la trivia		
		
func _process(delta):
	player_life_bar.value = Global.player_life
	Global.sounds($BkgMusic)
	if Global.checkDialog < 0:
		ui.visible=true
		dialog.visible = false
	if !Global.enemyScoreCounter==null:
		enemy_score.set_text("Score: "+str(Global.enemyScoreCounter)) #actualizo el score del player
		life_counter.set_text("Life: "+str(Global.lifes)) #actualizo las vidas del jugador
	if !Global.timer || Global.lifes == 0: #controlo que pueda seguir jugando
			Global.gameFinalCondition = 2
			get_tree().change_scene("res://Scenes/EndGame.tscn")
			queue_free()

func _on_AreaDead_body_entered(body):
	#Funcion que determina si el jugador cae, controla que tenga vidas y resta 1
	#y lo devuelve al inicio del mapa donde esta o al checkpoint alcanzado
	if body.is_in_group("Player"):
		Global.lifes -= 1 
		#Global.timer_pause = false
		get_tree().reload_current_scene()
		

