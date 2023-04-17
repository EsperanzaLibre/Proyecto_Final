extends NinePatchRect

onready var message = $message
onready var timer = $Timer
onready var continuaText = $continuaText

var dialog = Global.level_number
var set_msg: Array #arreglo que controla los dialogos

func _ready():
	load_dialogs()

func _input(event):
	if Global.checkDialog > -1:
		if event is InputEventKey and event.is_action_pressed("ui_accept"):
			Global.checkDialog -= 1
			print(Global.checkDialog)
			show_message()
			if set_msg.size() == 0:
				continuaText.text = 'Enter para Salir'
	else:
		hide()
		return

func show_message():
	if set_msg.size() == 0:
		hide()
		return
	
	var _msg: String = set_msg.pop_front()
	
	message.visible_characters = 0
	message.bbcode_text = _msg
	timer.start()
	
func load_dialogs():
	match dialog:
		1: #Dialogo Sir Nacho nivel 1
			set_msg = [
				'Oh Por todos los dioses. Secuestraron a mi amada',
				'Debo mostrar que soy digno de su amor y rescatarla',
				'Tengo que recorrer las llanuras, a la batalla!!!...'
				]
			$name.text = 'Sir Nacho'
		2: #Dialogo Sir Nacho nivel 2
			set_msg = [
				'Esta cueva da escalofríos, siento que me observan...',
				'Pero no puedo tener miedo en este momento, el rastro de los secuestadores es por aquí',
				'Sospecho que alguien poderoso esta detrás de esto'
				]
			$name.text = 'Sir Nacho'
		3: #Dialogo Sir Nacho nivel 3
			set_msg = [
				'Oh, es el bosque encantado, este lugar esta lleno de misterios',
				'He tenido que derrotar a los hombres del Rey K Leian',
				'Así tenga que pelear con todo el infierno rescataré a mi princesa!!!'
				]
			$name.text = 'Sir Nacho'
		4: #Dialogo Sir Nacho nivel 4
			set_msg = [
				'Este castillo es tenebroso, pero no claudicaré',
				'Este ser despreciable quiere a mi princesa para unir ambos reinos',
				'Aguarda mi amada, ya estoy en camino hacia tí'
				]
			$name.text = 'Sir Nacho'
		5: #Dialogo princesa
			set_msg = [
				'Sir Nacho! que alegria verte...',
				'Sabia que lograrias salvarme... Tu fortaleza y persistencia lo hicieron posible',
				'Estare eternamente agradecida contigo!!!...'
				]
			$name.text = 'Princess'

func _on_Timer_timeout():
	if message.visible_characters == message.bbcode_text.length():
		timer.stop()
		
	message.visible_characters += 1 #voy mostrando los caracteres de a 1
