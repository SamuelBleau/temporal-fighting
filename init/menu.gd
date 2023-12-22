extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _input(event):
	var choice = 0
	if event is InputEventMouseMotion:
		$VBoxContainer/StartButton.release_focus()
		$VBoxContainer/OptionsButton.release_focus()
		$VBoxContainer/QuitButton.release_focus()
		choice = 1
	if event.is_action_released("key") and $VBoxContainer/StartButton.has_focus() == false and $VBoxContainer/OptionsButton.has_focus() == false and $VBoxContainer/QuitButton.has_focus() == false:
		$VBoxContainer/StartButton.grab_focus()
		choice = 0

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")

func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://init/options.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
