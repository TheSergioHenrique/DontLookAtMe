extends Node2D

var vel = 60

onready var sprite = $playerSprite

#onready var camera = $"../Camera2D"

var limit_r = 560

var limit_l = 11

#posição esquerda 11, 131
#posição direita 570, 131

func _ready():
	pass 

func _process(delta):
	
	var dirX = 0
	
	if Input.is_action_pressed("ui_right"):
		dirX += 1

	if Input.is_action_pressed("ui_left"):
		dirX += -1
	
	translate(Vector2(dirX,0) * vel * delta)
	#camera.translate(Vector2(dirX,0) * vel * delta)
	
	if global_position.x < limit_l:
		global_position.x = limit_l
		
	if global_position.x > limit_r:
		global_position.x = limit_r
	
	if dirX != 0:
		sprite.animation = "walk"
	else:
		sprite.animation = "idle"
		
	if dirX < 0:
		sprite.flip_h = true
	elif dirX > 0:
		sprite.flip_h = false
		
