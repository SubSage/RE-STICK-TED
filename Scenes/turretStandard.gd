extends "res://Scenes/wallStraight.gd"

#onready var player = $AnimationPlayer

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
#	$AnimationPlayer.play("spawn")
	pass

func _process(delta):
	
	if not player.is_playing():
		player.play("idle")
	pass
