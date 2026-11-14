extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		body.CurrentEnergy += 200
		queue_free()
