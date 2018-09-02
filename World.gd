extends Node2D

var grid_size = Vector2(8,8)
var cell_size = 128
export var t=0
var Panels = preload("res://Panel.tscn")
var Wall = preload("res://Scenes/wallStraight.tscn")

func _ready():
	
	for panels in range(grid_size.x):
		if panels == 0 or panels==grid_size.x-1:
			for panels2 in range(grid_size.y):
				if randf()<.3:
					var p = Panels.instance()
					p.position.x=panels * cell_size
					p.position.y=panels2 * cell_size
					if panels == grid_size.x-1:
						p.direction=Vector2(-1,0)
						add_child(p)
						p.get_node("turretStandard").rotate(deg2rad(180))
					else:
						p.direction=Vector2(1,0)
						add_child(p)
				else:
					var w = Wall.instance()
					w.position.x=panels * cell_size
					w.position.y=panels2 * cell_size
					if panels == grid_size.x-1:
#						w.direction=Vector2(-1,0)
						add_child(w)
						w.rotate(deg2rad(90))
					else:
#						w.direction=Vector2(1,0)
						add_child(w)
						w.rotate(deg2rad(270))
		else:
			if randf()<.3:
				var p = Panels.instance()
				p.position.x=panels * cell_size
				p.direction=Vector2(0,1)
				add_child(p)
				p.get_node("turretStandard").rotate(deg2rad(90))
				var p2 = Panels.instance()
				p2.position.x=panels * cell_size
				p2.position.y=(grid_size.y - 1) * cell_size
				p2.direction=Vector2(0,-1)
				add_child(p2)
				p2.get_node("turretStandard").rotate(deg2rad(270))
			else:
				var w = Wall.instance()
				w.position.x=panels * cell_size
				add_child(w)
				w.rotate(deg2rad(0))
				var w2 = Wall.instance()
				w2.position.x=panels * cell_size
				w2.position.y=(grid_size.y - 1) * cell_size
				add_child(w2)
				w2.rotate(deg2rad(180))
		
#	move_child(p,0)
#	add_child_below_node(p)
	pass

func _process(delta):
	#rotate(.03)
	position.x+=32*delta
	t=t + delta
	update()
	pass


#func _draw():
#	for a in grid_size.x:
#		for b in grid_size.y:
#			pass
#			#draw_circle(Vector2(a*cell_size,b*cell_size),cell_size/2, Color(200,200,200))
#	#draw_line(Vector2(100,50), Vector2(100,0), Color(200,200,200),1)
	