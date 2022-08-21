extends Area2D

var selecteditem = false 

func _ready():
	pass

func _process(delta):
	if selecteditem == true && Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Scenes/Cutscene.tscn")

func _on_area_entered(area):
	if area.name == ("playerArea"):
		selecteditem = true

func _on_area_exited(area):
	if area.name == ("playerArea"):
		selecteditem = false

func _unpause(name):
	yield(get_tree().create_timer(0.2), "timeout")
	get_tree().paused = false

