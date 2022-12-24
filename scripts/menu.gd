extends Control


const SCREEN_WIDTH = 320
const SCREEN_HEIGHT = 180
const scroll_speed = 30.0

onready var background = get_node("background")
func _process(delta):
	background.position += Vector2(delta * -scroll_speed, 0.0)
	
	if background.position.x <= -SCREEN_WIDTH:
		background.position.x += SCREEN_WIDTH
