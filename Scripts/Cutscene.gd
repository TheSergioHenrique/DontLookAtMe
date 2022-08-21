extends Control

onready var selector = $VBoxContainer/VBoxContainer/HBoxContainer/Selector

var current_selection = 0

func _ready():
	pass
	
func _process(delta):
	pass

func handle_selection(_current_selection):
	pass


func _on_Button_pressed():
	$TextureRect2.show()

func _on_Button2_pressed():
	$TextureRect3.show()

func _on_Button3_pressed():
	$TextureRect4.show()

func _on_Button4_pressed():
	$TextureRect5.show()

func _on_Button5_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
