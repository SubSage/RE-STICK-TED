extends Node2D

var Bullet = preload("res://Bullet.tscn")
var direction = Vector2(0,0)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _on_Area2D_area_entered(area):
#	print(area.name)
	pass # replace with function body


func _on_Timer_timeout():
	var b = Bullet.instance()
	b.direction=direction
	b.position=self.position
	b.speed=200
	b.size=4
	b.get_node("Timer").wait_time=15
	$"..".add_child(b)
	$Timer.start()
	pass # replace with function body
