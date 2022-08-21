extends Sprite

var enemy_vel = 50

export var e_limit_r = 560

export var e_limit_l = 11

func _ready():
	pass

func _process(delta):
	
	var e_dirX = 0
	
	e_dirX += 3

	translate(Vector2(e_dirX, 0) * enemy_vel * delta)

	if global_position.x < e_limit_l:
		global_position.x = e_limit_l
			
	if global_position.x > e_limit_r:
		global_position.x = e_limit_r

func _on_enemyTrigger_area_entered(area):
	if(area.name == "playerArea"):
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene("res://Scenes/Fase4.tscn")
