extends Node2D

var vel = 60

onready var sprite = $playerSprite

var limit_r = 560

var limit_l = 11

func _ready():
	pass 
	
var is_runnig = false

func _process(delta):
	var dirX = 0
	
	if Input.is_action_pressed("ui_right"):
		if Input.is_action_pressed("ui_accept"):
			dirX += 1.5
		dirX += 1

	if Input.is_action_pressed("ui_left"):
		if Input.is_action_pressed("ui_accept"):
			dirX += -1.5
		dirX += -1
	
	translate(Vector2(dirX,0) * vel * delta)
	
	if global_position.x < limit_l:
		global_position.x = limit_l
		
	if global_position.x > limit_r:
		global_position.x = limit_r
		
	
	if dirX != 0:
		if dirX > 1 or dirX < -1:
			sprite.animation = "run"
		else:
			sprite.animation = "walk"
	else:
		sprite.animation = "idle"
		
	if dirX < 0:
		sprite.flip_h = true
	elif dirX > 0:
		sprite.flip_h = false
