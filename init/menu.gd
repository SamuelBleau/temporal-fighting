extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("quit"):
		get_tree().quit()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")

func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://init/options.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
