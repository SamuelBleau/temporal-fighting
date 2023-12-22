extends Control

var Resolutions: Dictionary = { "1920x1080":Vector2(1920, 1080),
								"1600x900":Vector2(1600, 900),
								"1280x720":Vector2(1280, 720),
								"1152x648":Vector2(1152, 648),
								"1024x600":Vector2(1024, 600),
								"800x600":Vector2(800, 600)}

# Called when the node enters the scene tree for the first time.
func _ready():
	AddResolution()
	$VBoxContainer/Button.add_theme_color_override("font_color", Color("ef8614"))

@onready var Resoptionbutton = $HBoxContainer/OptionButton
@onready var cpt_button = 0

func AddResolution():
	var CurrentResolution = DisplayServer.window_get_size()
	
	var Index = 0
	for r in Resolutions:
		Resoptionbutton.add_item(r)
		var resolutionAsVector2i = Vector2i(Resolutions[r].x, Resolutions[r].y)
		
		if resolutionAsVector2i == CurrentResolution:
			Resoptionbutton.select(Index)
		Index += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().change_scene_to_file("res://init/menu.tscn")

func _input(event):
	if cpt_button == 0:
		$VBoxContainer/Button.add_theme_color_override("font_color", Color("ef8614"))
		if event.is_action_pressed("enter"):
			get_tree().change_scene_to_file("res://init/menu.tscn")
		if event.is_action_pressed("key_up"):
			cpt_button = 1
			$VBoxContainer/Button.add_theme_color_override("font_color", Color("ffffff"))
			return
		if event.is_action_pressed("key_down"):
			cpt_button = 2
			$VBoxContainer/Button.add_theme_color_override("font_color", Color("ffffff"))
			return
	if cpt_button == 1:
		$VBoxContainer/SfxText.add_theme_color_override("font_color", Color("ef8614"))
		if event.is_action_pressed("key_up"):
			cpt_button = 2
			$VBoxContainer/SfxText.add_theme_color_override("font_color", Color("ffffff"))
			return
		if event.is_action_pressed("key_down"):
			cpt_button = 0
			$VBoxContainer/SfxText.add_theme_color_override("font_color", Color("ffffff"))
			return
	if cpt_button == 2:
		$VBoxContainer/MusicText.add_theme_color_override("font_color", "ef8614")
		if event.is_action_pressed("key_up"):
			cpt_button = 0
			$VBoxContainer/MusicText.add_theme_color_override("font_color", "ffffff")
			return
		if event.is_action_pressed("key_down"):
			cpt_button = 1
			$VBoxContainer/MusicText.add_theme_color_override("font_color", "ffffff")
			return

func _on_button_pressed():
	get_tree().change_scene_to_file("res://init/menu.tscn") # Replace with function body.


func _on_option_button_item_selected(index):
	var size = Resolutions.get(Resoptionbutton.get_item_text(index))
	get_window().set_size(size)

func Centre_window():
	var Centre_screen = DisplayServer.screen_get_position()+DisplayServer.screen_get_size()/2
	var Window_size = get_window().get_position_with_decorations()
	get_window().set_ime_position(Centre_screen-Window_size/2)
