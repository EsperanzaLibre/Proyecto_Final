extends Control

onready var vBoxButtons = $VBoxButtons
#onready var narrative = $Narrative
#onready var itemsOfGame = $ItemsOfGame
onready var soundOfGame = $SoundsOfGame
onready var fxLabel = $SoundsOfGame/FxLabel
onready var musicLabel = $SoundsOfGame/MusicLabel

func _on_Play_pressed():
	get_tree().change_scene("res://Scenes/loadingScene.tscn")
	
func _on_Exit_pressed():
	get_tree().quit()

func _on_Options_pressed():
	vBoxButtons.visible = false
	soundOfGame.visible = true

func _on_Back_pressed():
	Global.parallaxScroll = true
	vBoxButtons.visible = true
	
func _on_Back2_pressed():
	Global.parallaxScroll = true
	vBoxButtons.visible = true
	
func _on_Back3_pressed():
	vBoxButtons.visible = true
	soundOfGame.visible = false

func _on_MusicButton_pressed():
	Global.music = !Global.music
	if Global.music:
		musicLabel.text = "ON"
	else:
		musicLabel.text = "OFF"

func _on_FxButton_pressed():
	Global.fxGame = !Global.fxGame
	if Global.fxGame:
		fxLabel.text = "ON"
	else:
		fxLabel.text = "OFF"

