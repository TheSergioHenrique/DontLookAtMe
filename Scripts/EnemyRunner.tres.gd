extends Sprite

var enemy_vel = 50

export var e_limit_r = 560

export var e_limit_l = 11

var enemyVisible = false

func _ready():
	hide()

func _process(delta):
	
	if(visible):
		var e_dirX = 0
		
		e_dirX += 3
		
		translate(Vector2(e_dirX, 0) * enemy_vel * delta)

		if global_position.x < e_limit_l:
			global_position.x = e_limit_l
			
		if global_position.x > e_limit_r:
			global_position.x = e_limit_r
		
	
func _on_runnerTrigger_area_entered(area):	
	if(area.name == "playerArea"):
		show()
		enemyVisible = true 
		
		
func _on_enemyTrigger_area_entered(area):
	if(area.name == "playerArea" and enemyVisible == true):
		yield(get_tree().create_timer(1.5), "timeout")
		get_tree().change_scene("res://Scenes/fase3.tscn")
