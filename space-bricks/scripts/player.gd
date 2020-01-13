extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var moving: bool = false
var input_direction: int = 0
var direction: int = 0
var speed: int = 0
var velocity: int = 0
const MAX_SPEED: int = 20000
var ACCELERATION: int = 20000 
var DECELERATION: int = 20000

func _ready() -> void: 
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_process(true)
	pass

func _process(delta) -> void: 
	if input_direction:
		moving = true
		direction = input_direction
	else:
		moving = false
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if Input.is_action_pressed("ui_left"):
		input_direction = -1 
	elif Input.is_action_pressed("ui_right"):
		input_direction = 1
	else:
		input_direction = 0
		
	if moving:
		speed += ACCELERATION * delta
	else:
		speed -= DECELERATION * delta
		
	speed = clamp(speed, 0, MAX_SPEED)
	
	velocity = speed * delta * direction
	
	move_and_slide(Vector2(velocity, 0))
