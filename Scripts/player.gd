extends RigidBody2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("up"):
		print("test")
