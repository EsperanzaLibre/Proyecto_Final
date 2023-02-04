extends Area2D

func _on_Checkpoint_body_entered(body):
	if body.is_in_group("Player"):
		print("Checkpoint alcanzado")
		Global._on_CreateFloatingTextButtonGlobal("Checkpoint alcanzado", position.x, position.y, 4, 2.0)
		Global.player_initial_map_position = self.global_position #le paso la posicion al player
