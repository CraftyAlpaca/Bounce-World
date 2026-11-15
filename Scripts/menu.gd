extends Node2D

var level = preload("res://level 1.tscn")

func _on_exit_button_up() -> void:
	get_tree().quit()


func _on_play_button_up() -> void:
	get_tree().change_scene_to_packed(level)


func _on_credits_button_up() -> void:
	%CenterContainer.visible = true
