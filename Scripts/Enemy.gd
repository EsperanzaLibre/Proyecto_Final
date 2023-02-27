extends KinematicBody2D

export (PackedScene) var Hit = preload("res://Scenes/Hit.tscn")#traigo la escena del golpe

const MAX_SPEED : float = 60.0
const GRAVITY : float = 25.0

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite
onready var animationTime = $AnimationTime
onready var lifeBar = $LifeBar
onready var flashTimer = $FlashTimer
onready var enemyName = $EnemyName

export var hitTime = 3.0 #tiempo por golpe
export var hitWait = 1.0 #tiempo de espera hasta el proximo golpe

export var waitTime = 2 #tiempo de espera para seguir moviendose
export var maxFlips = 5 #cantidad de rebotes que hace antes de esperar
export var enemyType = 0 #Tipo de enemigo

var rng = RandomNumberGenerator.new()
var distance = 120 # Distancia entre el enemigo y el player
var counterFlips = 0 #contador de flips
var motion := Vector2()
var controlTime = true #controlo el nodo timer
var canMove = true #variable que determina si el enemigo se puede mover

var hitDirecction = 1
var hitType = 0 #selecciono el tipo de golpe va a dar
var hitAnim = 0 #selecciono el tipo de animacion del golpe, 0 default
var idleSide = 2 #variable para determinar donde debe mirar en idle y para ver donde sale el disparo
var target #nodo player
var enemyDamage #tipo de daño que causa al player
var enemyLife = 100 #vida del enemigo
var enemyScore = 0 #puntaje del enemigo
var enemyDamageCritic = 1 #golpe critico


func _ready():
	rng.randomize()
	selectEnemyType(enemyType)
	animationPlayer.play("walk")
	sprite.scale.x = 1
	motion.x = MAX_SPEED
	lifeBar.max_value = enemyLife #configuro la vida maxima posible
	lifeBar.value = enemyLife #configuro la vida maxima al iniciar
	
func _physics_process(_delta):
	motion.y += GRAVITY
	hitTime += _delta
	_move(canMove)
	
func _next_to_left_wall() -> bool:
	return $leftRay.is_colliding()

func _next_to_right_wall() -> bool:
	return $rightRay.is_colliding()

func _floor_detection() -> bool:
	return $Sprite/floorDetection.is_colliding()

func _flip():
	counterFlips += 1
	motion.x *= -1
	controlDirecction()

func _move(canMove):
	if canMove:
		if !_floor_detection():
			_flip()
		if counterFlips > maxFlips:
			motion.x = 0
			counterFlips = 0
			animationPlayer.play("idle")
			controlTime = true
			animationTime.start()
		else:
			motion = move_and_slide(motion)
	else:
		motion.x = 0
		if target != null:
			hit()
	
func _on_PlayerDetector_body_entered(body):
	#funcion que detecta al player cuando se acerca al enemigo
	#y dependiendo por donde se acerque hace que el enemigo se gire
	#si es necesario
	
	if body.is_in_group("Player"):
		if ((body.position.x - position.x) < 0) && (hitDirecction==2):
			_flip()
		elif ((body.position.x - position.x) > 0) && (hitDirecction==1):
			_flip()
			
		target = body
		canMove = false

func _on_AnimationTime_timeout():
	if controlTime:
		controlTime=false
		animationPlayer.play("walk")
		motion.x = MAX_SPEED
		controlDirecction()

func _on_PlayerDetector_body_exited(body):
	if !canMove:
		canMove = true
		animationPlayer.play("walk")
		motion.x = MAX_SPEED
		controlDirecction()

	if body.is_in_group("Player"):
		target = null

func controlDirecction():
	#funcion que orienta el sprite para donde se mueve el enemigo
	#y tambien lo orienta para donde debe lanzar el golpe
	if motion.x < 0:
		sprite.scale.x = -1
		hitDirecction = 1 #move_left
	else:
		sprite.scale.x = 1
		hitDirecction = 2 #move_right

