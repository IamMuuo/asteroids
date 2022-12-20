extends Sprite

const SCREEN_WIDTH = 320
const SCREEN_HEIGHT = 180
const scroll_speed = 30.0

func _process(delta):
	position += Vector2(delta * -scroll_speed, 0.0)
	
	if position.x <= -SCREEN_WIDTH:
		position.x += SCREEN_WIDTH
