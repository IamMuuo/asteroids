extends Area2D

const MOVE_SPEED = 500
const SCREEN_WIDTH = 320

# moove the bullet
func _process(delta):
	position+= Vector2(MOVE_SPEED * delta, 0.0) # move along the width
	
	if position.x > SCREEN_WIDTH:
		queue_free()




func _on_Shot_area_entered(area):
	if area.is_in_group("asteroid"):
		queue_free()
