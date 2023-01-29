extends Area2D

func _on_Checkpoint_body_entered(body):
	if body.is_in_group("Player"):
		print("Checkpoint alcanzado")
		Global.player_initial_map_position = self.global_position #le paso la posicion al player
