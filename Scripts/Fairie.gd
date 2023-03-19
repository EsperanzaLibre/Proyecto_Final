extends KinematicBody2D

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite
onready var floorDetection = $Sprite/floorDetection

const MAX_SPEED : float = 60.0
const GRAVITY : float = 25.0

var motion := Vector2()

func _ready():
	animationPlayer.play("idle")
	sprite.scale.x = 1
	motion.x = MAX_SPEED
	
func _physics_process(_delta):
	if !floorDetection.is_colliding():
		motion.x *= -1
		controlDirecction()
	else:
		motion = move_and_slide(motion)

func controlDirecction():
	#funcion que orienta el sprite para donde se mueve el enemigo
	#y tambien lo orienta para donde debe lanzar el golpe
	if motion.x < 0:
		sprite.scale.x = -1
	else:
		sprite.scale.x = 1
