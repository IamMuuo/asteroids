extends Control


const SCREEN_WIDTH = 320
const SCREEN_HEIGHT = 180
const scroll_speed = 30.0

onready var background = get_node("background")
onready var start = get_node("start")
onready var quit = get_node("quit")

func _process(delta):
	background.position += Vector2(delta * -scroll_speed, 0.0)
	
	if background.position.x <= -SCREEN_WIDTH:
		background.position.x += SCREEN_WIDTH
		
	
	if start.pressed:
		get_node("player").position.x += 20
		get_tree().change_scene("res://Scenes/stage.tscn")
	
	if quit.pressed:
		get_tree().quit()
