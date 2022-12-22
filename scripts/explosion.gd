extends Sprite

onready var explosion_sound = get_node("explosion_sfx")

func _ready():
	explosion_sound.play()

func _on_queue_free_timer_timeout():
	queue_free()
