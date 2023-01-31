extends Control

export (int) var minutes
export (int) var seconds 
var dsec = 0

func _physics_process(delta):
	
	if Global.timer:
		if !Global.timer_pause:
			_run_Game_time()
		else:
			print("entro a la pausa")
	else:
		print("Fin de timer")

func _on_Timer_timeout():
	dsec -= 1

func _run_Game_time():
	#funcion que administra el timer del HUD y da formato a los numeros
	if seconds > 0 and dsec <=0:
		seconds -= 1
		dsec = 10
	if minutes > 0 and seconds <=0:
		minutes -= 1
		seconds = 60
		
	if seconds >= 10:
		$Seconds.set_text(str(seconds))
	else:
		$Seconds.set_text("0"+str(seconds))
	
	if dsec>=0:
		$Milisec.set_text(str(dsec))
	else:
		$Milisec.set_text("0"+str(dsec))
	
	if minutes >= 10:
		$Minutes.set_text(str(minutes))
	else:
		$Minutes.set_text("0"+str(minutes))
	
	if seconds <= 0 and minutes <= 0 and dsec <= 0:
		Global.timer = false
