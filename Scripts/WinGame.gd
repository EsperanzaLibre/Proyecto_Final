extends Node2D

onready var player = $Player
var animationTitulo = true

func _physics_process(delta):
	animation()
	
func animation():
	$AnimationPrincess.play("idle-princess")
	
	if player.position.x > 782:
		$AnimationPlayer.play("player-movement")
		if animationTitulo:
			$AnimationTitulo.play("anim-titulo")
			$AnimationDialogo.play("dialogo_visible")
			animationTitulo = false
	else:
		$AnimationPlayer.play("walk-player")
