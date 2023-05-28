extends Area2D
const MOVE_SPEED = 150.0
const SCREEN_WIDTH = 320
const SCREEN_HEIGHT = 180
@onready var animation = get_node("sprite")
var explosion_scene = preload("res://scenes/explosion.tscn")
var shotscene
var canshoot = true

@export var lives = 3

signal  destroyed
signal hit
# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_SPACE) and  canshoot == true:
		canshoot = false
		var stage_node = get_parent()
		shotscene = preload("res://scenes/shot.tscn").instantiate()
		shotscene.position = position
		stage_node.add_child(shotscene)
		
	var input_dir = Vector2()
	if Input.is_key_pressed(KEY_UP):
		input_dir.y -= 1.0
	if Input.is_key_pressed(KEY_DOWN):
		input_dir.y += 1.0
		
	if Input.is_key_pressed(KEY_LEFT):
		input_dir.x -= 1.0
		
	if Input.is_key_pressed(KEY_RIGHT):
		input_dir.x += 1.0
	
	# Limit the player to the screen
	if position.x < 0.0:
		position.x = 0.0
	elif position.x > SCREEN_WIDTH:
		position.x = SCREEN_WIDTH
	if position.y < 0.0:
		position.y = 0.0
	elif  position.y > SCREEN_HEIGHT:
		position.y = SCREEN_HEIGHT
	position+= (delta * MOVE_SPEED) * input_dir
	


func _on_reload_timer_timeout():
	canshoot = true


func _on_area_entered(area):
	if area.is_in_group("asteroid"):
		emit_signal("hit")
		var explosion = explosion_scene.instantiate()
		explosion.position = position
		get_parent().add_child(explosion)
		lives = lives - 1
		
		if lives < 1:
			emit_signal("destroyed")
			queue_free()
		
