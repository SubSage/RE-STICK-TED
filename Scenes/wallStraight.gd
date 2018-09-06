extends Node2D

onready var player = $AnimationPlayer

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	player.play("idle")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
