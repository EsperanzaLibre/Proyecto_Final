extends NinePatchRect

onready var message = $message
onready var timer = $Timer
onready var continuaText = $continuaText

var set_msg: Array = [
	'Sir Nacho! que alegria verte...',
	'Sabia que lograrias salvarme... Tu fortaleza y persistencia lo hicieron posible',
	'Estare eternamente agradecida contigo!!!...'
	]


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept"):
		show_message()
		if set_msg.size() == 0:
			continuaText.text = 'Enter para Salir'
	
func show_message():
	if set_msg.size() == 0:
		hide()
		return
	
	
	var _msg: String = set_msg.pop_front()
	
	message.visible_characters = 0
	message.bbcode_text = _msg
	timer.start()
	
	
func _on_Timer_timeout():
	if message.visible_characters == message.bbcode_text.length():
		timer.stop()
		
	message.visible_characters += 1
	pass # Replace with function body.
