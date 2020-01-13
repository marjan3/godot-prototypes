extends KinematicBody2D


# class member variables go here, for example:
var direction = Vector2(0, -1)
var velocity = Vector2(0, -100)
# var b = "textvar"

signal enemy_touched()

func _ready():
	set_process(true)

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
# using move_and_collide
	var collision = move_and_collide(velocity * delta)
	if collision:

		var collider = collision.collider
		
		if collider.is_in_group("enemies"):
			print("Collided with the enemies!: " + str(collider))
			handle_enemy_collision(collider, self, delta)
		elif collider.is_in_group("platforms"):
			print("Collided with the platforms")
			handle_platform_collision(collider, self, delta)
		elif collider.is_in_group("players"):
			print("Collided with the players!")
			handle_player_collision(collider, self, delta)
		elif collider.is_in_group("falls"):
			print("Collided with the fall!")
			handle_out_of_bounds_collision(collider, self, delta)
			return
		
		var reflect = collision.remainder.bounce(collision.normal)
		velocity = velocity.bounce(collision.normal)
		velocity.x += 1
		move_and_collide(reflect)

func handle_platform_collision(platform, meteor, delta):
	pass
	
func handle_enemy_collision(enemy: CollisionObject2D, meteor, delta) -> void:
	emit_signal("enemy_touched", enemy)

func handle_player_collision(player, meteor, delta):
	var diff = 0

	var random_number = randi()%9+1
	if meteor.position.x < player.position.x:
#       Meteor is on the left-hand side of the paddle
        diff = player.position.x - meteor.position.x
        velocity.x = (-10 * diff)
	elif meteor.position.x > player.position.x:
#       Meteor is on the right-hand side of the player
        diff = meteor.position.x - player.position.x
        velocity.x = (10 * diff)
	else:
#		Meteor is perfectly in the middle
#       Add a little random X to stop it bouncing straight up!
		velocity.x = 2 + random_number
	
func handle_out_of_bounds_collision(platform, meteor, delta):
	print("Ball has fallen!")

