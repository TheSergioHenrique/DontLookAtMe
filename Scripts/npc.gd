extends Area2D

var active = true

export var timeline = "hello-world" 

func _ready():
	pass

func _on_area_entered(area):
	if area.name == ("playerArea") and active == true:
		_dialogue()

func _dialogue():
	if get_node_or_null('DialogNode') == null:
		var dialogo = Dialogic.start(timeline)
		add_child(dialogo)
		dialogo.pause_mode = PAUSE_MODE_PROCESS
		dialogo.connect("timeline_end", self, "_unpause")
		get_tree().paused = true

func _unpause(name):
	get_tree().paused = false
	$npcSprite.animation = "transform"
	$npcSprite2.animation = "transform"
	yield($npcSprite,"animation_finished")
	$npcSprite.animation = "monstro"
	$npcSprite2.animation = "monstro"
	active = false
