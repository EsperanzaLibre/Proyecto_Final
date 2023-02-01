extends Control

export (int) var minutes
export (int) var seconds 
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
	if seconds > -1 and dsec <=0:
		seconds -= 1
		dsec = 10
	if minutes > -1 and seconds < 0:
		minutes -= 1
		seconds = 59
		
	if seconds >= 10:
		timer_seconds = str(seconds)
		#$Seconds.set_text(str(seconds))
	else:
		#$Seconds.set_text("0"+str(seconds))
		timer_seconds = "0" + str(seconds)
	#Global.timer_min = $Minutes.text
	Global.timer_min = timer_minutes
	
	if dsec>=0:
		timer_miliseconds = str(dsec)
		#$Milisec.set_text(str(dsec))
	else:
		#$Milisec.set_text("0"+str(dsec))
		timer_miliseconds = "0" + str(dsec)
	#Global.timer_sec = $Seconds.text
	Global.timer_sec = timer_seconds
	
	if minutes >= 10:
		timer_minutes = str(minutes)
		#$Minutes.set_text(str(minutes))
	else:
		timer_minutes = "0" + str(minutes)
		#$Minutes.set_text("0"+str(minutes))
	Global.timer_mil = timer_miliseconds
	#Global.timer_mil = $Milisec.text
	
	#utilizo una sola variable para poder mostrar todo en un control, queda mucho mas prolijo que mostrar todos
	$Game_Timer.set_text(str(timer_minutes, ": ",timer_seconds, ": ",timer_miliseconds))
	#$Game_Timer.set_text(str(Global.timer_min, ": ",Global.timer_sec, ": ",Global.timer_mil))
	
	if seconds <= 0 and minutes <= 0 and dsec <= 0:
		Global.timer = false
