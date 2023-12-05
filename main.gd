extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("quit"):
		get_tree().change_scene_to_file("res://init/menu.tscn")
	if ($Timer.time_left < 10):
		$timer.text = "0" + str(int($Timer.time_left))
	if ($Timer.time_left > 10):
		$timer.text = str(int($Timer.time_left))


func _on_timer_timeout():
	$Timer.stop()
	$timer.text = "0"
