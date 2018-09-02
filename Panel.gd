extends Node2D

var Bullet = preload("res://Bullet.tscn")
var direction = Vector2(0,0)
var Turret = preload("res://Scenes/turretStandard.tscn")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	var t = Turret.instance()
	t.hide()
	add_child(t)
	pass

func delay(var delay):
	$spawndelay.wait_time=delay
	$spawndelay.start()
	pass
	
func _physics_process(delta):
	get_node("RayCast2D").cast_to=direction*1000
	if get_node("RayCast2D").is_colliding():
		var collider = get_node("RayCast2D").get_collider()
		update()


func _draw():
	if get_node("RayCast2D").is_colliding():
		var collision_point = get_node("RayCast2D").get_collision_point()
#		draw_line(Vector2(0,0),to_local(collision_point), Color(1,.4,.23),16, true)
	pass
	
func _on_Area2D_area_entered(area):
	if area.is_in_group("player bullets"):
#		print(area.name)
		$"..".enemy_count-=1
		print ($"..".enemy_count)
		queue_free()
		pass # replace with function body


func _on_Timer_timeout():
	var b = Bullet.instance()
	b.add_to_group("enemy_bullet")
	
	b.get_node("Area2D").add_to_group("enemy_bullet")
	b.get_node("Sprite")
	b.direction=direction
	b.rotation=self.rotation
	b.speed=128*1.5
	b.size=128/2
	b.get_node("Timer").wait_time=8
	$Timer.start()
	add_child(b)
	get_node("turretStandard/AnimationPlayer").play("fire")
	pass # replace with function body


func _on_spawndelay_timeout():
	get_node("turretStandard").show()
	get_node("turretStandard/AnimationPlayer").play("spawn")
	pass # replace with function body
