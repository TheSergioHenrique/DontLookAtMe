extends Control

onready var selector_one = $VBoxContainer/VBoxContainer/HBoxContainer/Selector
onready var selector_two = $VBoxContainer/VBoxContainer/HBoxContainer2/Selector
onready var selector_three= $VBoxContainer/VBoxContainer/HBoxContainer3/Selector

var current_selection = 0

func _ready():
	set_current_selection(0)
	
func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 2:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)

func handle_selection(_current_selection):
	if _current_selection == 0:
		get_tree().change_scene("res://Scenes/game.tscn")
	elif _current_selection == 1:
		pass
	elif _current_selection == 2:
		get_tree().quit()

func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ""
	
	if _current_selection == 0:
		selector_one.text = ">"
	elif _current_selection == 1:
		selector_two.text = ">"
	elif _current_selection == 2:
		selector_three.text = ">"

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/game.tscn")

func _on_HowToPlayButton_pressed():
	pass

func _on_QuitButton_pressed():
	get_tree().quit()
	
func _on_StartButton_mouse_entered():
	current_selection = 0
	selector_one.text = ">"
	selector_two.text = ""
	selector_three.text = ""

func _on_HowToPlayButton_mouse_entered():
	current_selection = 1
	selector_one.text = ""
	selector_two.text = ">"
	selector_three.text = ""


func _on_QuitButton_mouse_entered():
	current_selection = 2
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ">"
