extends Node

var beats = 0


func _on_Timer_timeout():
	beats+=1
	
	if beats==4:
		$World.init(1)
	pass # replace with function body
