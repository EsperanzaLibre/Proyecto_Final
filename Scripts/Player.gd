extends KinematicBody2D

export (PackedScene) var Hit = preload("res://Scenes/Hit.tscn")#traigo la escena del golpe

export var hitTime = 2.0 #tiempo por disparo
export var hitWait = 0.5 #tiempo de espera hasta el proximo disparo

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer
onready var flashTimer = $FlashTimer
onready var dust = $Dust

const moveSpeed = 70
const maxSpeed = 220

const jumpHeight = 320
const gravity = 22
const up = Vector2(0,-1)

var maxJump = 2 #saltos permitidos
var jump = 0 #contador de saltos
var onFloor = true #control si toca el piso
var jumpDouble = 520 
var hitDirecction = 1
var hitType = 9
var idleSide = 2 #variable para determinar donde debe mirar en idle y para ver donde sale el disparo
var playerCollision = false
var motion = Vector2.ZERO
var run_control = 0

func _ready():
	#comienzo el juego con una animacion intro
	#no es requerido pero es para probar las funcionalidades
	animationPlayer.play("idle")
	dust.gravity.y = gravity
	
	self.global_position = Global.player_initial_map_position
	if Global.player_facing_direction == 1:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	
	if Global.triviaCorrectAnswers >= 3:
		sprite.texture = ResourceLoader.load("res://Assets/hero_power_up.png")
	else:
		sprite.texture = ResourceLoader.load("res://Assets/hero.png")

func _physics_process(delta):
	if Global.checkDialog < 1:
		powerUp()
		_move()
		_jump()
		hitTime += delta
	motion = move_and_slide(motion,up)
	
func _move():
	#funcion que procesa el movimiento del personaje
	#en cada if pregunto si esta en el piso o no para poder
	#presentar la animacion correcta
	
	motion.y += gravity #fuerza que nos atrae hacia abajo
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = false
		if is_on_floor():
			if run_control > 5:
				Global.fx($Sounds/HeroRun)
				run_control = 0
			run_control += 0.1	
			animationPlayer.play("run")
		else:
			animationPlayer.play("jump")
		motion.x = min(motion.x + moveSpeed, maxSpeed)
		idleSide = 2
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = true
		if is_on_floor():
			if run_control > 5:
				Global.fx($Sounds/HeroRun)
				run_control = 0
			run_control += 0.1	
			animationPlayer.play("run")
		else:
			animationPlayer.play("jump")
		motion.x = max(motion.x - moveSpeed, -maxSpeed)
		idleSide = 1
	elif Input.is_action_pressed("ui_shoot"):
		if is_on_floor():
			animationPlayer.animation_set_next("idle","attack")
			animationPlayer.play("attack")
		else:
			animationPlayer.play("jump")
	else:
		motion.x=0
		var currentAnimation = animationPlayer.current_animation
		match currentAnimation: #utilizo un match para determinar y esperar que las animaciones terminen
				"power": pass
				"attack": pass
				_:
					if is_on_floor():
						animationPlayer.play("idle")
					else:
						animationPlayer.play("jump")
	
func hit(): #funcion que controla el golpe
	if (hitTime >= hitWait):
		Global.fx($Sounds/AttackFx)
		var hit_instance = Hit.instance()
		hitTime = 0
		match hitDirecction: #genero el golpe fuera del player para no colisionar
			1:hit_instance.position = Vector2(position.x - 30,position.y)
			2:hit_instance.position = Vector2(position.x + 30,position.y)
		
		hit_instance.objectToKill = 2 #objetivo enemigo
		hit_instance.hitDirection = hitDirecction
		hit_instance.hitType = hitType
		
		get_parent().add_child(hit_instance)
		
func _unhandled_input(event): #si golpeo tomo la posicion en la que mira el player
	if event.is_action_pressed("ui_shoot"):
		hitDirecction=idleSide
		hit()
		
func _jump():
	if is_on_floor():
		jump = 0
		onFloor = true
		
	if Input.is_action_just_pressed("ui_jump") && jump < maxJump:
		onFloor = false
		if jump == 0:
			#animacion de salto simple
			Global.fx($Sounds/HeroJump)
			dust.emitting = true
			motion.y -= jumpHeight
			jump +=1
		elif jump==1:
			#animacion de salto doble
			motion.y -= jumpDouble
			jump +=1
			
func enemyDamage(damage): #daño recibido por parte de los enemigos o armas
	if damage==0:
		Global._on_CreateFloatingTextButtonGlobal("Miss", position.x, position.y, 2, 1.0)
	else:
		if Global.player_life > 0: #si es mas de cero le resto vida
			flickerFlash()
			Global._on_CreateFloatingTextButtonGlobal("Damage - " + str(damage), position.x, position.y, 2, 1.0)
			Global.player_life -= damage
			Global.fx($Sounds/HeroHurt)
			print(Global.player_life)

		if Global.player_life <= 0: #vuelvo a preguntar por si en el golpe anterior lo mata
			Global.gameFinalCondition = 2
			get_tree().change_scene("res://Scenes/EndGame.tscn")
			queue_free()

func flickerFlash(): #cuando se llama esta func se dispara el timer
	sprite.material.set_shader_param("flashModifier",1)
	sprite.material.set_shader_param("changeSprite",true)
	playerCollision = true
	flashTimer.start()

func _on_FlashTimer_timeout():
	sprite.material.set_shader_param("flashModifier",0)
	sprite.material.set_shader_param("changeSprite",false)
	playerCollision = false

func _on_PlayerBody_body_entered(body):
	if body.is_in_group("Enemies"):
		if !playerCollision: #si recibio un golpe recientemente espera un rato
			enemyDamage(body.enemyDamage)

func _on_PlayerBody_area_entered(area):
	if area.is_in_group("Hit"): #pregunto si lo que entra en el area es un shuriken
		if !playerCollision: #si recibio un golpe recientemente espera un rato
			enemyDamage(area.hitDamage)

func powerUp(): #cuando el heroe alcanza las 3 respuestas correctas obtiene el power up
	if Global.triviaCorrectAnswers == 3:
		sprite.texture = ResourceLoader.load("res://Assets/hero_power_up.png")
		animationPlayer.play("power")
		yield(animationPlayer,"animation_finished")
		animationPlayer.stop()
		animationPlayer.play("idle")
