extends Area2D

var hello = true

func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D and hello == true:
		body.CurrentEnergy += 200
		setStatus(false)
		

func setStatus(tada: bool):
	if tada:
		hello = true
		visible = true
	else:
		hello = false
		hide()
