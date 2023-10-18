extends Control

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://Scenes/fase1.tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/fase1.tscn")
