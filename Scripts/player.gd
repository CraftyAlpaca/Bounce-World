extends RigidBody2D

var totalEnergy

func _init() -> void:
	totalEnergy = -self.position.y+100

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left"):
		linear_velocity.x = -100
	elif event.is_action_pressed("right"):
		linear_velocity.x = 100
	elif event.is_action_pressed("up"):
		linear_velocity.y += abs(linear_velocity.x)
		linear_velocity.x = 0
	linear_velocity =linear_velocity.limit_length(totalEnergy+self.position.y)
