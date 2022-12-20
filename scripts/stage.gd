extends Node2D

var score = 0
const SCREEN_WIDTH = 320
const SCREEN_HEIGHT = 180

var is_game_over = false
var asteroid = preload("res://Scenes/Asterioid.tscn")


func _ready():
	
	randomize()
	get_node("player").connect("destroyed", self, "_on_player_destoyed")
	get_node("spawn_timer").connect("timeout", self, "_on_spawn_timer_timeout")

func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
		
	if is_game_over and Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene("res://Scenes/stage.tscn")
		
		
func _on_player_destroyed():
	get_node("ui/retry").show()
	is_game_over = true

func _on_spawn_timer_timeout():
	var asteroid_instance = asteroid.instance()
	asteroid_instance.connect("score", self, "_on_player_score")
	asteroid_instance.position = Vector2(SCREEN_WIDTH + 8, rand_range(0, SCREEN_HEIGHT))
	add_child(asteroid_instance)

func _on_player_score():
	score += 1
	get_node("ui/score").text = "Score: " + str(score)
