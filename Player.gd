extends Node2D
var Bullet = preload("res://Bullet.tscn")
var motion = Vector2()
var direction = Vector2()
var speed = 128


func _ready():
	$Camera2D.make_current()
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if Input.get_connected_joypads().size() > 0:
		motion=(Vector2(Input.get_joy_axis(0,JOY_AXIS_0),Input.get_joy_axis(0,JOY_AXIS_1)))
		if abs(motion.x)<.2:
			motion.x=0
		if abs(motion.y)<.2:
			motion.y=0
		if abs(Input.get_joy_axis(0,JOY_AXIS_3))>.05:
			direction.x=Input.get_joy_axis(0,JOY_AXIS_3)
		if abs(Input.get_joy_axis(0,JOY_AXIS_4))>.05:
			direction.y=Input.get_joy_axis(0,JOY_AXIS_4)
		direction=direction.normalized()
	else:
		if Input.is_action_just_pressed("ui_right"):
			motion.x = speed*delta
		elif Input.is_action_just_pressed("ui_left"):
			motion.x = -speed*delta
		else:
			motion.x = 0
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -speed*delta
		elif Input.is_action_just_pressed("ui_down"):
			motion.y = speed*delta
		else:
			motion.y = 0
		
		direction.x = 0
		direction.y = 0
		
		if Input.is_action_just_pressed("ui_d"):
			direction.x = speed*delta
		elif Input.is_action_just_pressed("ui_a"):
			direction.x = -speed*delta
		elif Input.is_action_just_pressed("ui_w"):
			direction.y = -speed*delta
		elif Input.is_action_just_pressed("ui_s"):
			direction.y = speed*delta
		
		if abs(direction.x)>0 or abs(direction.y)>0:
			var b = Bullet.instance()
			b.direction=direction.normalized()
			b.position=self.position
			b.speed=128*3
			b.size=4
			b.get_node("Sprite").texture=load("res://Sprites/bulletSpark.png")
			if(direction.x>0):
				b.rotate(deg2rad(90))
			if(direction.x<0):
				b.rotate(deg2rad(90))
			if(direction.y>0):
				b.rotate(deg2rad(180))
			if(direction.y<0):
				b.rotate(deg2rad(180))
			b.get_node("Area2D").add_to_group("player bullets")
			$"..".add_child(b)
			
		#direction=get_local_mouse_position().normalized()
		
	if Input.is_action_pressed("ui_exit"):
		get_tree().quit()
	
	if $Timer.time_left<=0.1 and (abs(motion.x)>0 or abs(motion.y)>0 ):
		position += motion.normalized()*speed
#		var b = Bullet.instance()
##		b.direction=motion.normalized()
#		b.position=self.position
#		b.speed=300
#		b.size=4
#		b.get_node("Area2D").add_to_group("player bullets")
#		$"..".add_child(b)
		$Timer.start()
	update()
	pass


func _on_hitbox_area_entered(area):
#	print(area.name)
	if(area.is_in_group("enemy_bullet")or area.is_in_group("wall")):
		get_tree().quit()
#	print(area.name)
#	print("Player has touched : " +str(area.name))
	pass # replace with function body
