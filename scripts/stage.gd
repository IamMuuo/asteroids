extends Node2D

var asteroid = preload("res://scenes/asteroid.tscn")
const SCREEN_WIDTH = 320
const SCREEN_HEIGHT = 180
var score = 0

var restart = false
# Called when the node enters the scene tree for the first time.
func _ready():
	add_user_signal("score")
	get_node("spawn_timer").connect("timeout", _on_spawn_timer_timeout,)
	get_node("player").connect("destroyed", _on_player_destroyed)
	get_node("player").connect("hit", _on_player_hit)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_node("pause_menu").visible = true
		get_tree().paused = true

func _on_spawn_timer_timeout():
	var asteroid_instance = asteroid.instantiate()
	asteroid_instance.position = Vector2(SCREEN_WIDTH + 8, randi_range(0, SCREEN_HEIGHT))
	asteroid_instance.connect("score", _on_player_score)
	add_child(asteroid_instance)
	
func _on_player_score():
	score += 1
	get_node("ui/score").text = "Score: " + str(score) + " Lives: " + str(get_node("player").lives)  

# handle player being hit 
func _on_player_hit():
	get_node("ui/score").text = "Score: " + str(score) + " Lives: " + str(get_node("player").lives)
	
# Handle player being destroyed
func  _on_player_destroyed():
	get_node("ui/retry").visible = true


func _on_quit_pressed():
	get_tree().exit()


func _on_resume_pressed():
	get_node("pause_menu").visible = false
	get_tree().paused = false
