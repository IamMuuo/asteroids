extends Area2D
const SCREEN_WIDTH = 320
const MOVE_SPEED = 500

@onready var animation= get_node("sprite")

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(MOVE_SPEED * delta, 0.0)
	if position.x > SCREEN_WIDTH + 8:
		# delete the bullet
		queue_free()


func _on_area_entered(area):
	if area.is_in_group("asteroid"):
		# free the bullet instance
		queue_free()
