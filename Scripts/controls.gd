extends PanelContainer

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		hide()


func _on_move_left_button_down() -> void:
	%"Move Left".text = "..."
	

func _on_move_right_button_down() -> void:
	%"Move Right".text = "..."


func _on_respawn_button_down() -> void:
	%"Respawn".text = "..."
