extends Node2D

var Bullet = preload("res://Bullet.tscn")
var direction = Vector2(0,0)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	if get_node("RayCast2D").is_colliding():
		var collider = get_node("RayCast2D").get_collider()
		print(collider.name)
		update()


func _draw():
	if get_node("RayCast2D").is_colliding():
		var collision_point = get_node("RayCast2D").get_collision_point()
#		draw_line(Vector2(0,0),(collision_point-self.global_position), Color(1,.4,.23),16, true)
		draw_line(Vector2(0,0),to_local(collision_point), Color(1,.4,.23),16, true)
		print(collision_point-self.global_position)
	pass
	
func _on_Area2D_area_entered(area):
#	print(area.name)
	pass # replace with function body


func _on_Timer_timeout():
	var b = Bullet.instance()
	b.direction=direction
	b.position=self.position
	b.speed=200
	b.size=40
	b.get_node("Timer").wait_time=15
	$Timer.start()
	add_child(b)
	print("hello?")
	pass # replace with function body
