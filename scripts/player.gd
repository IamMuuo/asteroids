extends Area2D
const MOVE_SPEED = 150.0
const SCREEN_WIDTH = 320
const SCREEN_HEIGHT = 180
@onready var animation = get_node("sprite")

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
	
