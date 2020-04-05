extends KinematicBody2D

const GRID=16
onready var ray=get_node("Ray")

func _unhandled_input(event):
	var direction = Vector2.ZERO
	if event.is_action_pressed("ui_right"):
		direction=Vector2.RIGHT
	if event.is_action_pressed("ui_left"):
		direction=Vector2.LEFT
	if event.is_action_pressed("ui_up"):
		direction=Vector2.UP
	if event.is_action_pressed("ui_down"):
		direction=Vector2.DOWN
	
	move(direction)

func move(direction):
	if direction!=Vector2.ZERO:
		ray.cast_to=direction*GRID
		ray.force_raycast_update()
	if !ray.is_colliding():
		position=position+(direction*GRID)
	else:
		var collider
		collider=ray.get_collider()
		if collider.is_in_group('Box'):
			if collider.move(direction):
				position=position+(direction*GRID)
