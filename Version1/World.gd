extends Node2D

var endgame=false

func _process(delta):
	if !endgame:
		var goalsleft=$Goals.get_child_count()
	
		for goal in $Goals.get_children():
			if goal.goalmet:
				goalsleft-=1
		if goalsleft==0:
			$ConfirmationDialog.popup()
			endgame=true
			print("end")
		$GoalsLeft.text="Goals Left: " + str(goalsleft)
