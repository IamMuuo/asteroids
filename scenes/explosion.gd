extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("explosion_sfx").play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_queue_free_timer_timeout():
	visible = false


func _on_explosion_sfx_finished():
	queue_free()
