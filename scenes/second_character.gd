extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -650.0

@onready var sprite = $Sprite2D
@onready var anim = get_node("AnimationPlayer")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func take_damage(amount: int) -> void:
	anim.play("hit")
	print("damage: ", amount)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("upKnight") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("leftKnight", "rightKnight")
	
	if direction != 0:
		sprite.flip_h = (direction == -1)
	
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, 75)
		if velocity.y == 0:
			if Input.is_action_just_pressed("attack"):
				anim.play("attack")
			if Input.is_action_just_pressed("attack2"):
				anim.play("attack_2")
			if anim.current_animation != "attack" and anim.current_animation != "attack_2" and anim.current_animation == "hit":
				anim.play("idle")

	move_and_slide()
