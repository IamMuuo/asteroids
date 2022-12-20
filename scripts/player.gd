extends Area2D

const MOVE_SPEED = 150
const SCREEN_WIDTH = 320
const SCREEN_HEIGHT = 180

func _process(delta):
	# check for screen bounds
	if position.x < 8.0:
		position.x = 8.0
	elif position.x > SCREEN_WIDTH - 8:
		position.x = SCREEN_WIDTH - 8
		
	if position.y < 8.0:
		position.y = 8.0
	elif position.y > SCREEN_HEIGHT - 8:
		position.y = SCREEN_HEIGHT - 8
	
	# move the ship on input
	var input_dir = Vector2()
	
	if Input.is_key_pressed(KEY_UP):
		input_dir.y -= 1.0
	if Input.is_key_pressed(KEY_DOWN):
		input_dir.y += 1.0
	if Input.is_key_pressed(KEY_LEFT):
		input_dir.x -= 1.0
	if Input.is_key_pressed(KEY_RIGHT):
		input_dir.x += 1.0

	position += (delta * MOVE_SPEED) * input_dir
