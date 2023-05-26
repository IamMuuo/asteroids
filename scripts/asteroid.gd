extends Area2D
const  move_speed = 100
@onready var animation = get_node("sprite")
@onready var explosion_scene = preload("res://scenes/explosion.tscn")
signal  score

var score_emmitted = false
# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Handle moving
	if position.x > -100:
		position -= Vector2(move_speed*delta, 0)
	else:
		queue_free() 


func _on_area_entered(area):
	if area.is_in_group("shot") or area.is_in_group("player"):
		if not score_emmitted:
			score_emmitted = true
			emit_signal("score")
			queue_free()
			
			var parent_node = get_parent()
			var explision_instance = explosion_scene.instantiate()
			explision_instance.position = position
			parent_node.add_child(explision_instance)
