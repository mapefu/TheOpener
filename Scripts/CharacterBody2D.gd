extends CharacterBody2D

@export var VolverAJugar :PackedScene
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 980


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Saltar") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Esquerra", "Dreta")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if not direction:
		$AnimatedSprite2D.stop()
	elif Input.is_action_pressed("Dreta"):
		$AnimatedSprite2D.play('Caminar')
		$AnimatedSprite2D.set_flip_h(true)
	elif Input.is_action_pressed("Esquerra"):
		$AnimatedSprite2D.play('Caminar')
		$AnimatedSprite2D.set_flip_h(false)
	
	if position.y > 1000:
		get_tree().change_scene_to_packed(VolverAJugar)
	
