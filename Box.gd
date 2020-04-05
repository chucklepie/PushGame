extends KinematicBody2D

const GRID=16

func move(direction):
	if direction!=Vector2.ZERO:
		$Ray.cast_to=direction*GRID
		$Ray.force_raycast_update()
	if !$Ray.is_colliding():
		position=position+(direction*GRID)
		return true
	else:
		return false
	
