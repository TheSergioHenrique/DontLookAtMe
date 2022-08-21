extends Area2D

var selecteditem = false

export var timeline = "placa" 

func _ready():
	pass

func _process(delta):
	if selecteditem == true && Input.is_action_just_pressed("ui_accept"):
		_dialogue()

func _on_area_entered(area):
	if area.name == ("playerArea"):
		selecteditem = true

func _on_area_exited(area):
	if area.name == ("playerArea"):
		selecteditem = false
	
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

