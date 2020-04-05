extends Area2D

var goalmet = false

func _on_Goal_body_entered(body):
	if body.is_in_group('Box'):
		goalmet=true
		print("box entered")

func _on_Goal_body_exited(body):
	if body.is_in_group('Box'):
		goalmet=false
		print("box left")
