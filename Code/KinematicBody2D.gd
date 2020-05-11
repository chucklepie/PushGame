extends KinematicBody2D

const GRID:=16
onready var ray:RayCast2D=get_node("Ray")
onready var tween=$Tween

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
		moveplayer(direction*GRID)
		#position=position+(direction*GRID)
	else:
		var collider
		collider=ray.get_collider()
		if collider.is_in_group('Box'):
			if collider.move(direction):
				moveplayer(direction*GRID)

func moveplayer(amount):
	if not tween.is_active():
		tween.interpolate_property(self,"position",
			position,
			position+(amount),
			0.1,Tween.TRANS_SINE,Tween.EASE_IN_OUT
	)
	tween.start()
