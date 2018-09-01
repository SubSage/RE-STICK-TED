extends Node2D

var size = 16
var damage = 1
var direction = Vector2(1,1)
var speed = 15
var color = Color(.8,.8,.2)

func _ready():
	pass

func _process(delta):
	position += direction*speed*delta
	update()
	

func _draw():
	draw_circle(Vector2(0,0), size, color)
	pass

func _on_Area2D_area_entered(area):
	if (area.is_in_group("shootable")): 
		queue_free()
	pass # replace with function body


func _on_Timer_timeout():
	queue_free()
	pass # replace with function body
