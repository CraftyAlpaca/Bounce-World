extends RigidBody2D
class_name Player

var StartEnergy
var CurrentEnergy
var LastCheckpointHeight
var Checkpoint = null

var totalEnergy
func _init() -> void:
	StartEnergy = 100
	LastCheckpointHeight =position.y
	Checkpoint = position
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
	elif (event.is_action_pressed("ui_cancel")):
		%PanelContainer.visible = true

func die():
	move_body(Checkpoint)
	get_parent().reset()

func _on_body_entered(_body: Node) -> void:
	if linear_velocity.y >=0:
		linear_velocity.y = CurrentEnergy+(position.y-LastCheckpointHeight)
	else:
		linear_velocity.y = -1*(CurrentEnergy+(position.y-LastCheckpointHeight))
	


func _on_area_2d_game_over() -> void:
	queue_free()

func set_checkpoint(checkpoint:Area2D):
	var maplayer:TileMapLayer= checkpoint.get_parent()
	Checkpoint = maplayer.map_to_local(maplayer.local_to_map(self.position))
	LastCheckpointHeight = Checkpoint.y
	var velo = linear_velocity
	get_parent().reset()
	linear_velocity = velo

var reset_state = false
var moveVector: Vector2

func _integrate_forces(forceState):
	if reset_state:
		forceState.transform = Transform2D(0.0, moveVector)
		reset_state = false

func move_body(targetPos: Vector2):
	moveVector = targetPos;
	reset_state = true;

func reset():
	CurrentEnergy = StartEnergy
	self.linear_velocity = Vector2(0,0)
