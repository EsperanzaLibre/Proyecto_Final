# MIT License
#
# Copyright (c) 2018-2020 Matías Muñoz Espinoza
# Copyright (c) 2019 Ren Project

extends Node

class_name QuizDynamic

# QuizDinamic es un Quiz Dinámico que se puede leer desde un archivo, json
# o incluso encriptado. Para esto es necesario el plugin PersistenceNode
# que esta incluido.

const PREGUNTA = "Preguntas" #Esta constante almacena el nombre del archivo
onready var persistence = Persistence.new() #Accesso al nodo de persistencia para poder almacenar y cargar la data
var current_data #Diccionario con la data actual
var questions := [] #en este arreglo guardo las Preguntas
var current_question := 0 #Numero de la pregunta actual, empieza en 0

signal get_question(question_num)
signal correct_answer
signal incorrect_answer

# Desde donde se leen las preguntas y respuestas
func read_from(file_name, random := true):
	for question in current_data[file_name].keys():
		questions.append(current_data[file_name][question])
		
	if random:
		randomize()
		questions.shuffle()

# Obtiene la pregunta actual o la indicada por parametro
func get_question():
	emit_signal("get_question", current_question)
	return questions[current_question]["Pregunta"]

# Pasa a la siguiente pregunta
func next_question():
	if current_question + 1 < questions.size():
		current_question += 1

# Obtiene la respuesta numero answer_num
func get_answer(answer_num):
	return questions[current_question]["PosiblesRespuestas"][answer_num]

# Pregunta si la respuesta answer_num es correcta o no
func is_correct(answer_num):
	if questions[current_question]["RespuestasCorrectas"].has(answer_num):
		emit_signal("correct_answer")
		return true
		
	emit_signal("incorrect_answer")
	return false

# Obtiene la cantidad de respuestas de la pregunta actual
func get_answer_amount():
	return questions[current_question]["PosiblesRespuestas"].size()

# Obtiene la cantidad de preguntas actuales
func get_question_amount():
	return questions.size()

# Pregunta si es la última pregunta o no
func is_last_question():
	return questions.size() == current_question + 1

# Crea una estructura básica para el json de preguntas y respuestas
func create_trivia():
	persistence.set_folder_name("Preguntas")
	persistence.mode = Persistence.Mode.ENCRYPTED
	
	current_data = persistence.get_data(PREGUNTA)
	var script = load("res://Scripts/respuestas_trivia.gd").new()
	current_data[PREGUNTA] = script.arreglo_preguntas
	persistence.save_data(PREGUNTA)
