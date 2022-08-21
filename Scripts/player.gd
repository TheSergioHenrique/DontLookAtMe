extends Node2D

var selecteditem = false

export var timeline = "lobster" 

var vel = 60

onready var sprite = $playerArea/playerSprite

export var limit_r = 560

export var limit_l = 11

func _ready():
	 pass

var is_runnig = false

func _process(delta):
	if selecteditem == true && Input.is_action_just_pressed("ui_accept"):
		_dialogue()

	var dirX = 0
	
	if Input.is_action_pressed("ui_right"):
		if Input.is_action_pressed("ui_select"):
			dirX += 1.5
		dirX += 1

	if Input.is_action_pressed("ui_left"):
		if Input.is_action_pressed("ui_select"):
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

func _on_lixoArea_area_entered(area):
	if area.name == ("playerArea"):
		selecteditem = true

func _on_lixoArea_area_exited(area):
	if area.name == ("playerArea"):
		selecteditem = false

func _dialogue():
	if get_node_or_null('DialogNode') == null:
		var dialogo = Dialogic.start(timeline)
		add_child(dialogo)
		dialogo.pause_mode = PAUSE_MODE_PROCESS
		dialogo.connect("timeline_end", self, "_unpause")
		get_tree().paused = true
		
func _unpause(name):
	yield(get_tree().create_timer(0.2), "timeout")
	get_tree().paused = false
