extends Area2D

signal gameOver

func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		gameOver.emit("killed by worldborder")
