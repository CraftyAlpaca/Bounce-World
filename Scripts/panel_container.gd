extends PanelContainer

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		hide()



func _on_button_button_down() -> void:
	hide()



func _on_button_2_button_down() -> void:
	get_tree().quit()
