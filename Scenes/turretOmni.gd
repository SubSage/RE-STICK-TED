extends "res://Scenes/turretStandard.gd"
var Bullet = preload("res://Bullet.tscn")

var texture = load("res://Sprites/bulletOval.png")
# var b = "textvar"

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Timer_timeout():
	player.play("fire")
	
	for i in range(6):
		var b = Bullet.instance()
		b.add_to_group("enemy_bullet")
		b.get_node("Area2D").add_to_group("enemy_bullet")
		b.get_node("Sprite").set_texture(texture)
		b.direction=Vector2(sin(i),cos(i)).normalized()
		b.rotation=self.rotation*i
		b.speed=128*1.5
		b.size=128/2
		b.get_node("Timer").wait_time=8
		$Timer.start()
		$"..".add_child(b)
		b.position=self.global_position
	pass # replace with function body


func _on_KinematicBody2D_area_entered(area):
	if area.is_in_group("player bullets"):
		$"..".enemy_count-=1
		queue_free()
	pass # replace with function body
