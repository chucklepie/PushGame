extends Node2D

var endgame=false
var goalsleft

func _ready() -> void:
	var box:KinematicBody2D
	for box in $Boxes.get_children():
		box.connect("box_finished_moving",self,"_on_box_finished_moving")
	
	
func _process(delta):
	if !endgame:
		goalsleft=$Goals.get_child_count()

func check_end():
	for goal in $Goals.get_children():
		if goal.goalmet:
			goalsleft-=1
	if goalsleft==0:
		$ConfirmationDialog.popup()
		endgame=true
		print("end")
	$GoalsLeft.text="Goals Left: " + str(goalsleft)



func _on_box_finished_moving() -> void:
	check_end()
