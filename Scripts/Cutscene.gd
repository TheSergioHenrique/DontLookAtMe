extends Control
#As linhas comentadas foram uma tentativa de mapear o botão E para passar as cenas.
onready var selector = $VBoxContainer/VBoxContainer/HBoxContainer/Selector

var current_scene_index = 0
var current_selection = 0
#var scenes = [$TextureRect, $TextureRect2, $TextureRect3, $TextureRect4, $TextureRect5]

func _ready():
	yield(get_tree().create_timer(0.2), "timeout")
	get_tree().paused = false
#	if scenes[current_scene_index] != null:
#		scenes[current_scene_index].show()
	
func _process(delta):
#	if Input.is_action_pressed("ui_accept"):
#		if scenes[current_scene_index] != null:
#			scenes[current_scene_index].hide()
		
#		current_scene_index = (current_scene_index + 1) % len(scenes)

#		if scenes[current_scene_index] != null:
#			scenes[current_scene_index].show()
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




func _on_TextureRect_ready():
	pass # Replace with function body.


func _on_TextureRect2_ready():
	pass # Replace with function body.


func _on_TextureRect3_ready():
	pass # Replace with function body.


func _on_TextureRect4_ready():
	pass # Replace with function body.


func _on_TextureRect5_ready():
	pass # Replace with function body.
