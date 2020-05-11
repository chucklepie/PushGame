extends KinematicBody2D
signal box_finished_moving

const GRID=16
onready var tween:Tween=$Tween
func move(direction):
	if direction!=Vector2.ZERO:
		$Ray.cast_to=direction*GRID
		$Ray.force_raycast_update()
	if !$Ray.is_colliding():
		movebox(direction*GRID)
		return true
	else:
		return false
	
func movebox(amount):
	if not tween.is_active():
		tween.interpolate_property(self,"position",
			position,
			position+(amount),
			0.1,Tween.TRANS_SINE,Tween.EASE_IN_OUT
	)
	tween.start()

func _on_Tween_tween_all_completed() -> void:
	emit_signal("box_finished_moving")
	#get_parent().get_parent().check_end()
	#print(get_tree())
