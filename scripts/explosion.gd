extends Sprite2D

@onready var explosion_sound = get_node("explosion_sfx")
# Called when the node enters the scene tree for the first time.
func _ready():
	explosion_sound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_queue_free_timer_timeout():
	get_node("explosion_smoke").visible = false


func _on_explosion_sfx_finished():
	queue_free()
