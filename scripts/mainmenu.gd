extends CanvasLayer


const  SAVE_FILE_PATH = "user://asteroid.save"

# Called when the node enters the scene tree for the first time.
func _ready():
	if !FileAccess.file_exists(SAVE_FILE_PATH):
		# Hide the start button
		get_node("buttons").visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/stage.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_name_input_text_changed():
	var nameInput = get_node("setup/nameInput")
	
	if nameInput.text.length() > 1:
		get_node("setup/join").visible = true
	else:
		get_node("setup/join").visible = false


func _on_join_pressed():
	var db = {"username": get_node("setup/nameInput").text}
	# create the user save file
	var user_stat_file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE_READ)
	
	if user_stat_file.is_open():
		user_stat_file.store_var(db,true)
	else:
		print_debug(FileAccess.get_open_error())
		
	# display the intro text
	get_tree().change_scene_to_file("res://scenes/stage.tscn")
