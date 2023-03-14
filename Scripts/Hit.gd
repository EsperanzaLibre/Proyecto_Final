extends Area2D

export var hitDestroy = 0.10 #tiempo en que se destruye el hit
export (int) var hitSpeed = 200 #velocidad del hit
export (int) var hitType = 0 #tipo de hit, si tiene power ups o no
export (int) var hitAnim = 0 #tipo de animacion del hit

onready var animationPlayer = $AnimationPlayer
onready var powerUp = $PowerUp
onready var bkgSound = $BkgSound

var rng = RandomNumberGenerator.new()
var objectToKill = 0 #configuro a quien debe destruir, 0 nadie 1 player 2 enemigos
var hitDirection = 0 #direccion del disparo
var hitDamage #daño base para todos los personajes
var hitDamageCritic = false #variable que indica si es un golpe critico
var hitPowerUp = false #variable que indica si esta el power up del player activo

func _ready():
	match hitAnim: 
	#selecciono que animacion muestro. 0 si no tiene animacion
	#tambien acomodo el tiempo de destruccion del hit
		0:	hitDestroy = 0.10
		1:
			print("arrow")
			$arrow.visible = true
			animationPlayer.play("arrow")
			hitDestroy = 1.0
			if hitDirection == 1: $arrow.flip_h = true
		2:
			$spear.visible = true
			animationPlayer.play("spear")
			hitDestroy = 1.0
			if hitDirection == 1: $spear.flip_h = true
		3:
			$flying_shoot.visible = true
			animationPlayer.play("flying_shoot")
			hitDestroy = 1.5
			if hitDirection == 1: $flying_shoot.flip_h = true
		4:
			$mush_shoot.visible = true
			animationPlayer.play("mush_shoot")
			hitDestroy = 1.5
			if hitDirection == 1: $mush_shoot.flip_h = true

	rng.randomize()
	hitPower(hitType)
	#if Global.fx:
	#	bkgSound.play()

func _physics_process(delta):
	match hitDirection: #elijo para donde va el hit
		1: position.x -= delta * hitSpeed
		2: position.x += delta * hitSpeed
	
	hitDestroy-=delta
	
	if hitDestroy<=0:
		queue_free()
		
func _on_hit_body_entered(body):
	if body.is_in_group("Player") && objectToKill == 1: #si el body es el player se destruye
		queue_free()
	elif body.is_in_group("Enemies") && objectToKill == 2: #si el body es enemigo se destruye
		queue_free()
	else: #si el body es otra cosa se destruye
		queue_free()

func hitPower(hitType):
	match hitType: #selecciono el tipo de daño segun el personaje en un rango determinado
		0: hitDamage = rng.randi_range(0,20)
		1: hitDamage = rng.randi_range(0,35)
		2: hitDamage = rng.randi_range(0,50) 
		3: hitDamage = rng.randi_range(0,65)
		4: hitDamage = rng.randi_range(0,80) 
		5: hitDamage = rng.randi_range(0,95) 
		6: hitDamage = rng.randi_range(0,110) 
		7: hitDamage = rng.randi_range(0,125) 
		8: hitDamage = rng.randi_range(0,150) 
		9: hitDamage = rng.randi_range(0,155)
		 
	if hitDamageCritic: #consulto si el golpe que viene es con critico
		hitDamage *= 2 #subo el golpe un 100%
		hitDamageCritic = false #desactivo el critico
		
	if hitPowerUp: #consulto si el golpe que viene es con power up
		hitDamage *= 1.5 #subo el golpe un 50%
		hitPowerUp = false #desactivo el power up

