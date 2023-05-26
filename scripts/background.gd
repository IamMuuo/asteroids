extends Sprite2D
const SCREEN_WIDTH = 320
const SCREEN_HEIGHT = 180

var scroll_speed = 30


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(-scroll_speed * delta, 0.0)
	
	if position.x <= -SCREEN_WIDTH:
		position.x += SCREEN_WIDTH