func selectEnemyType(enemyType):
	#Funcion que selecciona el tipo de enemigo y carga su vida, ataque,
	#nombre a mostrar y vida
	#Los enemigos estan ordenados alfabeticamente por sus 
	#nombres de archivos .tscn, no por categoria o nivel
	
	match enemyType:
		0: pass #no hay enemigo
		1: #EnemyAmazon.tscn
			$EnemyName.text = "Amazon"
			hitType = 1
			hitAnim = 2
			enemyDamage = 20 
			enemyLife = 100
			enemyScore = 10
		2: #EnemyFireWorm.tscn
			$EnemyName.text = "Fire Worm"
			hitType = 2
			enemyDamage = 30
			enemyLife = 150
			enemyScore = 20
		3: #EnemyFlyingEye.tscn
			$EnemyName.text = "Flying Eye"
			hitType = 1
			hitAnim = 3
			enemyDamage = 40
			enemyLife = 200
			enemyScore = 30
		4: #EnemyGoblin.tscn
			$EnemyName.text = "Goblin Bandit"
			hitType = 2
			enemyDamage = 50
			enemyLife = 300
			enemyScore = 40
		5: #EnemyHero.tscn
			$EnemyName.text = "Dark Hero"
			hitType = 3
			enemyDamage = 60
			enemyLife = 400
			enemyScore = 50
		6: #EnemyHuntress.tscn
			$EnemyName.text = "Huntress"
			hitType = 0 #el ataque del jefe es aleatorio entre todos los tipos
			hitAnim = 1
			enemyDamage = 70
			enemyLife = 600
			enemyScore = 60
		7: #EnemyKing.tscn
			$EnemyName.text = "King Lean"
			hitType = 0 #el ataque del jefe es aleatorio entre todos los tipos
			enemyDamage = 70
			enemyLife = 600
			enemyScore = 70
		8: #EnemyMage.tscn
			$EnemyName.text = "Infernalist"
			hitType = 0 #el ataque del jefe es aleatorio entre todos los tipos
			enemyDamage = 70
			enemyLife = 600
			enemyScore = 80
		9: #EnemyMageBoss.tscn
			$EnemyName.text = "Necromancer Mage"
			hitType = 0 #el ataque del jefe es aleatorio entre todos los tipos
			enemyDamage = 70
			enemyLife = 600
			enemyScore = 90
		10: #EnemyMushroom.tscn
			$EnemyName.text = "Psico Mushroom"
			hitType = 0 #el ataque del jefe es aleatorio entre todos los tipos
			hitAnim = 4
			enemyDamage = 70
			enemyLife = 600
			enemyScore = 100
		11: #EnemySamurai.tscn
			$EnemyName.text = "Samurai"
			hitType = 0 #el ataque del jefe es aleatorio entre todos los tipos
			enemyDamage = 70
			enemyLife = 600
			enemyScore = 110
		12: #EnemyShogun.tscn
			$EnemyName.text = "Shogun"
			hitType = 0 #el ataque del jefe es aleatorio entre todos los tipos
			enemyDamage = 70
			enemyLife = 600
			enemyScore = 120
		13: #EnemySkeleton.tscn
			$EnemyName.text = "Skeleton Warrior"
			hitType = 0 #el ataque del jefe es aleatorio entre todos los tipos
			enemyDamage = 70
			enemyLife = 600
			enemyScore = 130
		14: #EnemyWarrior.tscn
			$EnemyName.text = "Renegade Knight"
			hitType = 0 #el ataque del jefe es aleatorio entre todos los tipos
			enemyDamage = 70
			enemyLife = 600
			enemyScore = 140
		15: #EnemyWizard.tscn
			$EnemyName.text = "Shadow Pupil"
			hitType = 0 #el ataque del jefe es aleatorio entre todos los tipos
			enemyDamage = 70
			enemyLife = 600
			enemyScore = 150

func _on_FlashTimer_timeout():
	sprite.material.set_shader_param("flashModifier",0)
	sprite.material.set_shader_param("changeSprite",false)


func _on_EnemyBody_area_entered(area):
	if area.is_in_group("Hit"): #si el body es el golpe muere el enemigo
		Global.fx($EnemyHurt)
		
		if enemyLife > 0: #si es mas de cero le resto vida
			enemyLife -= area.hitDamage
			Global._on_CreateFloatingTextButtonGlobal("Damage -" + str(area.hitDamage), position.x, position.y, 1, 1.0)
			flickerFlash()
			lifeBar.value = enemyLife
		
		if enemyLife <= 0: #vuelvo a preguntar por si en el golpe anterior lo mata
			queue_free()
			area.queue_free()
			Global.enemyScoreCounter += enemyScore #sumo el puntaje
		#	if enemyType == 6:
		#		Global.gameFinalCondition = 1
		#		get_tree().change_scene("res://scenes/EndGame.tscn")
				
				
func hit(): 
	#funcion que controla el golpe, indica para que lado debe mirar para atacar
	#instancia el golpe pasando como parametros el lado del ataque, a quien debe dañar
	#y que tipo de golpe es
	
	if (hitTime >= hitWait):
		var hit_instance = Hit.instance()
		hit_instance.hitAnim = hitAnim
		hitTime = 0

		enemyDamageCritic = rng.randi() % 10 #solo se permite un 10% de ataques criticos
		print(enemyDamageCritic)
		if enemyDamageCritic >= 1:
			if hitAnim < 1:#consulto si es golpe a distancia
				animationPlayer.play("attack1")
			else:
				animationPlayer.play("attack3")
				
			hit_instance.hitDamageCritic = false
		else:
			Global._on_CreateFloatingTextButtonGlobal("CRITIC!!!", position.x - 30, position.y - 30, 5, 1.0)
			animationPlayer.play("attack2")
			hit_instance.hitDamageCritic = true
			
		match hitDirecction: #genero el shuriken fuera del player para no colisionar
			1:hit_instance.position = Vector2(position.x - 30,position.y)
			2:hit_instance.position = Vector2(position.x + 30,position.y)
		
		hit_instance.objectToKill = 2 #objetivo enemigo
		hit_instance.hitDirection = hitDirecction
		hit_instance.hitType = hitType
		
		
		get_parent().add_child(hit_instance)
		
func flickerFlash():
	sprite.material.set_shader_param("flashModifier",1)
	sprite.material.set_shader_param("changeSprite",true)
	flashTimer.start()
