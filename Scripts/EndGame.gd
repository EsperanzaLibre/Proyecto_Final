extends Node2D

onready var sprite = $Sprite
onready var label = $Control/Label
onready var musicCondition = $MusicCondition

# Called when the node enters the scene tree for the first time.
func _ready():
	if (Global.gameFinalCondition == 1):
		sprite.texture = ResourceLoader.load("res://Assets/win_image.png")
		label.text = "You Win!!!"
		musicCondition.stream = ResourceLoader.load("res://Assets/win_music.mp3")
		
	else:
		sprite.texture = ResourceLoader.load("res://Assets/lose_image.png")
		label.text = "You Lose!!!"
		musicCondition.stream = ResourceLoader.load("res://Assets/lose_music.ogg")

#	if Global.music:
#		musicCondition.play()
