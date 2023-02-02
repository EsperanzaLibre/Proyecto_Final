extends Control

var minutes
var seconds 
var dsec = 0
var timer_minutes
var timer_seconds
var timer_miliseconds


func _physics_process(delta):
	if Global.timer:
		_run_Game_time()
	else:
		print("Fin de timer")

func _on_Timer_timeout():
	dsec -= 1

func _run_Game_time():
	#funcion que administra el timer del HUD y da formato a los numeros

	#configuro los numeros para que decrezcan
	if Global.timer_min > -1 and Global.timer_sec < 0:
		Global.timer_min -= 1
		Global.timer_sec = 59	

	if Global.timer_sec > -1 and dsec <0:
		Global.timer_sec -= 1
		dsec = 10

	#formateo los numeros
	if Global.timer_min >= 10:
		timer_minutes = str(Global.timer_min)
	else:
		timer_minutes = "0" + str(Global.timer_min)
	Global.timer_min = int(timer_minutes)
	
	if Global.timer_sec >= 10:
		timer_seconds = str(Global.timer_sec)
	else:
		timer_seconds = "0" + str(Global.timer_sec)
	Global.timer_sec = int(timer_seconds)
	
	if dsec>=0:
		timer_miliseconds = str(dsec)
	else:
		timer_miliseconds = "0" + str(dsec)
	Global.timer_mil = int(timer_miliseconds)
	
	
	#utilizo una sola variable para poder mostrar todo en un control, queda mucho mas prolijo que mostrar todos
	$Game_Timer.set_text(str(timer_minutes, ": ",timer_seconds, ": ",timer_miliseconds))
	
	if Global.timer_min <= 0 and Global.timer_sec <= 0 and dsec <= 0:
		Global.timer = false
