extends Node2D



func _on_area_2d_game_over() -> void:
	queue_free()

func reset():
	self.get_child(0).reset()
	for drink in get_tree().get_nodes_in_group("Energy Drinks"):
		drink.setStatus(true)
