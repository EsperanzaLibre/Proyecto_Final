extends Node2D

onready var player_life_bar = $ParallaxBackground/Hud/HeroIcon/HeroLifeBar
onready var enemy_score = $ParallaxBackground/Hud/EnemyScore/Score

func _ready():
	player_life_bar.max_value = Global.player_max_life #configuro la vida maxima posible
	if Global.timer_pause == false: #si es falso el nivel inicia
		Global.player_life = Global.player_max_life
	else:
		Global.timer_pause = false #si es verdadero el nivel viene de la trivia
	#player_life_bar.value = Global.player_life #configuro la vida maxima al iniciar
	#enemy_score.sel_text(Global.enemyScoreCounter) #actualizo el score del player

func _process(delta):
	player_life_bar.value = Global.player_life
	enemy_score.set_text(str(Global.enemyScoreCounter)) #actualizo el score del player
	if !Global.timer: #vuelvo a preguntar por si en el golpe anterior lo mata
			Global.gameFinalCondition = 2
			get_tree().change_scene("res://Scenes/EndGame.tscn")
			queue_free()
