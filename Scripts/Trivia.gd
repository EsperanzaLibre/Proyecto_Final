extends Control

onready var trivia = $QuizDynamic
onready var contenedor = $VBox/Question
var questions = 4

func _ready():

	trivia.create_trivia() #preparo la trivia
	trivia.read_from(trivia.PREGUNTA)
	trivia.connect("get_question", self, "_on_get_question")
	trivia.connect("correct_answer", self, "_on_correct_answer")
	trivia.connect("incorrect_answer", self, "_on_incorrect_answer")
	
	new_question()

func new_question():#creo la nueva pregunta
	contenedor.text = trivia.get_question()

func disable_all(disabled := true): #deshabilito los botones de la grilla
	for button in $VBox/Grid.get_children():
		button.disabled = disabled
		

func wait_for_next_question():
	yield(get_tree().create_timer(3.0), "timeout")
		
	trivia.next_question()
	new_question()
	disable_all(false)


func _on_get_question(num):
	$VBox/Grid/Opt1.text = trivia.get_answer(1)
	$VBox/Grid/Opt2.text = trivia.get_answer(2)
	$VBox/Grid/Opt3.text = trivia.get_answer(3)
	$VBox/Grid/Opt4.text = trivia.get_answer(4)


func _on_correct_answer():
	contenedor.text = "Es Correcto!"
	Global.triviaCorrectAnswers += 1
	disable_all()
	
	if questions > 0:
		questions -= 1
		wait_for_next_question()
	elif Global.triviaCorrectAnswers == 3:
		contenedor.text = "Has Ganado un poder especial"
	else:
		contenedor.text = "Debes aprender mas del mundo GAMER!!"


func _on_incorrect_answer():
	contenedor.text = "Es Incorrecto!" 
	disable_all()
	
	#if not trivia.is_last_question():
	if questions > 0:
		questions -= 1
		wait_for_next_question()
	elif Global.triviaCorrectAnswers == 3:
		contenedor.text = "Has Ganado un poder especial"
		yield(get_tree().create_timer(3.0), "timeout")
	else:
		contenedor.text = "Debes aprender mas del mundo GAMER!!"
		yield(get_tree().create_timer(3.0), "timeout")

func _on_Opt1_pressed():
	trivia.is_correct(1)

func _on_Opt2_pressed():
	trivia.is_correct(2)

func _on_Opt3_pressed():
	trivia.is_correct(3)

func _on_Opt4_pressed():
	trivia.is_correct(4)
