extends Node2D

export var timeline = "lobster" 

func _dialogue():
	if get_node_or_null('DialogNode') == null:
		var dialogo = Dialogic.start(timeline)
		add_child(dialogo)
		dialogo.pause_mode = PAUSE_MODE_PROCESS
		dialogo.connect("timeline_end", self, "_unpause")
		get_tree().paused = true
		
func _unpause(name):
	yield(get_tree().create_timer(0.2), "timeout")
	get_tree().paused = false

func _ready():
	pass
func _process(delta):
	pass
