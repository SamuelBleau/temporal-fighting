extends CharacterBody2D


const SPEED = 350.0
const JUMP_VELOCITY = -900.0

@onready var sprite = $Sprite2D
@onready var anim = get_node("AnimationPlayer")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if velocity.y != 0:
		if Input.is_action_just_pressed("jab"):
			anim.play("jump_kick")
		if Input.is_action_just_pressed("kick"):
			anim.play("dive_kick")

	# Handle Jump.
	if Input.is_action_just_pressed("upgirl") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		if anim.current_animation != "jump_kick" and anim.current_animation != "dive_kick":
			anim.play("jump")
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("leftGirl", "rightGirl")
	
	if direction != 0:
		sprite.flip_h = (direction == -1)
	
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, 75)
		if velocity.y == 0:
			if Input.is_action_just_pressed("jab"):
				anim.play("jab")
			if Input.is_action_just_pressed("kick"):
				anim.play("kick")
			if anim.current_animation != "jab" and anim.current_animation != "kick" and anim.current_animation != "dive_kick" and anim.current_animation != "jump_kick":
				anim.play("Idle")

	move_and_slide()
