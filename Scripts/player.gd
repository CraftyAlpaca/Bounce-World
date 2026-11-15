extends RigidBody2D

var StartEnergy
var CurrentEnergy
var LastCheckpointHeight

var totalEnergy
func _init() -> void:
	StartEnergy = 100
	LastCheckpointHeight =position.y
	CurrentEnergy = StartEnergy+10

var state = 0
var speed = 300

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left")and state !=1:
		linear_velocity.x = -speed#*(CurrentEnergy/StartEnergy)
		state = 1
	elif event.is_action_pressed("right")and state !=-1:
		linear_velocity.x = speed#*(CurrentEnergy/StartEnergy)
		state = -1
	elif (event.is_action_released("left")and state ==1)or (event.is_action_released("right") and state == -1):
		linear_velocity.x = 0
		state = 0

func _on_body_entered(_body: Node) -> void:
	if linear_velocity.y >=0:
		linear_velocity.y = CurrentEnergy+(position.y-LastCheckpointHeight)
	else:
		linear_velocity.y = -1*(CurrentEnergy+(position.y-LastCheckpointHeight))
	


func _on_area_2d_game_over() -> void:
	queue_free()
