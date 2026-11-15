extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.set_checkpoint(self)
		var sprite: AnimatedSprite2D = self.get_child(0)
		sprite.play("collected")
		self.get_child(1).free()

func pos():
	return self.get_child(0).position
