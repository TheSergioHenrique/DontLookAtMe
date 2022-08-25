extends Node2D

func _ready():
	yield(get_tree().create_timer(0.2), "timeout")
	get_tree().paused = false
	
func _process(delta):
	pass
